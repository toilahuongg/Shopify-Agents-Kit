# Agents Kit

A curated collection of specialized Claude Code agents and automated workflows for enhanced development. This kit provides expert-level assistance across multiple domains including Shopify development, web frameworks, database management, Scrum/Agile project management, and complete end-to-end workflow automation.

## Overview

Agents Kit contains:
- **20+ Pre-configured Agents**: Specialized expertise across multiple domains
- **Complete Scrum/Agile System**: Full implementation with 7 agents, 9 workflows, 6 metrics systems
- **Automated Workflows**: End-to-end automation from project idea to production
- **Master Workflow Command**: `/scrum:full-workflow` - From idea to ready-to-code in ~2.5 hours

Each agent is designed with specific capabilities, tool access, and domain knowledge to help you build better software faster.

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

### Architecture & Planning

#### `solution-architect`
System architecture design and technical planning.
- High-level system design
- Technology stack recommendations
- Scalability and performance considerations
- Architecture documentation

#### `project-manager`
Project oversight and quality gates.
- Phase transition reviews
- Risk assessment
- Documentation validation
- Approval recommendations

#### `typescript-expert`
TypeScript expertise and type system design.
- Type-safe code development
- Advanced TypeScript patterns
- Type system optimization
- Migration from JavaScript

### Project Management & Scrum/Agile

#### Scrum Agents

##### `product-owner`
Product backlog management and value maximization.
- Product backlog creation and prioritization
- Epic and story decomposition (INVEST criteria)
- Acceptance criteria definition (Given-When-Then)
- Sprint goal definition
- Release planning based on velocity

##### `scrum-master`
Scrum ceremony facilitation and team coaching.
- Sprint planning facilitation
- Daily standup orchestration
- Sprint review and retrospective leadership
- Impediment resolution
- Backlog refinement support

##### `sprint-manager`
Sprint lifecycle management and execution.
- Sprint backlog management
- Story estimation (Planning Poker)
- Task breakdown and tracking
- Burndown chart monitoring
- Velocity calculation

##### `scrum-metrics-analyzer`
Advanced metrics and predictive analytics.
- Velocity tracking and forecasting
- Sprint health monitoring
- Burndown/burnup charts
- Team performance analytics
- Predictive analytics for planning

##### `increment-validator`
Quality validation and Definition of Done checks.
- DoD validation
- Acceptance criteria verification
- Quality metrics tracking
- Test coverage analysis

##### `impediment-resolver`
Blocker identification and resolution strategies.
- Impediment tracking
- Root cause analysis
- Resolution strategy recommendations
- Escalation management

#### `todo-manager` (Scrum-enhanced)
Expert task breakdown and progress tracking.
- Task creation with clear acceptance criteria
- Status tracking and workflow optimization
- Dependency mapping and prioritization
- Integration with Scrum workflows

## 🚀 Quick Start

### Option 1: Automated End-to-End Workflow (Recommended)

Build complete projects from idea to production in ~2.5 hours:

```bash
/scrum:full-workflow
```

**Choose your automation mode:**
- **YOLO Mode**: Fully automated, minimal interruptions (fastest)
- **Standard Mode**: Automated with approval checkpoints
- **Guided Mode**: Step-by-step with full control

**What you get:**
1. ✅ Project analysis (with Shopify app ideation if applicable)
2. ✅ PRD, Architecture, and UI/UX documentation
3. ✅ Complete product backlog (20-50 estimated stories)
4. ✅ Sprint planning and task breakdown
5. ✅ Automated sprint execution tracking
6. ✅ Metrics and velocity monitoring

### Option 2: Scrum Workflows

Individual workflow commands for specific phases:

```bash
/scrum:init                # Initialize Scrum system
/scrum:backlog-builder    # Generate complete backlog
/sprint-planning          # Plan a sprint
/daily-standup           # Daily team sync
/sprint-review           # Demo and review
/sprint-retro            # Reflect and improve
/scrum:orchestrator      # Smart guidance
```

### Option 3: Individual Agents

Agents are automatically available for domain-specific help:

