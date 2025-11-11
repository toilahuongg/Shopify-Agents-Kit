# Backlog Refinement Command

You are facilitating a Product Backlog Refinement session (also called Backlog Grooming) - an ongoing activity where the Scrum Team adds detail, estimates, and order to Product Backlog Items.

## Overview

Backlog Refinement is the act of:
- **Breaking down** large items (Epics) into smaller User Stories
- **Adding detail** to items (acceptance criteria, clarifications)
- **Estimating** items using story points
- **Ordering** items by priority and dependencies
- **Validating** items meet Definition of Ready

**Time Allocation:** ~10% of Sprint capacity (ongoing activity, not a formal event)
- For 2-week Sprint: ~4-8 hours total, split across multiple sessions
- Typical session: 1-2 hours, 1-2 times per Sprint

**Participants:** Product Owner (required), Development Team, Scrum Master
**Focus:** Items for next 1-2 Sprints (near-term backlog)

## Preparation

### Step 1: Select Items for Refinement

Use the **product-owner** agent to identify items:

```
Identify Product Backlog items for refinement:

Criteria:
- Items likely for next 1-2 Sprints
- Large items (Epics) needing decomposition
- Items lacking detail or clarity
- New items from stakeholders
- Items with unclear estimates

Load from: .scrum/product-backlog.json

Provide:
- Top 20 items (prioritized)
- Items needing breakdown (Epics)
- Items missing acceptance criteria
- Items not estimated
- Items not meeting Definition of Ready

Recommend 5-8 items for this session (1-2 hours worth).
```

**Expected Output:**
```markdown
## Items for Refinement Session

### High Priority (Next Sprint Candidates)
1. **PBI-015:** Advanced search filters (Epic, 21 pts) - NEEDS BREAKDOWN
2. **PBI-016:** Export reports to PDF (No estimate) - NEEDS ESTIMATION
3. **PBI-017:** Email notifications (Vague criteria) - NEEDS DETAIL

### Medium Priority (Sprint +2)
4. **PBI-018:** Bulk delete operations (Epic, no breakdown)
5. **PBI-019:** User permissions (No acceptance criteria)

### Recommended Focus Today
- PBI-015: Break down Epic (30 min)
- PBI-016: Add criteria + estimate (15 min)
- PBI-017: Clarify + estimate (15 min)
- PBI-018: Decompose Epic (30 min)

Total: ~90 minutes
```

---

## Phase 1: Epic Decomposition

### Step 1.1: Select Epic to Decompose

**For each Epic that needs breakdown:**

Use the **product-owner** agent:

```
Decompose Epic into User Stories:

Epic: [PBI-XXX Title]
Description: [Epic description]
Business Value: [Why is this important?]

Break down into User Stories using INVEST criteria:
- **I**ndependent: Can be developed separately
- **N**egotiable: Details can be discussed
- **V**aluable: Delivers user/business value
- **E**stimable: Team can estimate size
- **S**mall: Completable in one Sprint
- **T**estable: Has clear acceptance criteria

Target: 3-8 User Stories, each 3-8 story points

For each User Story, provide:
- Title (brief, descriptive)
- User story format: "As a [role], I want [feature] so that [benefit]"
- Initial acceptance criteria (Given-When-Then)
- Dependencies
- Priority within Epic
```

**Example:**
```markdown
## Epic Decomposition: PBI-015 Advanced Search Filters

**Epic Description:**
As a merchant, I want advanced product search capabilities so that I can quickly find products in large catalogs.

### Decomposed User Stories:

#### PBI-015-A: Basic Text Search
**As a** merchant
**I want** to search products by name, description, or SKU
**So that** I can quickly find specific products

**Acceptance Criteria:**
- Given I enter a search term
- When I submit the search
- Then I see all matching products within 2 seconds
- And results are ranked by relevance

**Priority:** 1 (Foundation for other stories)
**Dependencies:** None
**Estimate:** Not yet

---

#### PBI-015-B: Filter by Category
**As a** merchant
**I want** to filter search results by product category
**So that** I can narrow down results to specific product types

**Acceptance Criteria:**
- Given I have search results
- When I select a category filter
- Then only products in that category are shown
- And I can select multiple categories (OR logic)

**Priority:** 2
**Dependencies:** PBI-015-A (basic search)
**Estimate:** Not yet

---

#### PBI-015-C: Filter by Price Range
**As a** merchant
**I want** to filter products by price range
**So that** I can find products within a specific price bracket

**Acceptance Criteria:**
- Given I have search results
- When I set min/max price
- Then only products in that range are shown
- And range is validated (min ≤ max)

**Priority:** 2
**Dependencies:** PBI-015-A
**Estimate:** Not yet

---

#### PBI-015-D: Filter by Inventory Status
**As a** merchant
**I want** to filter by stock status (in stock, low stock, out of stock)
**So that** I can focus on products needing attention

**Acceptance Criteria:**
- Given I have search results
- When I select a stock status
- Then only products with that status are shown
- And stock levels are real-time

**Priority:** 3
**Dependencies:** PBI-015-A
**Estimate:** Not yet

---

**Epic Status:** ✅ Decomposed into 4 stories
**Next Step:** Estimate each story
```

