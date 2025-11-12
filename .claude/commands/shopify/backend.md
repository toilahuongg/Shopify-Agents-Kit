---
description: Shopify app backend development integrated with Scrum workflow. Converts features to PBIs, tracks in Sprint with daily standups, and demos in Sprint Review.
---

You are orchestrating Shopify app backend development **fully integrated with Scrum Agile methodology**. This command converts backend features into Product Backlog Items (PBIs), integrates with Sprint workflow, and follows all Scrum ceremonies.

## 🔄 Scrum Integration Overview

**How this integrates with Scrum:**

- **Before Sprint Planning**: Feature → User Stories → PBIs with acceptance criteria & story points
- **Sprint Planning**: PBIs selected based on velocity, added to Sprint Backlog
- **Daily Standup**: Track progress, update burndown, resolve impediments
- **During Sprint**: Implement with task breakdown, mark progress daily
- **Sprint Review**: Demo working backend APIs to stakeholders
- **Sprint Retro**: Capture technical learnings and process improvements

## Workflow Overview

This workflow follows **Scrum-integrated phases**:

1. **Story Creation Phase**: Convert feature to User Stories with acceptance criteria
2. **Backlog Integration Phase**: Create PBIs, estimate story points, add to Product Backlog
3. **Sprint Planning Phase**: Select PBIs for Sprint based on capacity
4. **Sprint Execution Phase**: Daily implementation with Standup tracking
5. **Sprint Review Phase**: Demo working backend, collect feedback
6. **Retrospective Phase**: Document learnings and improvements

## Phase 1: Story Creation & Analysis

### Step 1.1: Convert Feature to User Stories

Use the **product-owner** agent to convert the feature request into proper User Stories:

```
Convert this backend feature request into User Stories:

Feature: [description of what user wants to build]

For each User Story, provide:
- Title: Brief, descriptive title
- User Story Format: "As a [role], I want [feature], so that [benefit]"
- Acceptance Criteria: Given-When-Then format
- Technical Notes: Backend specifics (APIs, database, Shopify integration)
- Story Points Estimate: Use Fibonacci (1, 2, 3, 5, 8, 13)
- Dependencies: Any dependencies on other stories
- Priority: High/Medium/Low based on business value

Break down complex features into multiple smaller stories if needed.
```

### Step 1.2: Technical Analysis for Each Story

For each User Story, analyze technical requirements:

**Backend Functionality:**
- API endpoints needed (Remix loaders, actions, routes)
- Data models and business logic
- Request/response formats

**Database Requirements:**
- MongoDB schema design (collections, fields, relationships)
- Indexes for performance
- Data validation rules

**Shopify Integration:**
- Webhooks to subscribe to
- GraphQL queries/mutations needed
- REST API endpoints
- Required API scopes
- OAuth flows

**Remix Server-Side:**
- Loader functions for data fetching
- Action functions for mutations
- Session management
- Error boundaries

**Security & Performance:**
- Authentication/authorization requirements
- Input validation and sanitization
- Rate limiting strategies
- Caching considerations

Use the `Task` tool to launch specialized agents for technical research:
- `mongodb-expert` for schema design and query optimization
- `shopify-api-expert` for Shopify API integration patterns
- `remix-expert` for server-side framework patterns

### Step 1.3: Create Technical Implementation Plan

**Output Format for Each Story:**
```markdown
## User Story: [PBI-XXX] [Title]

**As a** [role]
**I want** [feature]
**So that** [benefit]

**Story Points:** [X points]

### Acceptance Criteria
1. Given [context], when [action], then [outcome]
2. Given [context], when [action], then [outcome]
3. ...

### Technical Architecture
- **MongoDB Collections**: [collections needed with schema]
- **API Endpoints**: [Remix routes: loaders, actions]
- **Shopify Integration**: [webhooks, GraphQL queries, scopes]
- **Authentication**: [auth requirements]

### Implementation Tasks
1. [Task 1] - [X hours]
2. [Task 2] - [X hours]
3. ...

### Security & Performance
- [Security measure 1]
- [Performance optimization 1]

### Dependencies
- [Dependency on other stories or external systems]

### Testing Strategy
- [How to verify this story is complete]
```

