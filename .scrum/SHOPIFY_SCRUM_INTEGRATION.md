# Shopify Development with Scrum Integration

## Overview

The `/shopify:backend` and `/shopify:frontend` commands are now **fully integrated with Scrum Agile methodology**. Instead of standalone workflows, they now work seamlessly with Sprint Planning, Daily Standups, Sprint Reviews, and Sprint Retrospectives.

---

## 🔄 How It Works

### **Old Workflow (Standalone)**
```
User Request → Plan → Approve → Create Todos → Implement → Review → Done
```

### **New Workflow (Scrum-Integrated)**
```
User Request
  ↓
1. Convert to User Stories (with acceptance criteria)
  ↓
2. Create Product Backlog Items (PBIs) with story points
  ↓
3. Add to Product Backlog (.scrum/product-backlog.json)
  ↓
4. Sprint Planning: Select PBIs based on team velocity
  ↓
5. During Sprint:
   - Daily Standup: Track progress, update burndown
   - Implement features with specialized agents
   - Resolve impediments as they arise
  ↓
6. Sprint Review: Demo working features to stakeholders
  ↓
7. Sprint Retro: Capture learnings and improvements
  ↓
8. Repeat for next Sprint
```

---

## 📋 Workflow Phases

### **Phase 1: Story Creation** (Before Sprint Planning)

**Commands:**
- `/shopify:backend [feature description]`
- `/shopify:frontend [feature description]`

**What happens:**
1. **Product Owner agent** converts feature to User Stories
2. Each story gets:
   - Title and description
   - User Story format: "As a [role], I want [feature], so that [benefit]"
   - Acceptance Criteria (Given-When-Then)
   - Story Points estimate (Fibonacci: 1, 2, 3, 5, 8, 13)
   - Technical notes (database, API, UI components)
   - Dependencies
   - Priority

**Output:**
```json
{
  "id": "PBI-BACKEND-001",
  "title": "Product sync webhook handler",
  "userStory": "As a merchant, I want product changes to sync automatically, so that my data is always up-to-date",
  "acceptanceCriteria": [
    "Given a product is updated in Shopify, when webhook is triggered, then data is saved to MongoDB",
    "Given webhook signature is invalid, when request arrives, then it is rejected with 401"
  ],
  "storyPoints": 5,
  "priority": "high",
  "status": "ready",
  "type": "feature",
  "labels": ["backend", "shopify-api", "mongodb", "webhook"]
}
```

---

### **Phase 2: Product Backlog Integration**

**What happens:**
1. PBIs are added to `.scrum/product-backlog.json`
2. Product Owner prioritizes based on business value
3. Items validated against Definition of Ready:
   - ✅ User Story clear
   - ✅ Acceptance criteria testable
   - ✅ Story points estimated
   - ✅ Dependencies identified
   - ✅ Technical architecture defined
   - ✅ Small enough for one Sprint (<13 points)

**User checkpoint:**
> "Product Backlog updated with 3 new backend PBIs (total 18 points). Ready for Sprint Planning?"

---

### **Phase 3: Sprint Planning Integration**

**Command:** `/sprint-planning`

**What happens:**
1. **sprint-manager** checks team velocity (e.g., 30 points/Sprint)
2. Product Owner presents PBIs in priority order
3. Team selects PBIs that fit within capacity
4. Each PBI is broken down into implementation tasks:

**Example Task Breakdown:**
```
PBI-BACKEND-001: Product sync webhook handler (5 points)

Tasks:
1. Design MongoDB schema for products - 2h
2. Create Remix route: /api/webhooks/products - 3h
3. Implement webhook signature verification - 2h
4. Write product sync logic with upsert - 4h
5. Add error handling and retry logic - 2h
6. Write unit tests (80% coverage) - 3h
7. Test with Shopify test store - 2h
8. Code review - 1h

Total: 19 hours
```

**PBIs are added to Sprint Backlog:**
`.scrum/sprints/sprint-005/backlog.json`

---

### **Phase 4: Sprint Execution (Implementation)**

**Daily Routine:**

#### **Every Morning: Daily Standup**

**Command:** `/daily-standup`

```
Developer updates:

Yesterday:
- ✅ Completed: Task 1 (MongoDB schema design)
- 🔄 Progress: Task 2 (Remix route - 70% done)

Today:
- Will complete: Task 2 (Remix route)
- Will start: Task 3 (Webhook signature verification)

Blockers:
- Need clarification on Shopify webhook retry policy
```

**Automatic updates:**
- Burndown chart refreshed
- Sprint health calculated
- Velocity trend updated
- Impediments logged

#### **During Development:**

Use specialized agents for implementation:

**Backend Development:**
```
Task: Design MongoDB schema
→ Launch mongodb-expert agent
→ Create collections, indexes, relationships
→ Mark task complete

Task: Create Remix route
→ Launch remix-expert agent
→ Implement loader/action functions
→ Mark task complete

Task: Implement webhook verification
→ Launch shopify-api-expert agent
→ Add signature verification logic
→ Mark task complete
```

