---
description: Shopify app frontend development integrated with Scrum workflow. Converts UI features to PBIs, tracks in Sprint with daily standups, and demos in Sprint Review.
---

You are orchestrating Shopify app frontend development **fully integrated with Scrum Agile methodology**. This command converts UI features into Product Backlog Items (PBIs), integrates with Sprint workflow, and follows all Scrum ceremonies.

## 🔄 Scrum Integration Overview

**How this integrates with Scrum:**

- **Before Sprint Planning**: UI Feature → User Stories → PBIs with acceptance criteria & story points
- **Sprint Planning**: PBIs selected based on velocity, added to Sprint Backlog
- **Daily Standup**: Track UI component progress, update burndown, resolve blockers
- **During Sprint**: Implement with task breakdown, mark progress daily
- **Sprint Review**: Demo working UI to stakeholders (interactive demo)
- **Sprint Retro**: Capture UX learnings, accessibility improvements, component patterns

## Workflow Overview

This workflow follows **Scrum-integrated phases**:

1. **Story Creation Phase**: Convert UI feature to User Stories with acceptance criteria
2. **Backlog Integration Phase**: Create PBIs, estimate story points, add to Product Backlog
3. **Sprint Planning Phase**: Select UI PBIs for Sprint based on capacity
4. **Sprint Execution Phase**: Daily implementation with Standup tracking
5. **Sprint Review Phase**: Interactive UI demo, collect UX feedback
6. **Retrospective Phase**: Document UX learnings and component patterns

## Phase 1: Story Creation & Analysis

### Step 1.1: Convert UI Feature to User Stories

Use the **product-owner** agent to convert the UI feature request into proper User Stories:

```
Convert this frontend feature request into User Stories:

Feature: [description of UI feature user wants to build]

For each User Story, provide:
- Title: Brief, descriptive title
- User Story Format: "As a [merchant/admin], I want [UI feature], so that [benefit]"
- Acceptance Criteria: Given-When-Then format + UX criteria
- Technical Notes: Frontend specifics (Remix routes, Polaris components, App Bridge)
- Story Points Estimate: Use Fibonacci (1, 2, 3, 5, 8, 13)
- Dependencies: Any dependencies on other stories or backend APIs
- Priority: High/Medium/Low based on user value
- UX Considerations: Accessibility, responsiveness, user experience

Break down complex UI features into multiple smaller stories if needed.
```

### Step 1.2: Technical Analysis for Each UI Story

For each User Story, analyze technical requirements:

**Remix Framework:**
- Routes needed (file structure, nesting)
- Loader functions for data fetching
- Action functions for form handling
- Error boundaries for error handling

**Polaris UI Components:**
- Layout components (Page, Layout, Card)
- Form components (TextField, Select, Checkbox, etc.)
- Data display (DataTable, ResourceList, etc.)
- Feedback components (Toast, Banner, Modal)
- Navigation components (Tabs, Pagination, etc.)

**App Bridge Integration:**
- App initialization and config
- Authentication flow
- Navigation within embedded context
- Resource pickers (Product, Collection, etc.)
- Action triggers (Toast, Modal, Redirect)

**UX & Accessibility:**
- Responsive design requirements
- Keyboard navigation support
- Screen reader compatibility (ARIA labels)
- Color contrast and visual accessibility
- Loading states and error handling UX
- Mobile experience

Use the `Task` tool to launch specialized agents for technical research:
- `shopify-polaris-expert` for UI/design system patterns
- `shopify-app-bridge-expert` for embedded app features
- `remix-expert` for framework-specific patterns
- `ux-design-expert` for user experience and accessibility guidance

**Planning Output Format**:
```markdown
## Shopify App Implementation Plan

### Overview
[Brief description of what will be built]

### Architecture
- **Routes**: [List of Remix routes needed]
- **Key Components**: [Polaris components to use]
- **App Bridge Features**: [Authentication, navigation, etc.]

### Implementation Steps
1. [Step 1 with details]
2. [Step 2 with details]
...

### Technical Considerations
- [Consideration 1]
- [Consideration 2]

### Testing Approach
[How to verify the implementation works]
```

