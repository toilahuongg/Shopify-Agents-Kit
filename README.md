# Agents Kit

A curated collection of specialized Claude Code agents for enhanced development workflows. This kit provides expert-level assistance across multiple domains including Shopify development, web frameworks, database management, and project organization.

## Overview

Agents Kit contains pre-configured Claude Code agents that can be invoked to provide specialized expertise in different areas of software development. Each agent is designed with specific capabilities, tool access, and domain knowledge to help you build better software faster.

## Available Agents

### Shopify Development

#### `shopify-api-expert`
Expert guidance for Shopify API integrations and app development.
- Master-level knowledge of REST and GraphQL Admin APIs
- OAuth 2.0 authentication and session management
- Webhook implementation and API rate limit handling
- Production-ready code examples with error handling

#### `shopify-app-bridge-expert`
Specialized assistance with Shopify App Bridge integration.
- App Bridge setup and configuration
- Authentication flow troubleshooting
- UI component implementation
- Resource picker integration

#### `shopify-polaris-expert`
Guidance on Shopify Polaris design system implementation.
- UI component usage and best practices
- Design patterns and accessibility standards
- Form validation and data tables
- Component validation and review

#### `shopify-app-ideator`
Brainstorming and ideation for Shopify applications.
- Market opportunity analysis
- App concept generation and refinement
- Monetization strategy suggestions
- Niche identification in the Shopify ecosystem

### Web Development Frameworks

#### `remix-expert`
Expert assistance with Remix framework projects.
- Route loaders and actions
- Data loading patterns
- Form handling and progressive enhancement
- Server-side rendering optimization
- Authentication and authorization patterns

### Database Management

#### `mongodb-expert`
MongoDB database expertise and optimization.
- Schema design and data modeling
- Query optimization and indexing strategies
- Aggregation pipeline construction
- Performance tuning and troubleshooting
- Replication and sharding configuration

### Code Quality & Review

#### `code-reviewer`
Comprehensive code quality review and analysis.
- Best practices enforcement
- Security vulnerability detection
- Performance optimization suggestions
- Code structure and readability improvements
- Bug and edge case identification

#### `ux-design-expert`
User experience and interface design guidance.
- UI/UX optimization
- Interaction patterns and accessibility
- Design system implementation
- User flow analysis
- Visual design decisions

### Research & Documentation

#### `context7-researcher`
Leverage Context7 for comprehensive research tasks.
- Technical documentation research
- Framework and library information retrieval
- API documentation gathering
- Contextual analysis and synthesis

### Project Management

#### `todo-manager`
Expert task breakdown and progress tracking using GitHub Issues.
- Task creation with clear acceptance criteria
- GitHub Issues management and organization
- Status tracking and workflow optimization
- Dependency mapping and prioritization
- Milestone and label management

## Usage

Agents are automatically available in Claude Code when this repository is configured. To invoke an agent:

1. Ask Claude Code for help in the relevant domain
2. Claude Code will automatically select the appropriate agent based on your request
3. Agents can also be explicitly requested by mentioning their name

### Example Interactions

```
User: "How do I implement OAuth for my Shopify app?"
→ Automatically invokes shopify-api-expert

User: "Help me design a schema for a social media app with MongoDB"
→ Automatically invokes mongodb-expert

User: "I need to break down this project into manageable tasks"
→ Automatically invokes todo-manager
```

## Agent Configuration

All agents are located in `.claude/agents/` directory. Each agent is defined with:
- **name**: Unique identifier for the agent
- **description**: Capabilities and use cases
- **model**: Claude model variant (sonnet, opus, haiku)
- **color**: Visual identifier in the interface
- **prompt**: Detailed instructions and operational guidelines

## Project Structure

```
agents-kit/
├── .claude/
│   └── agents/          # Agent definition files
│       ├── shopify-api-expert.md
│       ├── shopify-app-bridge-expert.md
│       ├── shopify-polaris-expert.md
│       ├── shopify-app-ideator.md
│       ├── remix-expert.md
│       ├── mongodb-expert.md
│       ├── code-reviewer.md
│       ├── ux-design-expert.md
│       ├── context7-researcher.md
│       └── todo-manager.md
├── src/                 # Source files (empty - ready for your projects)
└── README.md           # This file
```

## Requirements

- Claude Code CLI
- Access to Claude AI models
- Appropriate MCP servers for specialized functionality (Shopify Dev MCP, Context7, etc.)

## Getting Started

1. Clone this repository or copy the `.claude` directory to your project
2. Start Claude Code in your project directory
3. Begin working - agents will automatically assist based on your needs

## Best Practices

- **Be specific**: Clearly describe what you're trying to accomplish
- **Provide context**: Share relevant code, error messages, or project details
- **Iterate**: Agents can refine solutions based on your feedback
- **Combine expertise**: Complex problems may benefit from multiple agents

## Customization

You can customize existing agents or create new ones by:
1. Creating a new `.md` file in `.claude/agents/`
2. Defining the agent metadata (name, description, model, color)
3. Writing detailed operational guidelines and capabilities
4. Restarting Claude Code to load the new agent

## Contributing

To add new agents or improve existing ones:
1. Follow the existing agent structure and format
2. Include comprehensive capability descriptions
3. Define clear operational guidelines
4. Test agent behavior with various scenarios

## License

This project is provided as-is for use with Claude Code.

## Support

For issues or questions about:
- **Claude Code**: Visit [Claude Code Documentation](https://docs.claude.com/en/docs/claude-code)
- **Specific agents**: Refer to the agent's description and capabilities in their respective files
- **Bugs or improvements**: Open an issue in this repository

---

Built for Claude Code - Enhancing development workflows with specialized AI expertise.