```
User: "How do I implement OAuth for my Shopify app?"
→ Automatically invokes shopify-api-expert

User: "Help me design a schema for a social media app with MongoDB"
→ Automatically invokes mongodb-expert

User: "I want to brainstorm Shopify app ideas"
→ Automatically invokes shopify-app-ideator

User: "We need to plan our next sprint"
→ Automatically invokes sprint-manager
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
│   ├── agents/                    # 20+ specialized agents
│   │   ├── shopify-api-expert.md
│   │   ├── shopify-app-bridge-expert.md
│   │   ├── shopify-polaris-expert.md
│   │   ├── shopify-app-ideator.md
│   │   ├── remix-expert.md
│   │   ├── mongodb-expert.md
│   │   ├── typescript-expert.md
│   │   ├── code-reviewer.md
│   │   ├── ux-design-expert.md
│   │   ├── solution-architect.md
│   │   ├── project-manager.md
│   │   ├── context7-researcher.md
│   │   ├── todo-manager.md
│   │   └── scrum/                 # Scrum/Agile agents
│   │       ├── product-owner.md
│   │       ├── scrum-master.md
│   │       ├── sprint-manager.md
│   │       ├── scrum-metrics-analyzer.md
│   │       ├── increment-validator.md
│   │       └── impediment-resolver.md
│   │
│   └── commands/                  # Workflow commands
│       ├── scrum/
│       │   ├── full-workflow.md        # Master end-to-end workflow
│       │   ├── backlog-builder.md      # Automated backlog creation
│       │   ├── init.md                 # System initialization
│       │   ├── orchestrator.md         # Smart guidance system
│       │   ├── sprint-planning.md
│       │   ├── daily-standup.md
│       │   ├── sprint-review.md
│       │   ├── sprint-retro.md
│       │   ├── backlog-refinement.md
│       │   └── story-estimation.md
│       │
│       └── shopify/
│           ├── starter.md              # Shopify app starter workflow
│           ├── frontend.md             # Frontend development workflow
│           └── backend.md              # Backend development workflow
│
├── .scrum/                        # Scrum system (created after init)
│   ├── docs/                      # Generated documentation
│   │   ├── PRD.md
│   │   ├── ARCHITECTURE.md
│   │   └── UXUI_DESIGN.md
│   │
│   ├── sprints/                   # Sprint data
│   │   └── sprint-001/
│   │       ├── backlog.json
│   │       └── daily-logs/
│   │
│   ├── metrics/                   # 6 metrics systems
│   │   ├── velocity.json
│   │   ├── sprint-health.json
│   │   ├── burndown-charts.json
│   │   ├── team-performance.json
│   │   ├── predictive-analytics.json
│   │   └── quality-metrics.json
│   │
│   ├── product-backlog.json       # Product backlog
│   ├── team-capacity.json         # Team configuration
│   │
│   └── Documentation/             # User guides
│       ├── QUICK_REFERENCE.md          # One-page cheat sheet
│       ├── AUTOMATED_WORKFLOW_GUIDE.md # Full automation guide
│       ├── SHOPIFY_APP_BRAINSTORM_GUIDE.md
│       ├── USER_GUIDE.md               # Step-by-step manual
│       ├── WHATS_NEW.md                # Latest updates
│       └── INDEX.md                    # Documentation index
│
├── src/                           # Your source code
└── README.md                      # This file
```

## Features

### 🤖 20+ Specialized Agents
- **Shopify Development**: API, App Bridge, Polaris, App Ideation
- **Web Frameworks**: Remix, TypeScript
- **Database**: MongoDB
- **Quality**: Code Review, UX Design
- **Architecture**: Solution Design, Project Management
- **Scrum/Agile**: 7 specialized agents for complete Scrum implementation

### 🚀 Complete Automated Workflows
- **Master Workflow**: End-to-end from idea to production
- **Shopify App Starter**: Specialized workflow for Shopify apps
- **Scrum Ceremonies**: 6 automated ceremony workflows
- **Backlog Management**: Automated backlog generation and refinement

