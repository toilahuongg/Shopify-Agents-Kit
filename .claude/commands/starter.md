---
description: Complete app starter workflow from idea validation to technical planning. Takes an app idea, refines it, creates architecture, UX design, implementation plan, todos, and documentation.
---

You are orchestrating a comprehensive app starter workflow that takes a raw app idea and transforms it into a fully-planned, documented project ready for implementation. This workflow integrates multiple specialized agents to validate ideas, design architecture, plan UX, and create implementation roadmaps.

## Workflow Overview

This workflow follows a structured 6-phase approach:

1. **Ideation & Validation Phase**: Refine and validate the app idea
2. **Approval Phase**: Present refined idea to user for approval
3. **Technical Planning Phase**: Architecture, UX design, and framework planning
4. **Task Planning Phase**: Create detailed implementation todos
5. **Documentation Phase**: Generate comprehensive technical documentation
6. **Handoff Phase**: Prepare for implementation with clear next steps

## Phase 1: Ideation & Validation

When you receive an app idea, use the `Task` tool to launch the `shopify-app-ideator` agent:

```
Launch shopify-app-ideator agent with:
- Analyze the raw app idea for viability and market potential
- Refine the concept with clear value proposition
- Identify target audience and key features
- Assess technical complexity and market opportunity
- Provide structured idea presentation with:
  * Problem statement
  * Solution overview
  * Target audience
  * Key features (MVP scope)
  * Differentiation from competitors
  * Monetization strategy
  * Technical complexity assessment
  * Market potential assessment
```

**Important**: The shopify-app-ideator agent is READ-ONLY. It will analyze and refine the idea but won't create any files. All recommendations will be provided as text output.

**Ideation Output Structure**:
```markdown
## App Concept: [Name]

### One-Liner
[Clear value proposition]

### Problem Statement
[Specific pain point being addressed]

### Solution Overview
[How the app solves this problem]

### Target Audience
[Specific user segments]

### Key Features (MVP)
1. [Feature 1 with description]
2. [Feature 2 with description]
3. [Feature 3 with description]

### Differentiation
[What makes this unique]

### Monetization Strategy
[Pricing model recommendation]

### Technical Assessment
- Complexity: [Low/Medium/High]
- Key Technologies: [List]
- Integration Requirements: [List]

### Market Potential
[Small/Medium/Large with reasoning]

### Risks & Considerations
[Potential challenges and mitigation strategies]
```

## Phase 2: User Approval

After the shopify-app-ideator completes its analysis:

1. Present the refined app concept to the user clearly
2. Highlight key decisions and recommendations
3. Ask: "Does this refined concept look good? Should I proceed with technical planning and architecture design?"
4. Wait for user confirmation before proceeding
5. If user requests changes, re-engage shopify-app-ideator agent with modifications

**Important Decision Point**: Only proceed to technical planning if the user explicitly approves the concept.

## Phase 3: Technical Planning

Once the concept is approved, launch multiple specialist agents in parallel or sequence to create comprehensive technical plans:

### 3A. Solution Architecture

Use the `Task` tool to launch the `solution-architect` agent:

```
Launch solution-architect agent with:
- Design comprehensive system architecture based on approved concept
- Evaluate technology stack options (Remix, React, databases, APIs)
- Create multi-layered architecture views (conceptual, logical, physical)
- Define data models and storage strategies
- Plan API design and integration points
- Address scalability, security, and performance requirements
- Provide deployment and infrastructure recommendations
- Create architectural decision records (ADRs) for key choices

Input context:
- App concept from Phase 1
- Key features and requirements
- Technical complexity assessment
- Integration requirements
```

**Architecture Output Structure**:
```markdown
## System Architecture

### Architecture Overview
[High-level system design description]

### Technology Stack
- Frontend: [Framework and libraries]
- Backend: [Server framework and language]
- Database: [Database choice and rationale]
- APIs: [External APIs and integrations]
- Hosting: [Deployment platform]

### System Components
1. [Component name]
   - Responsibility: [What it does]
   - Technology: [Implementation tech]
   - Interactions: [Other components it connects to]

### Data Architecture
- Data Models: [Key entities and relationships]
- Storage Strategy: [Database schema approach]
- Data Flow: [How data moves through system]

### API Design
- Endpoints: [Key API routes]
- Authentication: [Auth strategy]
- Rate Limiting: [Protection measures]

### Security Considerations
[Security measures and best practices]

### Scalability Strategy
[How the system will scale]

### Deployment Architecture
[Infrastructure and deployment approach]
```

### 3B. UX Design Planning

Use the `Task` tool to launch the `ux-design-expert` agent:

```
Launch ux-design-expert agent with:
- Design user flows for key features
- Plan interface structure and navigation
- Define interaction patterns and components
- Ensure accessibility compliance (WCAG 2.1 AA)
- Plan responsive design strategy
- Create component hierarchy and design system approach
- Define user personas and use cases
- Plan onboarding and error handling UX

Input context:
- App concept and key features from Phase 1
- Target audience information
- Technical constraints from architecture
```

