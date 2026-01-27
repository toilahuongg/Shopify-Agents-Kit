# Refactoring Patterns

Practical before/after examples for common refactoring scenarios in TypeScript/JavaScript.

## 1. Extract Early Returns (Guard Clauses)

```typescript
// ❌ Deep nesting
function getPayAmount(employee: Employee) {
  let result: number;
  if (employee.isSeparated) {
    result = separatedAmount();
  } else {
    if (employee.isRetired) {
      result = retiredAmount();
    } else {
      result = normalAmount();
    }
  }
  return result;
}

// ✅ Guard clauses
function getPayAmount(employee: Employee) {
  if (employee.isSeparated) return separatedAmount();
  if (employee.isRetired) return retiredAmount();
  return normalAmount();
}
```

## 2. Replace Conditionals with Object Lookup

```typescript
// ❌ Long switch/if-else
function getStatusMessage(status: string) {
  switch (status) {
    case 'pending': return 'Waiting for approval';
    case 'approved': return 'Request approved';
    case 'rejected': return 'Request denied';
    default: return 'Unknown status';
  }
}

// ✅ Object lookup
const STATUS_MESSAGES: Record<string, string> = {
  pending: 'Waiting for approval',
  approved: 'Request approved',
  rejected: 'Request denied',
};

function getStatusMessage(status: string) {
  return STATUS_MESSAGES[status] ?? 'Unknown status';
}
```

## 3. Extract Options Object

```typescript
// ❌ Too many parameters
function createUser(
  name: string,
  email: string,
  age: number,
  isAdmin: boolean,
  department: string
) { ... }

// ✅ Options object
interface CreateUserOptions {
  name: string;
  email: string;
  age: number;
  isAdmin?: boolean;
  department?: string;
}

function createUser(options: CreateUserOptions) { ... }
```

## 4. Replace Magic Numbers/Strings

```typescript
// ❌ Magic values
if (user.role === 2) { ... }
if (retryCount > 3) { ... }
setTimeout(callback, 86400000);

// ✅ Named constants
const ROLES = { ADMIN: 2, USER: 1 } as const;
const MAX_RETRIES = 3;
const ONE_DAY_MS = 24 * 60 * 60 * 1000;

if (user.role === ROLES.ADMIN) { ... }
if (retryCount > MAX_RETRIES) { ... }
setTimeout(callback, ONE_DAY_MS);
```

## 5. Extract Function (Single Responsibility)

```typescript
// ❌ Function does too much
async function processOrder(order: Order) {
  // Validate
  if (!order.items.length) throw new Error('Empty order');
  if (!order.customer) throw new Error('No customer');

  // Calculate totals
  let subtotal = 0;
  for (const item of order.items) {
    subtotal += item.price * item.quantity;
  }
  const tax = subtotal * 0.1;
  const total = subtotal + tax;

  // Save to database
  await db.orders.create({ ...order, subtotal, tax, total });

  // Send confirmation
  await sendEmail(order.customer.email, 'Order confirmed', ...);
}

// ✅ Single responsibility functions
async function processOrder(order: Order) {
  validateOrder(order);
  const totals = calculateOrderTotals(order);
  const savedOrder = await saveOrder(order, totals);
  await sendOrderConfirmation(savedOrder);
}
```

## 6. Replace Nested Ternaries

```typescript
// ❌ Nested ternary
const label = status === 'active'
  ? 'Active'
  : status === 'pending'
    ? 'Pending'
    : status === 'archived'
      ? 'Archived'
      : 'Unknown';

// ✅ Object lookup or function
const LABELS: Record<string, string> = {
  active: 'Active',
  pending: 'Pending',
  archived: 'Archived',
};
const label = LABELS[status] ?? 'Unknown';
```

## 7. Consolidate Duplicate Logic

```typescript
// ❌ Duplicated conditions
function canEdit(user: User, doc: Document) {
  if (user.role === 'admin') return true;
  if (user.id === doc.ownerId) return true;
  return false;
}

function canDelete(user: User, doc: Document) {
  if (user.role === 'admin') return true;
  if (user.id === doc.ownerId) return true;
  return false;
}

// ✅ Extract common logic
function isOwnerOrAdmin(user: User, doc: Document) {
  return user.role === 'admin' || user.id === doc.ownerId;
}

const canEdit = isOwnerOrAdmin;
const canDelete = isOwnerOrAdmin;
```

## 8. Simplify Boolean Returns

```typescript
// ❌ Unnecessary conditional
function isAdult(age: number) {
  if (age >= 18) {
    return true;
  } else {
    return false;
  }
}

// ✅ Direct return
function isAdult(age: number) {
  return age >= 18;
}
```

## 9. Use Array Methods

```typescript
// ❌ Manual loop
const activeUsers = [];
for (const user of users) {
  if (user.isActive) {
    activeUsers.push(user.name);
  }
}

// ✅ Array methods
const activeUsers = users
  .filter(user => user.isActive)
  .map(user => user.name);
```

## 10. Destructure for Clarity

```typescript
// ❌ Repetitive property access
function formatUser(user: User) {
  return `${user.firstName} ${user.lastName} (${user.email})`;
}

// ✅ Destructured
function formatUser({ firstName, lastName, email }: User) {
  return `${firstName} ${lastName} (${email})`;
}
```
