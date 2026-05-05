# Shopify Claude Code Kit

[![npm version](https://img.shields.io/npm/v/shopify-cc-kit.svg)](https://www.npmjs.com/package/shopify-cc-kit)
[![License: ISC](https://img.shields.io/badge/License-ISC-blue.svg)](https://opensource.org/licenses/ISC)

A collection of **56 Skills** designed to supercharge your AI coding assistant for Shopify app development and beyond.

## Quick Start

### Installation

```bash
npm install -g shopify-cc-kit
```

### Setup

```bash
npx shopify-cc-kit@latest
```

This syncs skills into `.claude/` in your project, then installs official Shopify and Matt Pocock skills on top.

## Features

### Skills (56 Total)

Located in `.claude/skills/`, organized by category:

#### Shopify Ecosystem (12 skills)

| Skill | Description |
|-------|-------------|
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
| `shopify-app-logo` | App Store logo creation & validation |
| `shopify-feature-image` | App Store feature images |

#### Frontend & Design (8 skills)

| Skill | Description |
|-------|-------------|
| `frontend-design` | Production-grade frontend interfaces |
| `design` | UI mockups and design |
| `canvas-design` | Static visual art & design |
| `algorithmic-art` | p5.js generative art |
| `remotion-best-practices` | Video creation in React |
| `vercel-react-best-practices` | React/Next.js optimization (45 rules) |
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

#### Backend & Languages (4 skills)

| Skill | Description |
|-------|-------------|
| `typescript` | TypeScript 5.x+ best practices |
| `remixjs-best-practices` | Remix / React Router v7 |
| `mongoose` | MongoDB ODM 8.x+ |
| `misoapps` | Miso Apps SDK integration |

#### State, Forms & Security (4 skills)

| Skill | Description |
|-------|-------------|
| `zustand-state` | State management with Zustand |
| `form-validation` | Zod + Conform for Remix forms |
| `security-hardening` | OWASP, authentication, encryption |
| `resilience-engineering` | Rate limits, retry, circuit breakers |

#### Documentation & Research (6 skills)

| Skill | Description |
|-------|-------------|
| `docusaurus-generator` | End-user documentation sites |
| `technical-writing` | Internal technical docs |
| `docs-out` | Documentation generation |
| `research` | Research and synthesis |
| `brainstorm` | Creative brainstorming |
| `rigorous-reasoning` | Philosophical reasoning |

#### Git Workflow (4 skills)

| Skill | Description |
|-------|-------------|
| `git-cm` | Commit with conventional message |
| `git-pr` | Generate PR description |
| `git-sync` | Sync with remote (pull --rebase) |
| `git-undo` | Undo last commit |

#### Meta-Skills (5 skills)

| Skill | Description |
|-------|-------------|
| `agent-creator` | Create new agents |
| `skill-creator` | Create new skills |
| `rule-creator` | Create behavior rules |
| `agent-browser` | Browser automation |
| `code-investigator` | Code analysis and audits |

#### Utilities (3 skills)

| Skill | Description |
|-------|-------------|
| `app-listing` | App Store listing content |
| `changelog` | Changelog generation |
| `explain` | Code explanation |

### Slash Commands

| Command | Description |
|---------|-------------|
| `/git-cm` | Commit with conventional message |
| `/git-pr` | Generate PR description |
| `/git-sync` | Sync with remote (pull --rebase) |
| `/git-undo` | Undo last commit |
| `/changelog` | Generate changelog |
| `/explain` | Explain code in detail |
| `/design` | Create UI mockups |
| `/brainstorm` | Facilitate brainstorming |

## Project Structure

```
.claude/
└── skills/           # 56 Skills & Capabilities
    ├── shopify-remix-template/
    ├── shopify-billing/
    ├── vercel-react-best-practices/
    ├── threejs-*/
    └── ...
```

## Usage

### With Claude Code

1. Install the package
2. Copy `.claude` to your project
3. Skills are automatically loaded based on context

### With Cursor

1. Copy `.claude` directory to your workspace
2. Use slash commands: `/git-cm`, `/changelog`, etc.

## External Skills

The sync CLI automatically installs additional skills from:

| Source | Description |
|--------|-------------|
| `Shopify/shopify-ai-toolkit` | Official Shopify skills with validation scripts (Admin API, Functions, Liquid, Hydrogen, Polaris, POS) |
| `mattpocock/skills` | Engineering methodology skills (TDD, PRDs, planning, debugging, codebase analysis) |

These are installed via `npx skills@latest add` during setup.

## Contributing

Use the meta-skills to create new skills:

```
/skill-creator
```

## License

ISC License - see [LICENSE](./LICENSE) for details.

---

**Package:** [shopify-cc-kit on npm](https://www.npmjs.com/package/shopify-cc-kit)