---

## Phase 2: Product Backlog Integration

### Step 2.1: Create Product Backlog Items (PBIs)

Use the **product-owner** agent to create PBIs in the Product Backlog:

```
Create Product Backlog Items from User Stories:

For each User Story:
1. Generate unique PBI ID (e.g., PBI-BACKEND-001)
2. Add to Product Backlog: .scrum/product-backlog.json
3. Include all fields:
   - id, title, description
   - userStory (As a... I want... So that...)
   - acceptanceCriteria (array of Given-When-Then)
   - storyPoints (estimated)
   - priority (based on business value)
   - status: "ready" (meets Definition of Ready)
   - type: "feature" or "technical"
   - labels: ["backend", "shopify-api", "mongodb", "remix"]
   - dependencies: [array of dependent PBI IDs]
   - technicalNotes: {
       database: [collections and schema],
       api: [endpoints needed],
       shopify: [integration details],
       security: [requirements]
     }

Load existing Product Backlog and append new items in priority order.
```

### Step 2.2: Estimate Story Points (Planning Poker)

If story points are not yet estimated, use Planning Poker:

```
Use /story-estimation command for each PBI:
- Present story to team
- Team votes using Fibonacci sequence
- Discuss extremes (high/low estimates)
- Reach consensus
- Record final estimate in PBI
```

### Step 2.3: Validate Definition of Ready

Ensure each PBI meets Definition of Ready before Sprint Planning:

```
Validate PBIs against Definition of Ready:

For each PBI, verify:
✅ User Story clearly defined
✅ Acceptance criteria specific and testable
✅ Story points estimated by team
✅ Dependencies identified
✅ Technical architecture defined
✅ No blockers or impediments
✅ Product Owner has prioritized
✅ Small enough to complete in one Sprint (<13 points)

Mark status: "ready" only if all criteria met.
```

### Step 2.4: User Review of Product Backlog

**User Approval Checkpoint:**
> **Product Backlog has been updated with [X] new backend PBIs. Please review:**
> - PBI-BACKEND-001: [Title] ([X] points)
> - PBI-BACKEND-002: [Title] ([X] points)
> - ...
>
> **Are these stories ready for Sprint Planning? Any changes needed?**

Wait for user confirmation before proceeding to Sprint Planning.

---

## Phase 3: Sprint Planning Integration

### Step 3.1: Check for Active Sprint

Use the **sprint-manager** agent to determine Sprint status:

```
Check Sprint status:
1. Is there an active Sprint?
2. If yes: What is Sprint capacity remaining?
3. If no: When is next Sprint Planning scheduled?

Load from: .scrum/sprints/current-sprint.json

Provide:
- Active Sprint: Yes/No
- Sprint Number: [X]
- Sprint Goal: [current goal]
- Committed Points: [X points]
- Available Capacity: [Y points remaining]
- Recommendation: Add to current Sprint or wait for next?
```

### Step 3.2: Sprint Planning Decision

**Option A: Add to Current Sprint (if capacity available)**

```
If Active Sprint has capacity AND PBIs align with Sprint Goal:
- Calculate: Current commitment + New PBIs ≤ Sprint capacity
- Verify: New work aligns with or enhances Sprint Goal
- Confirm: Team has bandwidth to take on additional work

If YES:
→ Proceed to add PBIs to current Sprint Backlog
→ Update Sprint commitment and burndown

If NO:
→ PBIs remain in Product Backlog
→ Schedule for next Sprint Planning
```

**Option B: Schedule for Next Sprint Planning**

```
If no active Sprint OR no capacity:
- PBIs remain in Product Backlog (status: "ready")
- Prioritize for next Sprint Planning
- Product Owner presents in next Sprint Planning ceremony

Use /sprint-planning command when ready to plan next Sprint.
```

### Step 3.3: Add PBIs to Sprint Backlog (If Option A)

Use the **sprint-manager** agent:

```
Add backend PBIs to current Sprint Backlog:

For each PBI being added:
1. Update Sprint Backlog: .scrum/sprints/sprint-[X]/backlog.json
2. Break down into implementation tasks
3. Estimate task hours
4. Assign tasks to developers (or mark for self-assignment)
5. Update Sprint commitment (points and hours)
6. Recalculate burndown with new work

Validate:
- New total commitment ≤ Sprint capacity
- Tasks fit within remaining Sprint days
- No conflicts with existing work

Update Sprint metrics:
- Committed points: [old] → [new]
- Committed items: [old] → [new]
- Remaining days: [X]
- Burndown adjusted: Yes
```

### Step 3.4: Task Breakdown for Each PBI

Use the **sprint-manager** or **todo-manager** agent:

```
For each PBI added to Sprint, create detailed implementation tasks:

PBI-BACKEND-XXX: [Title] ([X] points)

Tasks:
1. Design MongoDB schema for [collection] - [2h]
2. Create Remix route: /api/[endpoint] - [3h]
3. Implement loader function for data fetching - [2h]
4. Implement action function for mutations - [3h]
5. Set up Shopify webhook: [topic] - [2h]
6. Write GraphQL query: [queryName] - [2h]
7. Implement business logic: [feature] - [4h]
8. Add input validation and error handling - [2h]
9. Write unit tests (target: 80% coverage) - [3h]
10. Test integration with Shopify API - [2h]
11. Code review and refactoring - [1h]

Total: [26h] for [X] points

Link tasks to:
- Sprint: Sprint [X]
- PBI: PBI-BACKEND-XXX
- Developers: [assign or TBD]
```

**Typical Backend Task Structure**:
1. **Database Layer**: MongoDB schema, models, indexes
2. **API Layer**: Remix loaders/actions, route setup
3. **Shopify Integration**: Webhooks, GraphQL, OAuth
4. **Business Logic**: Core feature implementation
5. **Error Handling**: Validation, error boundaries, logging
6. **Security**: Authentication, authorization, input sanitization
7. **Testing**: Unit tests, integration tests, Shopify API testing
8. **Review**: Code review, performance check, security audit

---

## Phase 4: Sprint Execution (Implementation)

### Step 4.1: Daily Standup Integration

**Every day during the Sprint, use `/daily-standup` command to track progress:**

```
For each developer working on backend PBIs:

Yesterday:
- Completed: [Task X: MongoDB schema design]
- Progress: [Task Y: 70% done on Remix loader]

Today:
- Will work on: [Task Z: Shopify webhook setup]
- Plan to complete: [Task Y: Finish Remix loader]

Blockers:
- [Any impediments? e.g., "Shopify API rate limit issues"]
- [Need help with? e.g., "Need pair programming on GraphQL query"]

Update burndown:
- Mark completed tasks
- Update remaining hours
- Recalculate Sprint progress
```

**Daily Standup outputs**:
- Burndown chart updated automatically
- Sprint health status calculated
- Impediments logged and tracked
- Team velocity trend visible

### Step 4.2: Task Implementation Process

Work through Sprint tasks systematically. For each task:

1. **Mark Task as In Progress**: Update Sprint Backlog before starting

2. **Select Appropriate Agent**: Based on the task's focus area, launch the relevant agent:

   - **For Database Work** (schema, queries, aggregations, indexes):
     ```
     Task tool → mongodb-expert
     - Designing MongoDB schemas and data models
     - Writing aggregation pipelines
     - Optimizing queries and indexes
     - Handling data relationships (embed vs reference)
     - Performance tuning database operations
     ```

   - **For Shopify API Integration** (webhooks, GraphQL, OAuth):
     ```
     Task tool → shopify-api-expert
     - Implementing OAuth authentication flow
     - Setting up webhook endpoints and verification
     - Writing GraphQL queries and mutations
     - Handling Shopify API rate limits
     - Managing API scopes and permissions
     ```

   - **For Remix Server-Side Work** (loaders, actions, sessions):
     ```
     Task tool → remix-expert
     - Implementing loader functions for data fetching
     - Creating action functions for mutations
     - Setting up session management
     - Handling form submissions server-side
     - Implementing error boundaries
     - Server-side validation and sanitization
     ```

