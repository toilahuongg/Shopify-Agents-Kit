# Google Antigravity Kit

A powerful collection of **Agentic Skills**, **Workflows**, and **Agents** designed to supercharge your AI coding assistant. This kit provides specialized capabilities for domains including Shopify development, high-end frontend design, 3D graphics, automated documentation, and professional project management.

## 🚀 Features

The kit is organized into three main pillars: **Agents** (personas), **Skills** (capabilities), and **Workflows** (processes).

### 🤖 Agents

Located in `.claude/agents`, these are specialized personas equipped with specific skills and instructions to handle complex roles:

- **3d-developer**: Specialist in building immersive 3D web experiences using Three.js.
- **brainstorm**: Creative partner for generating ideas and solving problems.
- **end-user-writer**: Specialist for creating end-user facing documentation sites.
- **growth-hacker**: Strategist for product growth and user acquisition.
- **media-specialist**: Expert in media content creation and manipulation.
- **product-designer**: Focused on UI/UX, visual fidelity, and Polaris compliance.
- **project-manager**: Handles task breakdown, planning, and progress tracking.
- **qa-specialist**: Dedicated to testing, verification, and quality assurance.
- **shopify-developer**: Expert in the full Shopify application ecosystem.
- **tech-lead**: Technical Lead for system architecture analysis, risk assessment, and audits.
- **technical-writer**: Specializes in creating clear, comprehensive internal documentation.

### 🧠 Skills

Located in `.claude/skills`, these provide deep, formatted knowledge and executable tools:

**🛍️ Shopify Ecosystem**
A complete suite for professional Shopify App development:
- **Core**: `shopify-api`, `shopify-app-bridge`, `shopify-remix-template`
- **Business Logic**: `shopify-billing`, `shopify-functions`, `shopify-webhooks`
- **Data & UI**: `shopify-metafields`, `shopify-liquid`, `shopify-polaris-design`
- **Extensions**: `shopify-extensions`
- **Testing**: `shopify-testing`
- **Deployment**: `shopify-app-deployment`, `shopify-app-i18n`

**🎨 Frontend & Design**
- **frontend-design**: Create distinctive, production-grade frontend interfaces.
- **canvas-design**: Create beautiful static visual art and designs.
- **algorithmic-art**: p5.js generative art with seeded randomness.
- **remotion-best-practices**: Video creation in React.
- **remixjs-best-practices**: Guidelines for Remix v2/v7.
- **vercel-react-best-practices**: Performance optimization guidelines.
- **vercel-ai-sdk**: Vercel AI SDK integration guide.

**🧊 3D Graphics (Three.js Suite)**
- **Core**: `threejs-fundamentals`, `threejs-geometry`, `threejs-materials`, `threejs-lighting`
- **Interaction**: `threejs-animation`, `threejs-interaction`
- **Advanced**: `threejs-shaders`, `threejs-postprocessing`, `threejs-textures`, `threejs-loaders`

**🛠️ Agent Meta-Skills**
- **agent-creator**: Guide for creating and configuring new agents.
- **skill-creator**: Guide for creating effective new skills.
- **rule-creator**: Create and manage user rules.

**📚 Documentation & Research**
- **docusaurus-generator**: Generate documentation sites using Docusaurus.
- **technical-writing**: Guide for creating internal technical documentation.
- **research**: Methodologies for deep technical research.
- **brainstorm**: Techniques for creative problem solving.

**💻 Backend & Languages**
- **typescript**: Modern TypeScript 5.x+ best practices.
- **mongoose**: Mongoose ODM 8.x+ guide.
- **prisma-orm**: Prisma ORM best practices.
- **clean-architecture-ts**: Clean Architecture in TypeScript.

**🔒 Security & DevOps**
- **resilience-engineering**: Rate limits, retry policies, circuit breakers.
- **docker-guide**: Docker best practices.
- **browser-automation**: Browser automation and E2E testing.
- **npm-publish**: NPM package publishing guide.

### ⚡ Workflows (Skills with Commands)

Located in `.claude/skills`, these shortcuts automate common tasks. Trigger them with specific commands:

**Git & Version Control**
- **/git-cm**: Commit changes with a descriptive, conventional message.
- **/git-pr**: Generate a Pull Request description.
- **/git-sync**: Sync with remote (pull --rebase).
- **/git-undo**: Undo the last commit (soft reset).
- **/release**: Manage release versions.

**Development & CI**
- **/test**: Generate and run tests.
- **/review**: Review code for bugs and improvements.
- **/audit**: Comprehensive system audit (backend, frontend, security).
- **/design**: Create UI mockups.
- **/plan**: Break down features into tasks.
- **/explain**: Explain code in detail.

**Documentation**
- **/readme**: Update this README.
- **/docs-out**: Generate internal project documentation.

**Creative**
- **/brainstorm-session**: Facilitate a creative brainstorm session.
- **/cook**: Recipe/cooking assistant.

## 📂 Project Structure

```text
agents-kit/
├── .claude/
│   ├── agents/         # Specialized Agent Personas
│   ├── rules/          # User behavior rules
│   └── skills/         # Capabilities & Domain Knowledge (includes workflows)
└── README.md           # This file
```

## 🛠 Usage

This kit is designed for use within an Agentic environment (like **Claude Code** or **Cursor**).

- **To use an Agent**: Switch to the persona or reference them in your instructions (e.g., "Act as the Project Manager").
- **To use a Workflow**: Type the command in the chat (e.g., `/git-cm`, `/plan`).
- **To use a Skill**: The agent will automatically select relevant skills based on your request (e.g., "Create a 3D scene" triggers Three.js skills).

## 📄 License

[License Information to be added]
