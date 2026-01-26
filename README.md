# Google Antigravity Kit

A powerful collection of **Agentic Skills**, **Workflows**, and **Agents** designed to supercharge your AI coding assistant. This kit provides specialized capabilities for domains including Shopify development, high-end frontend design, 3D graphics, automated documentation, and professional project management.

## 🚀 Features

The kit is organized into three main pillars: **Agents** (personas), **Skills** (capabilities), and **Workflows** (processes).

### 🤖 Agents

Located in `.agent/agents`, these are specialized personas equipped with specific skills and instructions to handle complex roles:

- **3d-developer**: Specialist in building immersive 3D web experiences using Three.js.
- **brainstorm**: Creative partner for generating ideas and solving problems.
- **growth-hacker**: Strategist for product growth and user acquisition.
- **media-specialist**: Expert in media content creation and manipulation.
- **product-designer**: Focused on UI/UX, visual fidelity, and Polaris compliance.
- **project-manager**: Handles task breakdown, planning, and progress tracking.
- **qa-specialist**: Dedicated to testing, verification, and quality assurance.
- **shopify-developer**: Expert in the full Shopify application ecosystem.
- **technical-writer**: Specializes in creating clear, comprehensive documentation (like this README!).

### 🧠 Skills

Located in `.agent/skills`, these provide deep, formatted knowledge and executable tools:

**🛍️ Shopify Ecosystem (New!)**
A complete suite for professional Shopify App development:
- **Core**: `shopify-api`, `shopify-app-bridge`, `shopify-remix-template`
- **Business Logic**: `shopify-billing`, `shopify-functions`, `shopify-webhooks`
- **Data & UI**: `shopify-metafields`, `shopify-liquid`, `shopify-polaris-design`
- **Extensions**: `shopify-extensions`
- **Testing**: `shopify-testing`

**🎨 Frontend & Design**
- **frontend-design**: Create distinctive, production-grade frontend interfaces.
- **canvas-design**: Create beautiful static visual art and designs.
- **experimental-art**: `algorithmic-art` for p5.js generative art.
- **remotion-best-practices**: Video creation in React.
- **remixjs-best-practices**: Guidelines for Remix v2/v7.
- **vercel-react-best-practices**: Performance optimization guidelines.

**🧊 3D Graphics (Three.js Suite)**
- **Core**: `threejs-fundamentals`, `threejs-geometry`, `threejs-materials`, `threejs-lighting`
- **Interaction**: `threejs-animation`, `threejs-interaction`
- **Advanced**: `threejs-shaders`, `threejs-postprocessing`, `threejs-textures`, `threejs-loaders`

**🛠️ Agent Meta-Skills**
- **agent-creator**: Guide for creating and configuring new agents.
- **skill-creator**: Guide for creating effective new skills.
- **rule-creator**: Create and manage user rules.
- **workflow-creator**: Create and manage automated workflows.
- **beads**: A memory upgrade and task management tool.

**📚 Documentation & Research**
- **docusaurus-generator**: Generate documentation sites using Docusaurus.
- **research**: Methodologies for deep technical research.
- **brainstorm**: Techniques for creative problem solving.

**💻 Backend & Languages**
- **typescript**: Modern TypeScript 5.x+ best practices.
- **mongoose**: Mongoose ODM 8.x+ guide.

### ⚡ Workflows

Located in `.agent/workflows`, these shortcuts automate common tasks. Trigger them with specific commands:

**Git & Version Control**
- **/git-cm**: Commit changes with a descriptive, conventional message.
- **/git-pr**: Generate a Pull Request description.
- **/git-sync**: Sync with remote (pull --rebase).
- **/git-undo**: Undo the last commit (soft reset).
- **/release**: Manage release versions.

**Development & CI**
- **/shopify-dev**: Start the Shopify development server.
- **/test**: Generate and run tests.
- **/review**: Review code for bugs and improvements.
- **/design**: Create UI mockups.
- **/plan**: Break down features into tasks.
- **/readme**: Update this README (Self-referential!).
- **/explain**: Explain code in detail.

## 📂 Project Structure

```text
google-antigravity-kit/
├── .agent/
│   ├── agents/         # Specialized Agent Personas
│   ├── rules/          # User behavior rules
│   ├── skills/         # Capabilities & Domain Knowledge
│   └── workflows/      # Automated Process Definitions
└── README.md           # This file
```

## 🛠 Usage

This kit is designed for use within an Agentic environment (like **Gemini Code Assist** or **Cursor**).

- **To use an Agent**: Switch to the persona or reference them in your instructions (e.g., "Act as the Project Manager").
- **To use a Workflow**: Type the command in the chat (e.g., `@[/git-cm]`, `@[/plan]`).
- **To use a Skill**: The agent will automatically select relevant skills based on your request (e.g., "Create a 3D scene" triggers Three.js skills).

## 📄 License

[License Information to be added]
