# Remix Integration Patterns

Patterns for integrating Miso Apps SDKs with Remix applications.

## Service Layer Setup

Create singleton instances in `app/services/`:

```typescript
// app/services/mail.server.ts
import { createMailClient, type MailClient } from '@misoapps/mail-sdk';

let mailClient: MailClient | null = null;

export function getMailClient(shopDomain: string): MailClient {
  // Create new client per shop (shopDomain is required for SMTP APIs)
  return createMailClient({
    endpoint: process.env.MAIL_SERVICE_ENDPOINT!,
    shopDomain,
  });
}

// For system emails (no shop required)
export function getSystemMailClient(): MailClient {
  if (!mailClient) {
    mailClient = createMailClient({
      endpoint: process.env.MAIL_SERVICE_ENDPOINT!,
    });
  }
  return mailClient;
}
```

```typescript
// app/services/shop.server.ts
import { createShopServices } from '@misoapps/shop-sdk';

let shopServices: ReturnType<typeof createShopServices> | null = null;

export function getShopServices() {
  if (!shopServices) {
    shopServices = createShopServices(
      process.env.SHOP_SERVICE_ENDPOINT!,
      'shopify'
    );
  }
  return shopServices;
}
```

## Loader Patterns

### Fetching Shop Data

```typescript
// app/routes/app.settings.tsx
import { json, type LoaderFunctionArgs } from '@remix-run/node';
import { useLoaderData } from '@remix-run/react';
import { authenticate } from '~/shopify.server';
import { getShopServices } from '~/services/shop.server';
import { getMailClient } from '~/services/mail.server';

export async function loader({ request }: LoaderFunctionArgs) {
  const { session } = await authenticate.admin(request);
  const shopServices = getShopServices();
  const mailClient = getMailClient(session.shop);

  const [shopResult, smtpConfig] = await Promise.all([
    shopServices.getShop(session.shop),
    mailClient.getSmtpConfig().catch(() => null),
  ]);

  return json({ shop: shopResult.shop, smtpConfig });
}

export default function Settings() {
  const { shop, smtpConfig } = useLoaderData<typeof loader>();
  // ...
}
```

### Paginated Shop List (Admin Dashboard)

```typescript
// app/routes/admin.shops.tsx
import { json, type LoaderFunctionArgs } from '@remix-run/node';
import { getShopServices } from '~/services/shop.server';
import type { Platform } from '@misoapps/shop-sdk';

export async function loader({ request }: LoaderFunctionArgs) {
  const url = new URL(request.url);
  const page = parseInt(url.searchParams.get('page') ?? '1', 10);

  const shopServices = getShopServices();
  const { shops, total, pages } = await shopServices.listShops({
    page,
    limit: 20,
    platform: url.searchParams.get('platform') as Platform | undefined,
  });

  return json({ shops, total, page, pages });
}
```

### Email Logs

```typescript
// app/routes/app.email-logs.tsx
import { json, type LoaderFunctionArgs } from '@remix-run/node';
import { authenticate } from '~/shopify.server';
import { getMailClient } from '~/services/mail.server';
import type { EmailStatus, EmailType } from '@misoapps/mail-sdk';

export async function loader({ request }: LoaderFunctionArgs) {
  const { session } = await authenticate.admin(request);
  const url = new URL(request.url);

  const mailClient = getMailClient(session.shop);
  const logs = await mailClient.getEmailLogs({
    status: url.searchParams.get('status') as EmailStatus | undefined,
    type: url.searchParams.get('type') as EmailType | undefined,
    page: parseInt(url.searchParams.get('page') ?? '1', 10),
    limit: 50,
  });

  return json(logs);
}
```

## Action Patterns

### Send Email Action

```typescript
// app/routes/api.send-email.tsx
import { json, type ActionFunctionArgs } from '@remix-run/node';
import { authenticate } from '~/shopify.server';
import { getMailClient } from '~/services/mail.server';

export async function action({ request }: ActionFunctionArgs) {
  const { session } = await authenticate.admin(request);
  const formData = await request.formData();

  const mailClient = getMailClient(session.shop);

  try {
    const response = await mailClient.sendEmail({
      to: formData.get('to') as string,
      fromEmail: formData.get('fromEmail') as string,
      fromName: (formData.get('fromName') as string) || undefined,
      subject: formData.get('subject') as string,
      html: formData.get('html') as string,
      text: (formData.get('text') as string) || undefined,
    });

    return json(response);
  } catch (error) {
    return json(
      { success: false, error: error instanceof Error ? error.message : 'Unknown error' },
      { status: 500 }
    );
  }
}
```

### SMTP Configuration Action