**UX Design Output Structure**:
```markdown
## UX Design Plan

### User Personas
[Target user descriptions with goals and contexts]

### User Flows
1. [Primary flow name]
   - Steps: [User journey steps]
   - Decision points: [Where users make choices]
   - Success criteria: [What completion looks like]

### Interface Structure
- Navigation: [Navigation pattern and hierarchy]
- Key Screens: [List of main views/pages]
- Layout Pattern: [Overall layout approach]

### Component Library
- Core Components: [Essential UI elements needed]
- Design System: [Style approach and guidelines]
- Accessibility Requirements: [A11y considerations]

### Interaction Patterns
- Forms: [Form design approach]
- Feedback: [Loading states, errors, success messages]
- Data Display: [Tables, lists, cards patterns]

### Responsive Strategy
[Mobile-first approach and breakpoints]

### Accessibility Checklist
[WCAG compliance requirements and implementation notes]
```

### 3C. Remix Framework Planning

Use the `Task` tool to launch the `remix-expert` agent:

```
Launch remix-expert agent with:
- Design Remix route structure for the app
- Plan loaders and actions for data handling
- Define session management and authentication approach
- Plan form handling and data mutations
- Design error boundaries and error handling
- Plan performance optimizations (prefetching, caching)
- Define server-side rendering strategy
- Plan progressive enhancement approach

Input context:
- App concept and features from Phase 1
- Architecture decisions from solution-architect
- UX flows and screens from ux-design-expert
```

**Remix Planning Output Structure**:
```markdown
## Remix Implementation Plan

### Route Structure
```
app/
  routes/
    _index.tsx                 # Home/landing page
    dashboard.tsx              # Main dashboard
    dashboard.settings.tsx     # Nested route for settings
    api.webhook.tsx           # API endpoint
```

### Loaders & Actions
1. Route: [route path]
   - Loader: [What data is fetched]
   - Action: [What mutations are handled]
   - Validation: [Input validation approach]

### Authentication Strategy
- Session Management: [Cookie/JWT approach]
- Protected Routes: [How routes are protected]
- Auth Flow: [Login/logout implementation]

### Form Handling
[Progressive enhancement approach for forms]

### Error Handling
- Error Boundaries: [Where and how implemented]
- Error Pages: [404, 500, etc.]
- User Feedback: [Toast notifications, inline errors]

### Performance Strategy
- Prefetching: [Link prefetch strategy]
- Caching: [Cache headers approach]
- Code Splitting: [Lazy loading strategy]
```

## Phase 4: Task Planning

After all technical planning is complete, use the `Task` tool to launch the `todo-manager` agent:

```
Launch todo-manager agent with:
- Synthesize all plans from Phase 3 into actionable todos
- Break down architecture, UX, and Remix plans into implementation tasks
- Organize todos in logical implementation order:
  1. Project setup and configuration
  2. Database and data models
  3. Authentication and session management
  4. Core features (prioritized)
  5. UI implementation
  6. Testing and quality assurance
  7. Deployment preparation
- Include clear acceptance criteria for each todo
- Note dependencies between tasks
- Provide time estimates where applicable

Input context:
- All outputs from Phase 3 (architecture, UX, Remix plans)
- MVP feature prioritization from Phase 1
```

**Todo Structure**:
The todo-manager will create a comprehensive task list organized by implementation phase, with each todo including:
- Clear, actionable description
- Acceptance criteria
- Dependencies on other tasks
- Estimated complexity (if applicable)
- Technical notes or considerations

## Phase 5: Documentation

Use the `Task` tool to launch the `technical-documentation-writer` agent:

```
Launch technical-documentation-writer agent with:
- Create comprehensive project documentation including:
  * Project README with overview, setup instructions, and getting started guide
  * Architecture documentation (system design, component diagrams)
  * API documentation (if applicable)
  * Development guidelines and coding standards
  * Deployment and operations guide
  * Contributing guidelines
  * Technology decision rationale

Input context:
- All outputs from previous phases
- Architecture decisions and ADRs
- UX design specifications
- Remix implementation plan
- Todo list for implementation scope
```

**Documentation Output**:
The technical-documentation-writer will create:

1. **README.md** - Project overview, quick start, features
2. **ARCHITECTURE.md** - System design, technology stack, components
3. **DEVELOPMENT.md** - Setup guide, development workflow, coding standards
4. **DEPLOYMENT.md** - Deployment process, environment configuration
5. **API.md** - API endpoints and usage (if applicable)
6. **CONTRIBUTING.md** - Guidelines for contributors

## Phase 6: Handoff & Next Steps

After all documentation is created:

1. **Summarize What Was Created**:
   - Validated app concept with market analysis
   - Complete system architecture with technology decisions
   - UX design plan with user flows and component structure
   - Remix implementation roadmap
   - Prioritized implementation todos
   - Comprehensive technical documentation