## Phase 2: User Approval

After creating the plan:
1. Present the complete plan to the user clearly
2. Ask: "Does this plan look good to you? Should I proceed with creating the todos and implementing?"
3. Wait for user confirmation before proceeding
4. If user requests changes, modify the plan accordingly and ask for approval again

## Phase 3: Task Management

Once the plan is approved, use the `Task` tool to launch the `todo-manager` agent:

```
Launch todo-manager agent with:
- Break down the approved plan into specific, actionable todos
- Each todo should be clear and measurable
- Include acceptance criteria for each todo
- Organize todos in logical implementation order
```

The todo-manager will create a structured task list following this format:
- Clear, actionable descriptions
- Specific acceptance criteria
- Logical ordering with dependencies noted
- Examples where helpful

## Phase 4: Implementation

Work through the todos systematically. For each todo:

1. **Mark as In Progress**: Update the todo status to in_progress before starting

2. **Select Appropriate Agent**: Based on the todo's focus area, launch the relevant agent:

   - **For Remix-specific work** (routes, loaders, actions, forms):
     ```
     Task tool → remix-expert
     - Implementing loader/action functions
     - Setting up routes and nested routing
     - Form handling and mutations
     - Data fetching patterns
     ```

   - **For Polaris UI work** (components, layouts, design):
     ```
     Task tool → shopify-polaris-expert
     - Implementing Polaris components
     - Layout and page structure
     - Form components and validation UI
     - Data tables and lists
     ```

   - **For App Bridge features** (embedded app, authentication, navigation):
     ```
     Task tool → shopify-app-bridge-expert
     - App initialization and setup
     - Authentication flow
     - Navigation and routing within embedded context
     - App Bridge UI components (Toast, Modal, etc.)
     ```

3. **Implementation Guidelines**:
   - Provide clear context to the agent about what needs to be done
   - Reference the original plan and todo details
   - Ask the agent to implement according to best practices
   - Have agents explain their implementation choices

4. **Mark as Complete**: After the agent completes the implementation:
   - Verify the acceptance criteria are met
   - Update the todo status to completed
   - Note any important outcomes or decisions

5. **Integration Points**: When work spans multiple domains:
   - Start with Remix structure (routes, loaders, actions)
   - Add Polaris UI components to the routes
   - Integrate App Bridge features where needed
   - Test the integration

## Agent Coordination Strategy

**When to use multiple agents**:
- For a complete feature, you might use remix-expert for route setup, shopify-polaris-expert for UI, and shopify-app-bridge-expert for embedded app features
- Work sequentially: structure → UI → embedded features
- Have agents review each other's work when integration is critical

**Agent Handoff Pattern**:
```
1. remix-expert creates the route structure and data loading
   ↓
2. shopify-polaris-expert implements the UI components
   ↓
3. shopify-app-bridge-expert adds embedded app features
   ↓
4. Verify integration and functionality
   ↓
5. code-reviewer performs comprehensive review
```

## Quality Checkpoints

Throughout implementation, ensure:
- ✅ Code follows Remix conventions (file-based routing, loaders/actions)
- ✅ UI uses proper Polaris components and patterns
- ✅ App Bridge is correctly initialized and used
- ✅ TypeScript types are properly defined
- ✅ Error handling is implemented
- ✅ Accessibility standards are met
- ✅ Code is production-ready

## Progress Tracking

Keep the user informed:
- Update them when starting a new phase
- Mark todos as complete after each implementation
- Highlight any blockers or deviations from the plan
- Summarize what was accomplished at the end

## Example Workflow

