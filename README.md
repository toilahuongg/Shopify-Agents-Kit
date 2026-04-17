# Shopify Claude Code Kit

[![npm version](https://img.shields.io/npm/v/shopify-cc-kit.svg)](https://www.npmjs.com/package/shopify-cc-kit)
[![License: ISC](https://img.shields.io/badge/License-ISC-blue.svg)](https://opensource.org/licenses/ISC)

A powerful collection of **93 Skills** and **11 Agents** designed to supercharge your AI coding assistant for Shopify app development and beyond.

## Quick Start

### Installation

```bash
# Install globally
npm install -g shopify-cc-kit

# Or add to your project
npm install shopify-cc-kit
```

### Setup

Copy the `.claude` directory to your project root:

```bash
cp -r node_modules/shopify-cc-kit/.claude .
```

Or use in any Claude Code / Cursor environment by referencing the installed package.

## Features

The kit is organized into two main pillars: **Agents** (specialized personas) and **Skills** (capabilities & domain knowledge).

### Agents (11 Total)

Located in `.claude/agents/`, these are specialized personas equipped with specific skills:

| Agent | Description |
|-------|-------------|
| **shopify-developer** | Expert Shopify App Developer (Remix, APIs, Extensions) |
| **tech-lead** | System architecture analysis, security audits, risk assessment |
| **product-designer** | UI/UX design with Polaris compliance |
| **qa-specialist** | Testing, verification, quality assurance |
| **3d-developer** | Three.js / React Three Fiber specialist |
| **project-manager** | Task breakdown, planning, progress tracking |
| **technical-writer** | Internal documentation specialist |
| **end-user-writer** | User-facing documentation with Docusaurus |
| **media-specialist** | Video (Remotion) and algorithmic art |
| **growth-hacker** | Product growth and user acquisition |
| **brainstorm** | Creative problem solving facilitator |

### Skills (93 Total)

Located in `.claude/skills/`, organized by category:

#### Shopify Ecosystem (30 skills)

**Official Shopify Skills (with validation scripts):**

| Skill | Description |
|-------|-------------|
| `shopify-admin` | Admin GraphQL API with search & validation |
| `shopify-admin-execution` | Execute validated Admin GraphQL operations |
| `shopify-custom-data` | Metafields & Metaobjects with TOML definitions |
| `shopify-customer` | Customer Account API |
| `shopify-dev` | Search Shopify developer documentation |
| `shopify-functions` | Backend logic (Discounts, Shipping, Payment) |
| `shopify-hydrogen` | Hydrogen storefront implementation |
| `shopify-liquid` | Liquid templating with validation |
| `shopify-partner` | Partner API for app management |
| `shopify-payments-apps` | Payments Apps API |
| `shopify-polaris-admin-extensions` | Admin UI extensions (actions, blocks) |
| `shopify-polaris-app-home` | Primary app interface in Admin |
| `shopify-polaris-checkout-extensions` | Checkout UI extensions |
| `shopify-polaris-customer-account-extensions` | Customer account extensions |
| `shopify-pos-ui` | POS UI extensions |
| `shopify-storefront-graphql` | Storefront GraphQL API |
| `shopify-onboarding-dev` | Developer onboarding guide |
| `shopify-merchant-onboarding` | Merchant store setup |
| `shopify-app-review` | Pre-submission compliance check |

**Additional Shopify Skills:**

| Skill | Description |
|-------|-------------|
| `shopify-api` | Admin GraphQL/REST & Storefront APIs |
| `shopify-remix-template` | Official Shopify Remix template |
| `shopify-billing` | App monetization (subscriptions, charges) |
| `shopify-webhooks` | Webhook handling & HMAC verification |
| `shopify-extensions` | Admin, Checkout, Theme extensions overview |
| `shopify-app-bridge` | Embed apps in Shopify Admin |
| `shopify-polaris-design` | Polaris Design System patterns |
| `shopify-polaris-icons` | Polaris Icons usage |
| `shopify-polaris-viz` | Data visualizations |
| `shopify-testing` | Unit, integration, E2E testing |
| `shopify-app-i18n` | Multi-language support |

#### State, Forms & Security (4 skills)

| Skill | Description |
|-------|-------------|
| `zustand-state` | State management with Zustand |
| `form-validation` | Zod + Conform for Remix forms |
| `security-hardening` | OWASP, authentication, encryption |
| `resilience-engineering` | Rate limits, retry, circuit breakers |

#### Frontend & Design (8 skills)

| Skill | Description |
|-------|-------------|
| `frontend-design` | Production-grade frontend interfaces |
| `design` | UI mockups and design |
| `canvas-design` | Static visual art & design |
| `algorithmic-art` | p5.js generative art |
| `remotion-best-practices` | Video creation in React |
| `vercel-react-best-practices` | React/Next.js optimization |
| `vercel-ai-sdk` | Vercel AI SDK integration |
| `email-template-design` | HTML email templates |

#### Three.js Suite (10 skills)

| Skill | Description |
|-------|-------------|
| `threejs-fundamentals` | Scene setup, cameras, renderer |
| `threejs-geometry` | Built-in shapes, BufferGeometry |
| `threejs-materials` | PBR, basic, phong, shader materials |
| `threejs-lighting` | Light types, shadows, environment |
| `threejs-animation` | Keyframe animation, skeletal |
| `threejs-interaction` | Raycasting, controls, events |
| `threejs-loaders` | GLTF, textures, images |
| `threejs-textures` | Texture types, UV mapping |
| `threejs-shaders` | GLSL, ShaderMaterial, uniforms |
| `threejs-postprocessing` | EffectComposer, bloom, etc. |

#### Backend & Languages (6 skills)

| Skill | Description |
|-------|-------------|
| `typescript` | TypeScript 5.x+ best practices |
| `remixjs-best-practices` | Remix / React Router v7 |
| `mongoose` | MongoDB ODM 8.x+ |
| `clean-architecture-ts` | Clean Architecture in TypeScript |
| `clean-code` | Clean code practices |
| `misoapps` | Miso Apps SDK integration |

#### Documentation & Research (6 skills)

| Skill | Description |
|-------|-------------|
| `docusaurus-generator` | End-user documentation sites |
| `technical-writing` | Internal technical docs |
| `docs-out` | Documentation generation |
| `research` | Research and synthesis |
| `brainstorm` | Creative brainstorming |
| `rigorous-reasoning` | Philosophical reasoning |

#### Matt Pocock's Planning & Development Skills (14 skills)

| Skill | Description |
|-------|-------------|
| `write-a-prd` | Create PRD through user interview and codebase exploration |
| `prd-to-plan` | Turn PRD into multi-phase implementation plan |
| `prd-to-issues` | Break PRD into GitHub issues using tracer-bullet slices |
| `grill-me` | Interview user relentlessly about a plan or design |
| `design-an-interface` | Generate multiple radically different interface designs |
| `request-refactor-plan` | Create detailed refactor plan with tiny commits |
| `tdd` | Test-driven development with red-green-refactor loop |
| `triage-issue` | Triage bugs by exploring codebase to find root cause |
| `improve-codebase-architecture` | Find opportunities for architectural improvement |
| `setup-pre-commit` | Set up Husky pre-commit hooks with lint-staged |
| `git-guardrails-claude-code` | Block dangerous git commands before they execute |
| `edit-article` | Edit and improve articles by restructuring sections |
| `ubiquitous-language` | Extract DDD-style ubiquitous language glossary |
| `obsidian-vault` | Search, create, and manage notes in Obsidian |

#### Meta-Skills (5 skills)

| Skill | Description |
|-------|-------------|
| `agent-creator` | Create new agents |
| `skill-creator` | Create new skills |
| `rule-creator` | Create behavior rules |
| `agent-browser` | Browser automation |
| `code-investigator` | Code analysis and audits |

#### Utilities (6 skills)

| Skill | Description |
|-------|-------------|
| `app-listing` | App Store listing content |
| `changelog` | Changelog generation |
| `explain` | Code explanation |
| `npm-publish` | NPM package publishing |
| `readme` | README updates |
| `release` | Release management |

### Slash Commands

Quick shortcuts for common tasks:

| Command | Description |
|---------|-------------|
| `/git-cm` | Commit with conventional message |
| `/git-pr` | Generate PR description |
| `/git-sync` | Sync with remote (pull --rebase) |
| `/git-undo` | Undo last commit |
| `/release` | Manage release versions |
| `/changelog` | Generate changelog |
| `/readme` | Update README |
| `/explain` | Explain code in detail |
| `/design` | Create UI mockups |
| `/brainstorm` | Facilitate brainstorming |
| `/write-a-prd` | Create product requirements document |
| `/prd-to-plan` | Convert PRD to implementation plan |
| `/tdd` | Test-driven development workflow |
| `/grill-me` | Stress-test a plan or design |

## Project Structure

```
.claude/
├── agents/           # 11 Specialized Agent Personas
│   ├── shopify-developer.md
│   ├── tech-lead.md
│   ├── product-designer.md
│   └── ...
├── skills/           # 93 Skills & Capabilities
│   ├── shopify-admin/          # Official Shopify skills
│   ├── shopify-custom-data/    # with validation scripts
│   ├── shopify-polaris-*/
│   ├── write-a-prd/            # Matt Pocock's skills
│   ├── tdd/
│   └── ...
└── settings.local.json
```

## Ship Fast Workflow

The fastest path from idea to published Shopify app, using this kit's skills and agents.

### Phase 1: Define (30 min)

```bash
# 1. Create Product Requirements Document
/write-a-prd

# 2. Stress-test your idea
/grill-me

# 3. Convert PRD to implementation plan
/prd-to-plan
```

### Phase 2: Scaffold (10 min)

```bash
# Initialize Shopify app with Remix template
shopify app init

# Generate extensions as needed
shopify app generate extension
```

**Skills auto-activated:** `shopify-remix-template`, `shopify-onboarding-dev`

### Phase 3: Build (Hours → Days)

| Task | Command/Skill |
|------|---------------|
| **App Home UI** | `shopify-polaris-app-home` - Polaris web components with validation |
| **Admin Extensions** | `shopify-polaris-admin-extensions` - Action/block extensions |
| **Checkout Extensions** | `shopify-polaris-checkout-extensions` - Checkout UI |
| **Custom Data** | `shopify-custom-data` - Metafields/Metaobjects via TOML |
| **Backend Logic** | `shopify-functions` - Discounts, Shipping, Payment customization |
| **Billing** | `shopify-billing` - Subscriptions, usage charges |
| **Webhooks** | `shopify-webhooks` - Event handling with HMAC verification |
| **API Calls** | `shopify-admin` - GraphQL with search & validation |

```bash
# Test-driven development
/tdd

# Design multiple UI approaches
/design-an-interface
```

### Phase 4: Quality (1-2 hours)

```bash
# Security audit
"Use tech-lead agent to audit this codebase"

# Pre-submission compliance check
/shopify-app-review

# Run tests
shopify app dev
```

**Skills auto-activated:** `shopify-testing`, `security-hardening`

### Phase 5: Ship (30 min)

```bash
# 1. Deploy app
shopify app deploy

# 2. Generate App Store listing
/app-listing

# 3. Generate changelog
/changelog

# 4. Create release
/release
```

### Phase 6: Grow (Ongoing)

```bash
# User documentation site
/docusaurus-generator

# Growth strategy
"Use growth-hacker agent for user acquisition plan"

# Iterate based on feedback
/triage-issue
```

### Quick Reference

| Stage | Time | Key Commands |
|-------|------|--------------|
| Define | 30m | `/write-a-prd` → `/grill-me` → `/prd-to-plan` |
| Scaffold | 10m | `shopify app init` → `shopify app generate extension` |
| Build | 1-5d | Skills auto-load based on context |
| Quality | 1-2h | `/shopify-app-review` → tech-lead audit |
| Ship | 30m | `shopify app deploy` → `/app-listing` → `/release` |
| Grow | ∞ | `/docusaurus-generator` → growth-hacker agent |

---

## Usage

### With Claude Code

1. Install the package
2. Copy `.claude` to your project
3. Skills are automatically loaded based on context

### With Cursor

1. Copy `.claude` directory to your workspace
2. Reference agents in your prompts: *"Act as the shopify-developer agent"*
3. Use slash commands: `/git-cm`, `/changelog`, etc.

### Agent Selection

```
# For Shopify development
"Use the shopify-developer agent to implement OAuth flow"

# For code review
"Use the tech-lead agent to audit this codebase"

# For UI design
"Use the product-designer agent to create a dashboard layout"
```

## Changelog

See [CHANGELOG.md](./CHANGELOG.md) for release history.

## Contributing

Contributions are welcome! Use the meta-skills to create new agents or skills:

```
# Create a new skill
/skill-creator

# Create a new agent
/agent-creator
```

## License

ISC License - see [LICENSE](./LICENSE) for details.

---

**Package:** [shopify-cc-kit on npm](https://www.npmjs.com/package/shopify-cc-kit)