3. **Implementation Guidelines**:
   - Provide clear context to the agent about what needs to be done
   - Reference the original plan and todo details
   - Ask the agent to implement according to best practices
   - Have agents explain their implementation choices
   - Ensure proper error handling and validation
   - Include security considerations in implementation

4. **Mark as Complete**: After the agent completes the implementation:
   - Verify the acceptance criteria are met
   - Update the todo status to completed
   - Note any important outcomes or decisions

5. **Integration Points**: When work spans multiple domains:
   - Start with database schema (MongoDB structure)
   - Implement Remix loaders/actions to interact with database
   - Add Shopify API integration where needed
   - Ensure proper error handling throughout the stack

## Agent Coordination Strategy

**Implementation Flow**:
```
1. mongodb-expert designs schema and sets up collections
   ↓
2. remix-expert creates route structure with loaders/actions
   ↓
3. shopify-api-expert integrates Shopify webhooks and API calls
   ↓
4. All agents collaborate on business logic implementation
   ↓
5. code-reviewer performs comprehensive review
```

**When to use each agent**:

- **mongodb-expert**:
  - Schema design decisions (embed vs reference)
  - Complex aggregation pipelines
  - Query optimization and indexing
  - Data migration strategies
  - Performance troubleshooting

- **shopify-api-expert**:
  - OAuth flow implementation
  - Webhook setup and signature verification
  - GraphQL query/mutation writing
  - Rate limit handling
  - Shopify app configuration

- **remix-expert**:
  - Route structure and file organization
  - Loader/action implementation
  - Session management
  - Server-side form handling
  - Error boundary setup
  - Response headers and caching

**Agent Handoff Pattern**:
When a task involves multiple domains, coordinate agents sequentially and ensure they understand the context from previous implementations.

### Step 4.3: Track Impediments

If blockers arise during implementation:

```
Use /daily-standup to log impediments:

Impediment: [Description of blocker]
Type: [Technical/Process/External]
Impact: [High/Medium/Low]
Affected PBIs: [PBI-BACKEND-XXX]
Reported by: [Developer name]
Date logged: [YYYY-MM-DD]

Use impediment-resolver agent to:
1. Classify impediment severity
2. Identify resolution strategies
3. Assign owner to resolve
4. Track resolution time
5. Update team when resolved
```

**Common backend impediments:**
- Shopify API rate limits or downtime
- MongoDB connection or performance issues
- Remix framework version conflicts
- Missing API scopes or permissions
- Third-party service dependencies
- Unclear acceptance criteria

---

## Phase 5: Sprint Review & Demo

### Step 5.1: Prepare for Sprint Review

Use the **increment-validator** agent to validate backend work:

```
Validate backend PBIs before Sprint Review:

For each PBI-BACKEND-XXX:
1. All acceptance criteria met? (Yes/No)
2. Definition of Done satisfied?
   - Code reviewed and approved
   - Unit tests written (80%+ coverage)
   - Integration tests passing
   - Security scan passed
   - API documentation updated
   - No critical bugs
3. Ready to demo? (Yes/No)
4. API endpoints working in staging?
5. Shopify integration tested?

Generate validation report:
- PBIs ready for demo: [X]
- PBIs not ready: [Y] (reasons)
- Overall Sprint Goal status: [Achieved/Not Achieved]
```

### Step 5.2: Demo Backend Features (Sprint Review)

**Use `/sprint-review` command to conduct Sprint Review ceremony:**

For backend features, demonstrate:

```
Demo Plan for Backend PBIs:

1. Show working API endpoints
   - Use Postman/curl to demonstrate API calls
   - Show request/response with actual data
   - Demonstrate error handling

2. Show Shopify integration
   - Trigger webhooks from Shopify test store
   - Show webhook processing and data storage
   - Demonstrate GraphQL queries returning data

3. Show database operations
   - MongoDB collections with real data
   - Demonstrate CRUD operations
   - Show query performance and indexes

4. Show business logic
   - Walk through feature flow end-to-end
   - Demonstrate edge cases and validation
   - Show error handling and recovery

For each PBI:
- Title and story points
- User story reminder
- Live demo of functionality
- Acceptance criteria validation
- Stakeholder Q&A
```