### Step 1.2: Add Stories to Product Backlog

Use the **product-owner** agent:

```
Add decomposed User Stories to Product Backlog:

For each new story:
- Create unique ID (PBI-XXX-A, PBI-XXX-B, etc.)
- Set status: "ready-for-refinement"
- Link to parent Epic (PBI-XXX)
- Set initial priority within Epic
- Mark as "needs estimation"

Update Epic:
- Status: "decomposed"
- Link to child stories
- Note: "See child stories for details"

Save to: .scrum/product-backlog.json
```

---

## Phase 2: Add Detail & Acceptance Criteria

### Step 2.1: Clarify Requirements

**For each item needing detail:**

**Product Owner presents the item:**
```markdown
## Item: [PBI-XXX Title]

**Context:**
- Why do we need this?
- Who requested it?
- What problem does it solve?

**Current Description:**
[Existing description]

**Open Questions:**
- [Question 1]
- [Question 2]
- [Question 3]
```

**Team asks clarifying questions:**
```markdown
## Clarification Discussion

**Questions from Team:**
1. **Q:** What happens when [edge case]?
   **A:** [Product Owner answer]

2. **Q:** Should we support [feature variation]?
   **A:** [Product Owner answer]

3. **Q:** What about [technical consideration]?
   **A:** [Product Owner answer]

**Additional Context Discovered:**
- [New information 1]
- [New information 2]
```

### Step 2.2: Define Acceptance Criteria

Use the **product-owner** agent to formalize criteria:

```
Define acceptance criteria for [PBI-XXX]:

Use Given-When-Then format for each criterion:
- **Given** [initial state/context]
- **When** [action/event]
- **Then** [expected outcome]

Include:
- Happy path scenarios (normal usage)
- Edge cases (boundary conditions)
- Error handling (what if things go wrong)
- Non-functional requirements (performance, accessibility)

Ensure criteria are:
- Testable (can be verified)
- Specific (no ambiguity)
- Complete (covers all aspects)
- Measurable (objective pass/fail)

Output 3-7 acceptance criteria per story.
```

**Example:**
```markdown
## Acceptance Criteria: PBI-016 Export Reports to PDF

### Criterion 1: Generate PDF Report
**Given** I have a report with data
**When** I click "Export to PDF"
**Then** a PDF file is generated and downloaded
**And** the filename includes report name and date

### Criterion 2: PDF Content Accuracy
**Given** the PDF is generated
**When** I open the PDF
**Then** all data from the report is present
**And** formatting matches the screen view
**And** charts/graphs are rendered correctly

### Criterion 3: Performance
**Given** a report with 1000 rows
**When** I export to PDF
**Then** the export completes within 10 seconds
**And** I see a progress indicator during export

### Criterion 4: Error Handling
**Given** the export process fails
**When** an error occurs
**Then** I see a clear error message
**And** I have the option to retry
**And** no partial/corrupted PDF is created

### Criterion 5: Accessibility
**Given** the PDF is generated
**When** I open it in a screen reader
**Then** all content is accessible
**And** document structure (headings) is preserved
```

---

## Phase 3: Story Estimation

### Step 3.1: Estimate Using Planning Poker

**For each item ready to estimate, use Planning Poker:**

**Use the `/story-estimation` command** (or manual process):

```
Estimate [PBI-XXX] using Planning Poker:

Fibonacci sequence: 1, 2, 3, 5, 8, 13, 21

Team discusses estimation factors:
1. **Complexity:** How complex is the logic/algorithm?
2. **Amount of Work:** How much code to write/modify?
3. **Risk/Uncertainty:** How much is unknown?
4. **Dependencies:** How many external dependencies?

Process:
1. Product Owner presents the story
2. Team asks clarification questions
3. Each team member picks a number (silently)
4. Everyone reveals simultaneously
5. Discuss discrepancies (high and low explain)
6. Re-vote if needed
7. Reach consensus

Output: Final story point estimate
```