**Frontend Development:**
```
Task: Create product list page
→ Launch remix-expert for route structure
→ Launch shopify-polaris-expert for UI components
→ Launch shopify-app-bridge-expert for embedded features
→ Mark task complete
```

#### **Track Impediments:**

If blockers arise:
```
Impediment: Shopify API rate limit exceeded during testing
Type: External
Impact: High (blocking Task 7)
Affected PBI: PBI-BACKEND-001
Logged: 2024-01-15

Use impediment-resolver agent:
→ Classify severity
→ Identify workaround (use sandbox environment)
→ Track resolution time
→ Update team when resolved
```

---

### **Phase 5: Sprint Review (Demo)**

**Command:** `/sprint-review`

**What happens:**

1. **Validate Increment** (increment-validator agent):
```
PBI-BACKEND-001: Product sync webhook handler
✅ All acceptance criteria met
✅ Definition of Done satisfied:
   - Code reviewed ✅
   - Tests written (85% coverage) ✅
   - Security scan passed ✅
   - API docs updated ✅
✅ Ready to demo
```

2. **Demo to Stakeholders:**

**Backend Demo:**
```
1. Show API endpoint working
   - Postman: POST /api/webhooks/products
   - Show request/response
   - Show data in MongoDB

2. Show Shopify integration
   - Update product in Shopify test store
   - Webhook triggers automatically
   - Data syncs to MongoDB
   - Show error handling

3. Show performance
   - 100 products synced in <5 seconds
   - Query performance with indexes
```

**Frontend Demo:**
```
1. Show UI components
   - Polaris design system compliance
   - Responsive layout on mobile/desktop
   - Loading states and error messages

2. Show user flow
   - Navigate through feature
   - Submit form with validation
   - Show feedback (Toast, Banner)

3. Show accessibility
   - Keyboard navigation
   - Screen reader support
   - Color contrast compliance
```

3. **Collect Feedback:**
```
Stakeholder: "Great work! Can we add bulk sync feature?"
→ product-owner creates new PBI: PBI-BACKEND-004
→ Add to Product Backlog for future Sprint
```

4. **Calculate Velocity:**
```
Backend PBIs committed: 18 points
Backend PBIs completed: 16 points
Velocity this Sprint: 16 points
5-Sprint average: 17 points
Trend: Stable ✅
```

---

### **Phase 6: Sprint Retrospective**

**Command:** `/sprint-retro`

**What happens:**

**Format: Start-Stop-Continue**

```
START:
- Pair programming on complex Shopify API integrations
- MongoDB query performance monitoring
- Automated accessibility testing for Polaris components

STOP:
- Skipping code review for "small" changes
- Manual testing of webhooks (automate instead)
- Late-day implementation (causes rushed code)

CONTINUE:
- Strong MongoDB schema design practices
- Polaris design system compliance
- Fast impediment resolution
- Good test coverage (85%+)
```

**Technical Learnings:**
```
MongoDB:
- Compound indexes improved query speed by 10x
- Embedding vs referencing: when to use each

Shopify API:
- Rate limit handling pattern that worked well
- Webhook signature verification gotcha discovered

Polaris UI:
- ResourceList component perfect for product lists
- Toast feedback better UX than Banners for success

Remix:
- Loader/action pattern scales well
- Error boundaries caught edge cases effectively
```

**Action Items:**
```
Action 1: Create Shopify API rate limit handler utility
- Owner: @backend-team-lead
- Done by: Next Sprint
- Success: Rate limit errors reduced to zero

Action 2: Document Polaris component patterns
- Owner: @frontend-team-lead
- Done by: Next Sprint
- Success: New devs can reference pattern library

→ Add to next Sprint Backlog as technical debt items
```

---

## 🎯 Benefits of Scrum Integration

### **For Product Owners:**
✅ Features become User Stories with clear business value
✅ Easy to prioritize based on business needs
✅ Velocity data helps predict delivery timelines
✅ Sprint Reviews provide regular demos and feedback

### **For Developers:**
✅ Work is tracked in Sprint Backlog, not scattered todos
✅ Daily Standups keep everyone aligned
✅ Impediments are logged and resolved systematically
✅ Retrospectives capture technical learnings

### **For Stakeholders:**
✅ Regular Sprint Reviews show working software
✅ Feedback is captured and converted to new PBIs
✅ Predictable delivery based on velocity trends
✅ Transparency into what's being built and why

---

## 📊 Scrum Artifacts Integration

### **Product Backlog**
`.scrum/product-backlog.json`
```json
{
  "items": [
    {
      "id": "PBI-BACKEND-001",
      "title": "Product sync webhook handler",
      "storyPoints": 5,
      "priority": "high",
      "status": "ready",
      "labels": ["backend", "shopify-api"]
    },
    {
      "id": "PBI-FRONTEND-002",
      "title": "Product list page with Polaris UI",
      "storyPoints": 8,
      "priority": "high",
      "status": "ready",
      "labels": ["frontend", "polaris"]
    }
  ]
}
```