```
User Request: "Build a product selector page for my Shopify app"

Phase 1 - Planning:
→ Analyze: Need Remix route, Polaris DataTable, App Bridge ResourcePicker
→ Create detailed plan covering routes, UI, and App Bridge integration

Phase 2 - Approval:
→ Present plan to user
→ User: "Looks good, proceed"

Phase 3 - Todo Creation:
→ Launch todo-manager
→ Todos created:
   [ ] Create Remix route with loader to fetch products
   [ ] Implement Polaris page layout with DataTable
   [ ] Add App Bridge ResourcePicker for product selection
   [ ] Implement selection handling and state management
   [ ] Add error handling and loading states

Phase 4 - Implementation:
→ Mark todo 1 in_progress
→ Launch remix-expert → Create route structure
→ Mark todo 1 complete

→ Mark todo 2 in_progress
→ Launch shopify-polaris-expert → Implement UI
→ Mark todo 2 complete

→ Mark todo 3 in_progress
→ Launch shopify-app-bridge-expert → Add ResourcePicker
→ Mark todo 3 complete

... continue until all todos complete

Phase 5 - Code Review:
→ Launch code-reviewer
→ Review findings:
  - ✅ Code Quality: Well-structured components and routes
  - ✅ Remix: Proper loader/action usage
  - ✅ Polaris: Correct component implementation
  - ✅ App Bridge: Properly initialized and integrated
  - ⚠️  Accessibility: Add ARIA labels to DataTable
  - ⚠️  Performance: Consider lazy loading for ResourcePicker

→ Address critical/major issues if any
→ Discuss minor improvements with user

Final: Verify integration, test functionality, confirm with user
```

## Phase 5: Code Review

After all todos are completed, use the `Task` tool to launch the `code-reviewer` agent:

```
Launch code-reviewer agent with:
- Review all implemented code for quality, security, and best practices
- Check for potential bugs, security vulnerabilities, or performance issues
- Verify error handling and edge case management
- Ensure code follows best practices for Remix, Polaris, and App Bridge
- Validate that implementation matches the approved plan
- Check accessibility compliance (WCAG standards)
- Verify TypeScript types are properly defined
```

**Review Focus Areas**:
- **Code Quality**: Readability, maintainability, component structure, TypeScript types
- **Remix Best Practices**: Proper loader/action usage, error boundaries, progressive enhancement
- **Polaris Guidelines**: Correct component usage, design patterns, accessibility
- **App Bridge Integration**: Proper initialization, authentication, navigation patterns
- **Performance**: Bundle size, lazy loading, prefetching strategies
- **Accessibility**: ARIA labels, keyboard navigation, screen reader support
- **Error Handling**: Try-catch blocks, user-friendly error messages, fallback UI
- **Security**: XSS prevention, CSRF protection, input sanitization

**Post-Review Actions**:
1. If the code-reviewer identifies critical issues:
   - Create new todos for fixes
   - Mark them as high priority
   - Implement fixes with appropriate agents
   - Re-review after fixes

2. If the code-reviewer identifies minor improvements:
   - Discuss with user whether to implement now or defer
   - Create todos if user wants improvements

3. If the code passes review:
   - Summarize what was built
   - Confirm all acceptance criteria are met
   - Provide guidance on testing and deployment

## Error Handling

If issues arise during implementation:
1. Document the problem clearly
2. Update the relevant todo with blocker information
3. Consult the appropriate specialist agent
4. Adjust the plan if needed with user approval
5. Continue with other non-blocked todos if possible

## Success Criteria

The workflow is complete when:
- ✅ All todos are marked complete
- ✅ Code review has been performed
- ✅ Critical and major issues (if any) have been resolved
- ✅ Code follows all best practices for Remix, Polaris, and App Bridge
- ✅ Implementation matches the approved plan
- ✅ Accessibility standards are met
- ✅ User confirms the functionality works as expected

## Post-Implementation Guidance

After successful completion, provide the user with:
1. Summary of what was built
2. Component structure documentation
3. Route configuration details
4. App Bridge setup instructions
5. Environment variables needed (if any)
6. Testing recommendations
7. Deployment considerations
8. Performance optimization tips

Remember: Your role is to orchestrate these specialized agents effectively, ensuring smooth coordination between Remix framework, Polaris design system, and App Bridge features to deliver high-quality, reviewed, and production-ready Shopify app frontends.