**Voting Example:**
```markdown
## Estimation: PBI-016 Export Reports to PDF

**Round 1 Votes:**
- @remix-expert: 5 points
- @mongodb-expert: 3 points
- @shopify-api-expert: 5 points
- @shopify-polaris-expert: 8 points

**Discussion:**
- **Why 8?** (@shopify-polaris-expert)
  "PDF generation library is unfamiliar, might have compatibility issues"

- **Why 3?** (@mongodb-expert)
  "We already have similar export logic for CSV, should be similar"

**Clarification:**
- Product Owner: "We can use existing library X, it's already approved"
- Team: "Ah, that reduces risk significantly"

**Round 2 Votes:**
- @remix-expert: 5 points
- @mongodb-expert: 5 points
- @shopify-api-expert: 5 points
- @shopify-polaris-expert: 5 points

**Consensus:** ✅ 5 story points
```

### Step 3.2: Update Product Backlog with Estimates

Use the **product-owner** agent:

```
Update Product Backlog with estimates:

For [PBI-XXX]:
- Story Points: [X points]
- Estimated Date: [today]
- Estimated By: [team members]
- Notes: [any estimation notes]
- Status: "ready" or "needs-more-detail"

Save to: .scrum/product-backlog.json
```

---

## Phase 4: Definition of Ready Validation

### Step 4.1: Check Definition of Ready

**For each refined item, validate against Definition of Ready:**

Use the **product-owner** agent:

```
Validate [PBI-XXX] against Definition of Ready:

Definition of Ready Checklist:
- [x] Clear user story format (As a... I want... So that...)
- [x] Acceptance criteria defined (Given-When-Then)
- [x] Story points estimated by team
- [x] Dependencies identified
- [x] Priority assigned
- [x] Fits within one Sprint (≤13 points)
- [x] No external blockers
- [x] Team understands the requirements
- [x] Testable (can be validated)
- [x] Value is clear

Status: [✅ Ready / ⚠️ Needs Work / ❌ Not Ready]

If not ready:
- What's missing?
- What needs clarification?
- Who can provide needed information?
```

**Example Output:**
```markdown
## Definition of Ready: PBI-016 Export Reports to PDF

### Checklist
- [x] Clear user story ✅
- [x] Acceptance criteria (5 criteria defined) ✅
- [x] Estimated (5 story points) ✅
- [x] Dependencies (uses library X) ✅
- [x] Priority (High) ✅
- [x] Fits in Sprint (5 points < 13) ✅
- [⚠️] External blocker: Library X needs security approval
- [x] Team understands ✅
- [x] Testable ✅
- [x] Value clear ✅

**Status:** ⚠️ MOSTLY READY (pending library approval)

**Action:** @product-owner to get library approval by [date]
**Re-check:** Next refinement session
```

---

## Phase 5: Prioritization & Ordering

### Step 5.1: Discuss Priority

**Product Owner leads priority discussion:**

```markdown
## Prioritization Discussion

For each refined item, discuss:

### Business Value
- Who needs this? (users, business, technical)
- What's the impact? (revenue, efficiency, risk reduction)
- What's the urgency? (market timing, compliance, dependencies)

### Cost
- Story points (effort)
- Risk (technical uncertainty)
- Dependencies (waiting on other work)

### Priority Score
Calculate: Value / Cost = Priority Score

High score = High priority (big value, low cost)
Low score = Low priority (small value, high cost)
```

**Example:**
```markdown
## Priority Analysis

### PBI-016: Export Reports to PDF
**Value:** 8/10
- High user demand (top 3 feature request)
- Competitive parity (competitors have this)
- Enables sales use case

**Cost:** 5 points
**Risk:** Low (library is proven)
**Dependencies:** Library approval (in progress)

**Priority Score:** 8/5 = 1.6 (HIGH)

---

### PBI-019: User Permissions
**Value:** 6/10
- Important but not urgent
- Only affects admin users (~10% of users)
- Workaround exists

**Cost:** 8 points
**Risk:** Medium (complex logic)
**Dependencies:** None

**Priority Score:** 6/8 = 0.75 (MEDIUM)

---

**Recommendation:**
PBI-016 (Export) higher priority than PBI-019 (Permissions)
```

### Step 5.2: Reorder Product Backlog

Use the **product-owner** agent:

```
Reorder Product Backlog based on priority:

New ordering:
1. [PBI-XXX] - [Reason for position]
2. [PBI-YYY] - [Reason]
3. [PBI-ZZZ] - [Reason]
...

Changes from previous order:
- [PBI-XXX]: Moved up (from #5 to #2) - Reason: [why]
- [PBI-YYY]: Moved down (from #3 to #7) - Reason: [why]

Save updated backlog: .scrum/product-backlog.json
```

---

## Phase 6: Session Summary

### Step 6.1: Generate Refinement Summary