### 📊 Advanced Metrics & Analytics
- Velocity tracking and forecasting
- Sprint health monitoring (0-100 score)
- Burndown/burnup charts
- Team performance analytics
- Predictive analytics for planning
- Quality metrics tracking

### 🎯 Intelligent Features
- Project type detection (Shopify app vs. general)
- Shopify app ideation and brainstorming
- Automated PRD, architecture, and UI/UX documentation
- Story point estimation
- Definition of Done validation
- Continuous backlog management loop

## Requirements

- Claude Code CLI
- Access to Claude AI models (Sonnet recommended)
- Appropriate MCP servers for specialized functionality:
  - Shopify Dev MCP (for Shopify agents)
  - Context7 (for research agent)
  - shadcn MCP (for UI components)
  - Playwright (for testing)

## Getting Started

### For Complete Automation

1. **Clone this repository:**
   ```bash
   git clone <repository-url>
   cd agents-kit
   ```

2. **Run the master workflow:**
   ```bash
   /scrum:full-workflow
   ```

3. **Choose project type:**
   - Shopify App (includes ideation)
   - Web Application
   - Mobile App
   - API/Backend Service
   - Other

4. **Select automation mode:**
   - YOLO Mode (fastest)
   - Standard Mode (balanced)
   - Guided Mode (maximum control)

5. **Provide project description and let it run!**
   - Get complete documentation in ~1 hour
   - Get ready-to-code backlog in ~2.5 hours

### For Scrum/Agile Projects

1. **Initialize Scrum system:**
   ```bash
   /scrum:init
   ```

2. **Build your backlog:**
   ```bash
   /scrum:backlog-builder
   ```

3. **Start your first sprint:**
   ```bash
   /sprint-planning
   ```

4. **Daily execution:**
   ```bash
   /daily-standup
   ```

5. **End of sprint:**
   ```bash
   /sprint-review
   /sprint-retro
   ```

### For Individual Agent Use

1. Start Claude Code in your project directory
2. Ask questions in the relevant domain
3. Agents will automatically assist based on your needs

## Best Practices

### For Automated Workflows
- **Start with YOLO mode**: Trust the automation for standard projects
- **Use Standard mode**: For complex or high-risk projects
- **Monitor sprint health**: Keep score > 80 for healthy sprints
- **Run retrospectives**: Continuous improvement is key
- **Keep backlog fresh**: Add new items and re-prioritize regularly

### For Shopify Apps
- **Use ideation**: Let shopify-app-ideator brainstorm concepts
- **Be specific about context**: Share skills, budget, target market
- **Validate early**: Use agent feedback to refine before building
- **Check competition**: Agent provides competitive analysis

### For Agent Interactions
- **Be specific**: Clearly describe what you're trying to accomplish
- **Provide context**: Share relevant code, error messages, or project details
- **Iterate**: Agents can refine solutions based on your feedback
- **Combine expertise**: Complex problems may benefit from multiple agents

### For Scrum Teams
- **Daily standups**: Keep them to 15 minutes, focus on blockers
- **Track impediments**: Address blockers quickly
- **Definition of Done**: Use automated validation
- **Metrics-driven**: Let velocity guide planning, not gut feeling

## Documentation

### Quick References
- **`.scrum/QUICK_REFERENCE.md`**: One-page cheat sheet
- **`.scrum/INDEX.md`**: Complete documentation index

### Comprehensive Guides
- **`.scrum/AUTOMATED_WORKFLOW_GUIDE.md`**: Full automation guide
- **`.scrum/SHOPIFY_APP_BRAINSTORM_GUIDE.md`**: Shopify ideation guide
- **`.scrum/USER_GUIDE.md`**: Step-by-step manual guide
- **`.scrum/WHATS_NEW.md`**: Latest updates and features

### System Documentation
- **`.scrum/README.md`**: Scrum system overview
- **`.scrum/SCRUM_SYSTEM_OVERVIEW.md`**: Architecture details

## Customization

### Creating Custom Agents
1. Create a new `.md` file in `.claude/agents/`
2. Define agent metadata (name, description, model, color)
3. Write detailed operational guidelines and capabilities
4. Restart Claude Code to load the new agent