### Step 5.3: Collect Stakeholder Feedback

During Sprint Review, capture feedback:

```
Use product-owner agent to record feedback:

For each backend feature demoed:
- Feedback: [stakeholder comments]
- From: [stakeholder name/role]
- Type: [enhancement/bug/new-feature/change]
- Priority: [high/medium/low]
- Action: [create new PBI/modify existing/defer]

Create new PBIs for:
- Feature enhancements requested
- Bugs discovered during demo
- New requirements identified
- Performance improvements needed
```

### Step 5.4: Calculate Velocity

Use **scrum-metrics-analyzer** agent:

```
Calculate Sprint velocity for backend work:

Backend PBIs committed: [X] points
Backend PBIs completed: [Y] points
Backend velocity: [Y] points
Completion rate: [Y/X]%

Update velocity history:
- Sprint [N]: [Y] points
- 5-Sprint average: [Z] points
- Trend: [Improving/Stable/Declining]

Use this data for next Sprint Planning capacity estimation.
```

---

## Phase 6: Sprint Retrospective

### Step 6.1: Backend Technical Retrospective

**Use `/sprint-retro` command, focusing on backend development process:**

```
Retrospective topics for backend team:

Start-Stop-Continue format:

START:
- What backend practices should we start?
- New tools or libraries to adopt?
- Better MongoDB patterns to implement?
- Improved Shopify API handling?

STOP:
- What backend practices to stop?
- Inefficient database queries?
- Over-complicated API designs?
- Time-wasting debugging patterns?

CONTINUE:
- What backend practices worked well?
- Effective code review process?
- Good test coverage maintenance?
- Strong Shopify integration patterns?

Technical learnings:
- MongoDB best practices learned
- Shopify API gotchas discovered
- Remix server-side patterns that worked
- Performance optimization insights
```

### Step 6.2: Create Improvement Action Items

```
From Retrospective, create action items:

Action 1: [Technical improvement]
- What: [Specific change to make]
- Why: [Problem it solves]
- Owner: [Backend team member]
- Done by: [Next Retrospective]
- Success metric: [How to measure]

Example actions:
- Add MongoDB query performance monitoring
- Create Shopify API rate limit handler
- Implement centralized error logging
- Set up automated API integration tests
- Document common Remix patterns

Add actions to next Sprint Backlog as technical debt items.
```

---

## Phase 7: Code Review & Quality Assurance

### Step 7.1: Comprehensive Code Review

After implementation, use the `Task` tool to launch the `code-reviewer` agent:

```
Launch code-reviewer agent with:
- Review all implemented code for quality, security, and best practices
- Check for potential bugs, security vulnerabilities, or performance issues
- Verify error handling and edge case management
- Ensure code follows best practices for Remix, MongoDB, and Shopify API
- Validate that implementation matches the approved plan
```

**Review Focus Areas**:
- **Security**: Authentication, authorization, input validation, SQL injection prevention, XSS protection
- **Performance**: Database query optimization, N+1 query problems, caching strategies
- **Error Handling**: Proper try-catch blocks, user-friendly error messages, logging
- **Code Quality**: Readability, maintainability, TypeScript types, documentation
- **Best Practices**: Framework conventions, API design patterns, RESTful principles
- **Shopify Integration**: Proper webhook verification, rate limit handling, API scope usage

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

## Quality Checkpoints

Throughout implementation, ensure:
- ✅ Database schema is properly designed with appropriate indexes
- ✅ API endpoints follow RESTful conventions
- ✅ Shopify webhooks are properly verified and handled
- ✅ Authentication and authorization are correctly implemented
- ✅ Input validation and sanitization are in place
- ✅ Error handling covers edge cases
- ✅ TypeScript types are properly defined
- ✅ Code is production-ready and secure
- ✅ Performance considerations are addressed
- ✅ Rate limiting is implemented where needed