### **Sprint Backlog**
`.scrum/sprints/sprint-005/backlog.json`
```json
{
  "sprintNumber": 5,
  "sprintGoal": "Enable product data sync and merchant management UI",
  "committedPoints": 18,
  "items": [
    {
      "pbiId": "PBI-BACKEND-001",
      "tasks": [
        {"id": 1, "description": "MongoDB schema", "hours": 2, "status": "done"},
        {"id": 2, "description": "Remix route", "hours": 3, "status": "in_progress"},
        {"id": 3, "description": "Webhook verification", "hours": 2, "status": "pending"}
      ]
    }
  ]
}
```

### **Velocity History**
`.scrum/metrics/velocity-history.json`
```json
{
  "sprints": [
    {"sprint": 1, "velocity": 15, "commitment": 18, "completionRate": 0.83},
    {"sprint": 2, "velocity": 18, "commitment": 20, "completionRate": 0.90},
    {"sprint": 3, "velocity": 16, "commitment": 18, "completionRate": 0.89},
    {"sprint": 4, "velocity": 17, "commitment": 18, "completionRate": 0.94},
    {"sprint": 5, "velocity": 16, "commitment": 18, "completionRate": 0.89}
  ],
  "average": 17,
  "trend": "stable"
}
```

---

## 🚀 Complete Example: Backend Feature Flow

### **Day 1: Feature Request**
```bash
User: "I need a webhook to sync product data from Shopify to MongoDB"
```

### **Day 1: Story Creation**
```bash
# Run command
/shopify:backend "Webhook to sync product data from Shopify to MongoDB"

# Output: User Story created
PBI-BACKEND-001: Product sync webhook handler (5 points)

As a merchant
I want product changes to sync automatically
So that my data is always up-to-date

Acceptance Criteria:
✅ Webhook receives Shopify product updates
✅ Webhook signature is verified
✅ Product data is saved to MongoDB
✅ Invalid webhooks are rejected
✅ Errors are logged and handled

Status: Ready for Sprint Planning
```

### **Day 2: Sprint Planning**
```bash
# Run command
/sprint-planning

# Team selects PBI-BACKEND-001 for Sprint 5
# Tasks created:
1. MongoDB schema - 2h
2. Remix route - 3h
3. Webhook verification - 2h
4. Sync logic - 4h
5. Error handling - 2h
6. Tests - 3h
7. Integration test - 2h
8. Code review - 1h

Sprint 5 Backlog updated: 18 points committed
```

### **Day 3-7: Sprint Execution**
```bash
# Each morning
/daily-standup

Day 3:
Yesterday: ✅ Task 1 done
Today: Work on Task 2 and 3
Blockers: None

Day 4:
Yesterday: ✅ Task 2 and 3 done
Today: Work on Task 4
Blockers: None

Day 5:
Yesterday: ✅ Task 4 done
Today: Work on Task 5 and 6
Blockers: Shopify API rate limit (logged as impediment)

Day 6:
Yesterday: ✅ Task 5 and 6 done, impediment resolved
Today: Task 7 and 8
Blockers: None

Day 7:
Yesterday: ✅ All tasks complete!
Today: Prepare Sprint Review demo
Blockers: None
```

### **Day 8: Sprint Review**
```bash
# Run command
/sprint-review

# Demo:
1. Show Postman calling /api/webhooks/products ✅
2. Update product in Shopify test store ✅
3. Webhook triggers, data syncs to MongoDB ✅
4. Show error handling for invalid signature ✅
5. Show MongoDB data with proper indexes ✅

# Stakeholder feedback:
"Excellent! Can we add bulk sync for historical products?"

# New PBI created:
PBI-BACKEND-004: Bulk product sync (8 points)
Added to Product Backlog for next Sprint

# Velocity calculated:
Sprint 5 velocity: 16 points (89% completion)
```

### **Day 8: Sprint Retrospective**
```bash
# Run command
/sprint-retro

# Team discussion:
START:
- MongoDB schema review before implementation
- Automated webhook testing

STOP:
- Manual Postman testing (automate)

CONTINUE:
- Strong error handling practices
- Shopify API best practices

# Action items:
1. Create webhook testing automation - Sprint 6
2. Document MongoDB patterns learned - Sprint 6
```

---

## 📝 Key Takeaways

1. **User Stories First**: Every Shopify feature becomes a proper User Story with acceptance criteria
2. **Product Backlog Integration**: Features tracked in `.scrum/product-backlog.json`, not scattered
3. **Sprint-Based Development**: Work happens within Sprint framework with ceremonies
4. **Daily Progress Tracking**: Daily Standups keep everyone aligned, burndown updated
5. **Demo Working Software**: Sprint Reviews show real functionality to stakeholders
6. **Continuous Improvement**: Retrospectives capture technical learnings

---

## 🔗 Related Commands

- `/scrum:init` - Initialize Scrum system
- `/scrum:orchestrator` - Get intelligent workflow guidance
- `/sprint-planning` - Plan Sprint and select PBIs
- `/daily-standup` - Daily progress tracking
- `/sprint-review` - Demo and collect feedback
- `/sprint-retro` - Reflect and improve
- `/shopify:backend [feature]` - Backend development (Scrum-integrated)
- `/shopify:frontend [feature]` - Frontend development (Scrum-integrated)

---

**Your Shopify development is now Agile! 🎉**