### Creating Custom Workflows
1. Create a new `.md` file in `.claude/commands/`
2. Define workflow steps and agent coordination
3. Add to INDEX.md for discoverability

### Customizing Scrum System
- Edit `.scrum/team-capacity.json` for your team
- Edit `.scrum/definition-of-done.md` for your standards
- Customize metrics thresholds in agent configurations

## What's New

### Version 2.0 - Scrum System & Automation
- ✅ Complete Scrum/Agile implementation with 7 specialized agents
- ✅ Master workflow: `/scrum:full-workflow` (idea to production in ~2.5 hours)
- ✅ Shopify app ideation integration
- ✅ 6 advanced metrics systems
- ✅ Automated documentation generation (PRD, Architecture, UI/UX)
- ✅ Intelligent project type detection
- ✅ 3 automation modes (YOLO, Standard, Guided)
- ✅ Comprehensive testing suite (13 tests, 100% pass rate)

See `.scrum/WHATS_NEW.md` for detailed changelog.

## Contributing

To add new agents or improve existing ones:
1. Follow the existing agent structure and format
2. Include comprehensive capability descriptions
3. Define clear operational guidelines
4. Test agent behavior with various scenarios
5. Update documentation accordingly

## License

This project is provided as-is for use with Claude Code.

## Examples & Use Cases

### Use Case 1: Building a Shopify App (No Idea Yet)
```bash
/scrum:full-workflow
→ Choose: "1. Shopify App"
→ Say: "I need ideas for Vietnamese market"
→ Get 3-5 validated concepts
→ Choose best concept
→ Get complete PRD, Architecture, Backlog
→ Start coding in 2.5 hours!
```

### Use Case 2: Web Application Project
```bash
/scrum:full-workflow
→ Choose: "2. Web Application"
→ Describe: "Task management SaaS for remote teams"
→ Get documentation and backlog
→ Start sprint planning
→ Begin development
```

### Use Case 3: Ongoing Scrum Project
```bash
# Monday morning
/sprint-planning

# Daily
/daily-standup

# Friday afternoon
/sprint-review
/sprint-retro

# As needed
/scrum:orchestrator  # Get smart guidance
/scrum:add-backlog   # Add new items
```

## Metrics & Analytics

View real-time project metrics:

```bash
# Sprint health (0-100)
cat .scrum/metrics/sprint-health.json | jq '.sprintHealthHistory[0].overallHealthScore'

# Current velocity
cat .scrum/metrics/velocity.json | jq '.statistics.averageVelocity'

# Burndown progress
cat .scrum/metrics/burndown-charts.json | jq '.sprints[0].chartData'

# Team performance
cat .scrum/metrics/team-performance.json
```

## Success Stories

**Before Agents Kit:**
- Manual sprint planning: 4-6 hours
- Documentation: Scattered or missing
- No velocity tracking
- Ad-hoc processes

**After Agents Kit:**
- Automated sprint planning: 30 minutes
- Complete documentation: Auto-generated
- Real-time velocity tracking
- Consistent Scrum process
- **2.5 hours from idea to ready-to-code!**

## Support

For issues or questions about:
- **Claude Code**: Visit [Claude Code Documentation](https://docs.claude.com/en/docs/claude-code)
- **Workflows**: Check `.scrum/INDEX.md` for all documentation
- **Specific agents**: Refer to agent files in `.claude/agents/`
- **Scrum system**: See `.scrum/README.md` and guides
- **Bugs or improvements**: Open an issue in this repository

## Quick Help

```bash
# Smart guidance anytime
/scrum:orchestrator

# View documentation index
cat .scrum/INDEX.md

# One-page reference
cat .scrum/QUICK_REFERENCE.md

# Run tests
cd .scrum && tests/run-all-tests.sh
```

---

**Built for Claude Code** - Enhancing development workflows with specialized AI expertise and complete project automation.

**Version 2.0** - Now with complete Scrum/Agile system and end-to-end workflow automation.