```typescript
// app/routes/app.settings.smtp.tsx
import { json, type ActionFunctionArgs } from '@remix-run/node';
import { authenticate } from '~/shopify.server';
import { getMailClient } from '~/services/mail.server';

export async function action({ request }: ActionFunctionArgs) {
  const { session } = await authenticate.admin(request);
  const formData = await request.formData();
  const intent = formData.get('intent');

  const mailClient = getMailClient(session.shop);

  switch (intent) {
    case 'save': {
      const config = await mailClient.upsertSmtpConfig({
        host: formData.get('host') as string,
        port: parseInt(formData.get('port') as string, 10),
        secure: formData.get('secure') === 'true',
        username: formData.get('username') as string,
        password: formData.get('password') as string,
      });
      return json({ success: true, config });
    }

    case 'update': {
      const config = await mailClient.updateSmtpConfig({
        host: (formData.get('host') as string) || undefined,
        port: formData.get('port') ? parseInt(formData.get('port') as string, 10) : undefined,
        secure: formData.has('secure') ? formData.get('secure') === 'true' : undefined,
        username: (formData.get('username') as string) || undefined,
        password: (formData.get('password') as string) || undefined,
        isActive: formData.has('isActive') ? formData.get('isActive') === 'true' : undefined,
      });
      return json({ success: true, config });
    }

    case 'test': {
      const result = await mailClient.testSmtpConnection();
      return json(result);
    }

    case 'delete': {
      const result = await mailClient.deleteSmtpConfig();
      return json(result);
    }

    default:
      return json({ error: 'Invalid intent' }, { status: 400 });
  }
}
```

## Webhook Integration

### Handle App Install

```typescript
// app/routes/auth.callback.tsx (after OAuth callback)
import { redirect, type LoaderFunctionArgs } from '@remix-run/node';
import { authenticate } from '~/shopify.server';
import { getShopServices } from '~/services/shop.server';
import type { AppID } from '@misoapps/shop-sdk';

export async function loader({ request }: LoaderFunctionArgs) {
  const { session, admin } = await authenticate.admin(request);

  // Get shop info from Shopify
  const response = await admin.graphql(`
    query {
      shop {
        name
        email
      }
    }
  `);
  const { data } = await response.json();

  // Register with Shop Service
  const shopServices = getShopServices();
  await shopServices.installApp({
    shop: session.shop,
    shopName: data.shop.name,
    contactEmail: data.shop.email,
    app: {
      appId: 'llmstxt' as AppID,
      plan: 'free',
      accessToken: session.accessToken,
    },
  });

  return redirect('/app');
}
```

### Handle App Uninstall

```typescript
// app/routes/webhooks.app-uninstalled.tsx
import { type ActionFunctionArgs } from '@remix-run/node';
import { authenticate } from '~/shopify.server';
import { getShopServices } from '~/services/shop.server';
import type { AppID } from '@misoapps/shop-sdk';

export async function action({ request }: ActionFunctionArgs) {
  const { shop, topic } = await authenticate.webhook(request);

  if (topic === 'APP_UNINSTALLED') {
    const shopServices = getShopServices();
    await shopServices.uninstallApp({
      shop,
      appId: 'llmstxt' as AppID,
    });
  }

  return new Response(null, { status: 200 });
}
```

### Update App Plan (after billing confirmation)

```typescript
// app/routes/app.billing.callback.tsx
import { redirect, type LoaderFunctionArgs } from '@remix-run/node';
import { authenticate } from '~/shopify.server';
import { getShopServices } from '~/services/shop.server';
import type { AppID } from '@misoapps/shop-sdk';

export async function loader({ request }: LoaderFunctionArgs) {
  const { session, billing } = await authenticate.admin(request);
  const url = new URL(request.url);
  const plan = url.searchParams.get('plan') ?? 'free';

  // Verify billing with Shopify...

  // Update plan in Shop Service
  const shopServices = getShopServices();
  await shopServices.updateApp(session.shop, 'llmstxt' as AppID, {
    plan,
  });

  return redirect('/app');
}
```

## Admin Dashboard Stats

```typescript
// app/routes/admin.dashboard.tsx
import { json, type LoaderFunctionArgs } from '@remix-run/node';
import { getShopServices } from '~/services/shop.server';

export async function loader({ request }: LoaderFunctionArgs) {
  const shopServices = getShopServices();

  const [stats, recentUninstalls] = await Promise.all([
    shopServices.getStats(),
    shopServices.findUninstalledShops('llmstxt'),
  ]);

  return json({
    stats,
    recentUninstalls: recentUninstalls.shops,
  });
}
```