```markdown
# Backlog Refinement Summary

**Date:** [YYYY-MM-DD]
**Duration:** [X] minutes
**Participants:** @product-owner, @[team members]

## Items Refined: [X items]

### Decomposed Epics
- **PBI-015:** Advanced Search → 4 User Stories
  - PBI-015-A: Basic search (5 pts)
  - PBI-015-B: Category filter (3 pts)
  - PBI-015-C: Price filter (3 pts)
  - PBI-015-D: Inventory filter (2 pts)

### Estimated Items
- PBI-016: Export to PDF (5 pts) - Ready for Sprint
- PBI-017: Email notifications (8 pts) - Ready for Sprint
- PBI-018: Bulk delete (13 pts) - Consider splitting

### Items Needing More Work
- PBI-019: User permissions - Needs acceptance criteria
- PBI-020: API versioning - Needs technical spike

## Product Backlog Status

### Ready for Next Sprint (Definition of Ready Met)
Count: [X items], [Y total story points]
- PBI-004: Product sync (3 pts)
- PBI-016: Export to PDF (5 pts)
- PBI-017: Email notifications (8 pts)
- PBI-015-A: Basic search (5 pts)
... [21 points ready]

### Needs More Refinement
- PBI-019: User permissions (needs criteria)
- PBI-020: API versioning (needs spike)

### Backlog Health
- Ready items: [X]
- Next Sprint capacity: ~30 points
- Ready backlog: ~60 points (✅ 2 Sprints worth)

## Action Items
- [ ] @product-owner: Get library approval for PBI-016
- [ ] @product-owner: Schedule spike for PBI-020 API versioning
- [ ] @scrum-master: Add PBI-019 to next refinement session

## Next Refinement Session
**Date:** [Next session date]
**Focus:** PBI-019, PBI-020, PBI-021, PBI-022
```

---

## Integration Points

### Agents Used
1. **product-owner** - Backlog management, Epic decomposition, prioritization
2. **solution-architect** - Technical feasibility, architecture considerations
3. **todo-manager** - Break down into technical tasks (if needed)
4. **Estimation** - Use `/story-estimation` command for Planning Poker

### Data Files
- **Read:**
  - `.scrum/product-backlog.json` - Current Product Backlog
  - `.scrum/team-capacity.json` - Team skills and capacity

- **Write:**
  - `.scrum/product-backlog.json` - Updated with refined items
  - `.scrum/refinement-sessions/session-[date].md` - Session notes

---

## Best Practices

### DO:
✅ Refine items for next 1-2 Sprints (maintain ready backlog)
✅ Break large items (Epics) into smaller stories
✅ Define clear acceptance criteria (testable and specific)
✅ Estimate as a team (collective wisdom)
✅ Validate Definition of Ready (no unready items in Sprint)
✅ Focus on highest priority items first
✅ Keep sessions timeboxed (1-2 hours max)
✅ Include whole team (diverse perspectives)

### DON'T:
❌ Refine too far ahead (requirements change, waste effort)
❌ Let Product Owner dictate estimates (team estimates)
❌ Skip Definition of Ready check (causes mid-Sprint issues)
❌ Refine during Sprint Planning (separate activities)
❌ Make it a formal meeting (informal is better)
❌ Refine every single backlog item (focus on near-term)
❌ Let it drag on for hours (respect energy levels)
❌ Commit to items during refinement (commitment happens in Sprint Planning)

---

## Success Criteria

Backlog Refinement is successful when:
- [x] 1-2 Sprints worth of items are ready (meet Definition of Ready)
- [x] Epics decomposed into appropriately sized stories
- [x] Acceptance criteria clear and testable
- [x] Items estimated by team
- [x] Backlog prioritized by value
- [x] Dependencies identified
- [x] Team understands upcoming work
- [x] Sprint Planning will be smooth (backlog is ready)

---

## Tips for Effective Refinement

### Timeboxing
- **Session length:** 1-2 hours max
- **Per item:** 10-20 minutes
- **Frequency:** 1-2 sessions per Sprint

### Engagement
- Rotate facilitation (not just Scrum Master)
- Use breakout discussions for complex items
- Take breaks (every 45-60 minutes)
- Make it interactive (not just Product Owner talking)

### Quality
- "Definition of Ready" is your quality gate
- If unclear, mark for follow-up (don't force it)
- Better to leave unready than fake it
- Spikes are OK for high uncertainty

---

**Remember:** Backlog Refinement is continuous, not a one-time event. Keep the top of the backlog ready, but don't over-refine items far in the future. Requirements change, and you don't want to waste effort refining things you may never build. Focus on "just enough, just in time" refinement!