2. **Provide Implementation Recommendations**:
   ```markdown
   ## Ready to Start Implementation

   Your app concept has been fully planned and documented. Here's how to proceed:

   ### Immediate Next Steps
   1. Review all documentation in the generated files
   2. Set up development environment following DEVELOPMENT.md
   3. Start with the first todos from the task list:
      - [List first 3-5 high-priority todos]

   ### Recommended Implementation Approach
   - Start with [specific feature/component]
   - Use `/shopify-app-fe` for frontend implementation
   - Use `/shopify-app-be` for backend implementation
   - Follow the architecture and UX plans closely

   ### Quality Assurance
   - Reference ARCHITECTURE.md for design decisions
   - Follow coding standards in DEVELOPMENT.md
   - Test each feature against acceptance criteria in todos
   - Use code-reviewer agent for quality checks

   ### When You're Ready to Code
   Say: "Let's start implementing [feature name]" and I'll guide you through using the appropriate workflow commands.
   ```

3. **Offer Additional Support**:
   - Answer questions about any of the plans
   - Clarify architectural decisions
   - Refine todos if needed
   - Adjust documentation based on feedback

## Agent Coordination Summary

**Workflow Sequence**:
```
1. shopify-app-ideator (READ-ONLY)
   ↓
   User approval checkpoint
   ↓
2. Parallel Planning:
   - solution-architect → System architecture
   - ux-design-expert → UX design plan
   - remix-expert → Framework implementation plan
   ↓
3. todo-manager → Implementation task breakdown
   ↓
4. technical-documentation-writer → Project documentation
   ↓
5. Handoff with next steps
```

## Quality Checkpoints

Throughout the workflow, ensure:
- ✅ App idea is validated against market needs
- ✅ Architecture is scalable and maintainable
- ✅ UX design follows accessibility standards
- ✅ Remix plan follows framework best practices
- ✅ Todos are specific and actionable
- ✅ Documentation is comprehensive and clear
- ✅ All technical decisions are documented with rationale
- ✅ User is informed at each major phase

## Example Workflow

```
User: /starter "A Shopify app that helps merchants automatically tag products using AI"

Phase 1 - Ideation:
→ Launch shopify-app-ideator
→ Refined concept: "SmartTagger - AI-powered product categorization app"
  - Problem: Manual product tagging is time-consuming
  - Solution: ML-based automatic tagging with merchant review
  - Features: Auto-tag, bulk operations, tag suggestions
  - Market: Medium-to-large Shopify merchants with 100+ products
  - Complexity: Medium-High (ML integration)

Phase 2 - Approval:
→ Present concept to user
→ User approves: "Yes, let's proceed"

Phase 3 - Technical Planning:
→ Launch solution-architect
  - Architecture: Remix + PostgreSQL + OpenAI API
  - Components: Web app, webhook handlers, ML service

→ Launch ux-design-expert
  - User flows: Product import → AI tagging → Review → Apply
  - Key screens: Dashboard, Tagging Queue, Settings
  - Accessibility: WCAG AA compliant

→ Launch remix-expert
  - Routes: Dashboard, tagging workflow, API endpoints
  - Auth: Shopify OAuth + session cookies
  - Forms: Progressive enhancement for tag management

Phase 4 - Task Planning:
→ Launch todo-manager
→ 25 todos created across:
  - Project setup (3 todos)
  - Database & models (4 todos)
  - Shopify integration (5 todos)
  - AI tagging service (6 todos)
  - UI implementation (5 todos)
  - Testing & deployment (2 todos)

Phase 5 - Documentation:
→ Launch technical-documentation-writer
→ Generated:
  - README.md (project overview, quick start)
  - ARCHITECTURE.md (system design, ML integration)
  - DEVELOPMENT.md (setup, coding standards)
  - DEPLOYMENT.md (deployment guide)
  - API.md (webhook endpoints)

Phase 6 - Handoff:
→ Summary of deliverables
→ Next steps: "Start with todo #1: Initialize Remix project"
→ Recommended: Use /shopify-app-fe and /shopify-app-be for implementation
```

## Important Notes

1. **READ-ONLY Agent**: The shopify-app-ideator agent will NOT create or modify files. It provides analysis and recommendations only.

2. **User Approval is Required**: Do not proceed to technical planning without explicit user approval of the refined concept.

3. **Comprehensive Planning**: All technical planning (architecture, UX, framework) should be complete before creating todos.

4. **Documentation Last**: Generate documentation after all planning is complete to ensure it accurately reflects all decisions.

5. **Clear Handoff**: Provide clear next steps and guidance on how to start implementation with existing workflow commands.

## Success Criteria

The workflow is complete when:
- ✅ App idea is validated and refined
- ✅ User has approved the concept
- ✅ Complete system architecture is designed
- ✅ UX design plan is created
- ✅ Remix implementation plan is defined
- ✅ Implementation todos are created and prioritized
- ✅ Comprehensive documentation is generated
- ✅ User understands next steps for implementation

Remember: Your role is to transform a raw app idea into a fully-planned, well-documented project that's ready for implementation. Each phase builds upon the previous, creating a solid foundation for successful development.