## Progress Tracking

Keep the user informed:
- Update them when starting a new phase
- Mark todos as complete after each implementation
- Highlight any blockers or deviations from the plan
- Share key decisions made during implementation
- Present code review findings clearly
- Summarize what was accomplished at the end

## Example Workflow

```
User Request: "Build a Shopify app that tracks order history and calculates customer lifetime value"

Phase 1 - Planning:
→ Analyze: Need MongoDB to store order data, Shopify API to fetch orders, Remix for API endpoints
→ Create detailed plan:
  - MongoDB: customers, orders, analytics collections
  - Shopify: order webhooks, GraphQL queries for historical data
  - Remix: loaders for dashboards, actions for data refresh
  - Business logic: CLV calculation algorithm

Phase 2 - Approval:
→ Present plan to user with schema design and API specs
→ User: "Looks good, proceed"

Phase 3 - Todo Creation:
→ Launch todo-manager
→ Todos created:
   [ ] Design MongoDB schema for customers, orders, analytics
   [ ] Set up MongoDB connection and models
   [ ] Implement Shopify OAuth authentication
   [ ] Create webhook endpoint for order creation/updates
   [ ] Implement GraphQL query to fetch historical orders
   [ ] Create Remix loader for customer dashboard
   [ ] Implement CLV calculation logic
   [ ] Add error handling and validation
   [ ] Implement rate limiting for Shopify API calls

Phase 4 - Implementation:
→ Mark todo 1 in_progress
→ Launch mongodb-expert → Design schema with proper indexes
→ Mark todo 1 complete

→ Mark todo 2 in_progress
→ Launch remix-expert → Set up database connection
→ Mark todo 2 complete

→ Mark todo 3 in_progress
→ Launch shopify-api-expert → Implement OAuth flow
→ Mark todo 3 complete

→ Mark todo 4 in_progress
→ Launch shopify-api-expert → Create webhook endpoint with verification
→ Mark todo 4 complete

... continue until all todos complete

Phase 5 - Code Review:
→ Launch code-reviewer
→ Review findings:
  - ✅ Security: Webhook verification implemented correctly
  - ⚠️  Performance: Add index on customers.shopifyId
  - ✅ Error handling: Comprehensive try-catch blocks
  - ⚠️  Minor: Consider caching CLV calculations

→ Address critical/major issues if any
→ Discuss minor improvements with user

Final: Confirm all requirements met, provide deployment guidance
```

## Error Handling

If issues arise during implementation:
1. Document the problem clearly with error messages
2. Update the relevant todo with blocker information
3. Consult the appropriate specialist agent for solutions
4. If architectural changes needed, seek user approval
5. Continue with other non-blocked todos if possible

## Security Best Practices

Ensure throughout implementation:
- All user inputs are validated and sanitized
- Shopify webhook signatures are verified
- Session tokens are properly managed
- API endpoints have proper authentication
- Sensitive data is not logged
- Environment variables are used for secrets
- Rate limiting is implemented
- CORS is properly configured
- Database queries prevent injection attacks

## Success Criteria

The workflow is complete when:
- ✅ All todos are marked complete
- ✅ Code review has been performed
- ✅ Critical and major issues (if any) have been resolved
- ✅ Database schema is optimized with proper indexes
- ✅ Shopify API integration works correctly
- ✅ All API endpoints function as expected
- ✅ Security measures are in place
- ✅ Error handling is comprehensive
- ✅ Implementation matches the approved plan
- ✅ User confirms the functionality works as expected

## Post-Implementation Guidance

After successful completion, provide the user with:
1. Summary of what was built
2. Database schema documentation
3. API endpoint documentation
4. Shopify webhook configuration instructions
5. Environment variables needed
6. Testing recommendations
7. Deployment considerations
8. Monitoring and maintenance suggestions

Remember: Your role is to orchestrate these specialized agents effectively, ensuring smooth coordination between MongoDB database, Shopify API, and Remix framework to deliver high-quality, secure, and performant Shopify app backends.
