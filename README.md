# Shopify Claude Code Kit

[![npm version](https://img.shields.io/npm/v/shopify-cc-kit.svg)](https://www.npmjs.com/package/shopify-cc-kit)
[![License: ISC](https://img.shields.io/badge/License-ISC-blue.svg)](https://opensource.org/licenses/ISC)

A powerful collection of **62 Skills** and **11 Agents** designed to supercharge your AI coding assistant for Shopify app development and beyond.

## 🚀 Quick Start

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

## ✨ Features

The kit is organized into two main pillars: **Agents** (specialized personas) and **Skills** (capabilities & domain knowledge).

### 🤖 Agents (11 Total)

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

### 🧠 Skills (62 Total)

Located in `.claude/skills/`, organized by category:

#### 🛍️ Shopify Ecosystem (13 skills)
| Skill | Description |
|-------|-------------|
| `shopify-api` | Admin GraphQL/REST & Storefront APIs |
| `shopify-remix-template` | Official Shopify Remix template |
| `shopify-billing` | App monetization (subscriptions, charges) |
| `shopify-webhooks` | Webhook handling & HMAC verification |
| `shopify-extensions` | Admin, Checkout, Theme extensions |
| `shopify-functions` | Backend logic (Discounts, Shipping, Payment) |
| `shopify-liquid` | Theme App Extensions & Liquid |
| `shopify-metafields` | Custom data storage |
| `shopify-app-bridge` | Embed apps in Shopify Admin |
| `shopify-polaris-design` | Polaris Design System |
| `shopify-testing` | Unit, integration, E2E testing |
| `shopify-app-i18n` | Multi-language support |
| `shopify-app-deployment` | Deployment strategies |

#### 🔐 State, Forms & Security (3 skills) - NEW in v1.1.0
| Skill | Description |
|-------|-------------|
| `zustand-state` | State management with Zustand |
| `form-validation` | Zod + Conform for Remix forms |
| `security-hardening` | OWASP, authentication, encryption |

#### 🎨 Frontend & Design (6 skills)
| Skill | Description |
|-------|-------------|
| `frontend-design` | High-quality frontend interfaces |
| `canvas-design` | Static visual art & design |
| `algorithmic-art` | p5.js generative art |
| `remotion-best-practices` | Video creation in React |
| `vercel-react-best-practices` | React/Next.js optimization |
| `vercel-ai-sdk` | AI SDK integration |

#### 🧊 Three.js Suite (10 skills)
`threejs-fundamentals`, `threejs-geometry`, `threejs-materials`, `threejs-lighting`, `threejs-animation`, `threejs-interaction`, `threejs-loaders`, `threejs-textures`, `threejs-shaders`, `threejs-postprocessing`

#### 💻 Backend & Languages (5 skills)
| Skill | Description |
|-------|-------------|
| `typescript` | TypeScript 5.x+ best practices |
| `remixjs-best-practices` | Remix / React Router v7 |
| `mongoose` | MongoDB ODM 8.x+ |
| `prisma-orm` | Prisma ORM patterns |
| `clean-architecture-ts` | Clean Architecture in TS |

#### 🔧 DevOps & Testing (4 skills)
| Skill | Description |
|-------|-------------|
| `resilience-engineering` | Rate limits, retry, circuit breakers |
| `docker-guide` | Docker best practices |
| `browser-automation` | E2E testing with browser control |
| `npm-publish` | NPM package publishing |

#### 🤖 Meta-Skills (4 skills)
| Skill | Description |
|-------|-------------|
| `agent-creator` | Create new agents |
| `skill-creator` | Create new skills |
| `rule-creator` | Create behavior rules |
| `workflow-creator` | Create workflows |

#### 📚 Documentation & Research (4 skills)
`docusaurus-generator`, `technical-writing`, `research`, `brainstorm`

### ⚡ Slash Commands

Quick shortcuts for common tasks:

| Command | Description |
|---------|-------------|
| `/git-cm` | Commit with conventional message |
| `/git-pr` | Generate PR description |
| `/git-sync` | Sync with remote (pull --rebase) |
| `/git-undo` | Undo last commit |
| `/release` | Manage release versions |
| `/test` | Generate tests |
| `/review` | Code review |
| `/audit` | System security audit |
| `/changelog` | Generate changelog |
| `/readme` | Update README |
| `/plan` | Break down features into tasks |
| `/explain` | Explain code in detail |
| `/design` | Create UI mockups |
| `/brainstorm-session` | Facilitate brainstorming |

## 📂 Project Structure

```
.claude/
├── agents/           # 11 Specialized Agent Personas
│   ├── shopify-developer.md
│   ├── tech-lead.md
│   ├── product-designer.md
│   └── ...
├── skills/           # 62 Skills & Capabilities
│   ├── shopify-api/
│   ├── zustand-state/
│   ├── form-validation/
│   ├── security-hardening/
│   └── ...
└── settings.local.json
```

## 🛠 Usage

### With Claude Code

1. Install the package
2. Copy `.claude` to your project
3. Skills are automatically loaded based on context

### With Cursor

1. Copy `.claude` directory to your workspace
2. Reference agents in your prompts: *"Act as the shopify-developer agent"*
3. Use slash commands: `/git-cm`, `/test`, etc.

### Agent Selection

```
# For Shopify development
"Use the shopify-developer agent to implement OAuth flow"

# For code review
"Use the tech-lead agent to audit this codebase"

# For UI design
"Use the product-designer agent to create a dashboard layout"
```

## 📋 Changelog

See [CHANGELOG.md](./CHANGELOG.md) for release history.

### Recent Updates (v1.1.0)
- ✅ Added `zustand-state` - State management with Zustand
- ✅ Added `form-validation` - Zod + Conform for Remix
- ✅ Added `security-hardening` - Security best practices
- ✅ Added `changelog` - Changelog generation skill

## 🤝 Contributing

Contributions are welcome! Use the meta-skills to create new agents or skills:

```
# Create a new skill
/skill-creator

# Create a new agent
/agent-creator
```

## 📄 License

ISC License - see [LICENSE](./LICENSE) for details.

---

**Author:** Miso Apps
**Package:** [shopify-cc-kit on npm](https://www.npmjs.com/package/shopify-cc-kit)
