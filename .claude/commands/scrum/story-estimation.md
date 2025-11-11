# Story Estimation Command (Planning Poker)

You are facilitating a Planning Poker session - a consensus-based estimation technique where the Development Team estimates the relative size of Product Backlog Items using story points.

## Overview

Planning Poker is a collaborative estimation technique that:
- **Engages** the whole team in estimation
- **Leverages** collective wisdom (multiple perspectives)
- **Reduces** anchoring bias (simultaneous reveal)
- **Builds** shared understanding through discussion
- **Produces** more accurate estimates than individual estimation

**Duration:** 5-15 minutes per item (average ~10 minutes)
**Participants:** Development Team (required), Product Owner (for clarification), Scrum Master (facilitator)

## Core Concepts

### Story Points
Story points are a relative unit of measure for estimating effort, capturing:
1. **Complexity:** How complex is the logic/algorithm?
2. **Amount of Work:** How much code to write/modify/test?
3. **Risk/Uncertainty:** How much is unknown or untested?
4. **Dependencies:** How many external systems/teams involved?

**Story points are NOT:**
- ❌ Hours or days (not a time estimate)
- ❌ Individual capacity (team-based estimate)
- ❌ Absolute measures (relative to each other)

### Fibonacci Sequence
We use the Fibonacci sequence for estimation:
**1, 2, 3, 5, 8, 13, 21**

**Why Fibonacci?**
- Reflects increasing uncertainty as size grows
- Forces choice (can't say "7.5 points")
- Natural breakpoints for splitting (>13 = too large)

**Scale Meanings:**
- **1 point:** Trivial change (< 1 hour)
- **2 points:** Small change (few hours)
- **3 points:** Small story (half day to 1 day)
- **5 points:** Medium story (1-2 days)
- **8 points:** Large story (2-3 days)
- **13 points:** Very large (3-5 days) - CONSIDER SPLITTING
- **21 points:** Epic - MUST BE SPLIT

---

## Phase 1: Setup & Calibration

### Step 1.1: Establish Reference Stories

**Create reference stories for calibration:**

Use the **product-owner** agent to identify or create reference stories:

```
Establish reference stories for estimation calibration:

Identify 3-4 previously completed stories across the size spectrum:

**Small (2-3 points):**
- Story: [PBI-XXX Title]
- Description: [Brief description]
- What it involved: [What work was done]
- Complexity: Low
- Example: "Add validation to email field"

**Medium (5 points):**
- Story: [PBI-YYY Title]
- Description: [Brief description]
- What it involved: [What work was done]
- Complexity: Moderate
- Example: "Implement bulk product tagging"

**Large (8 points):**
- Story: [PBI-ZZZ Title]
- Description: [Brief description]
- What it involved: [What work was done]
- Complexity: High
- Example: "Create tag management UI with CRUD operations"

These are your anchors for relative estimation.
```

**Present Reference Stories:**
```markdown
## Reference Stories (Baseline for Estimation)

### 2-3 Points: Email Field Validation
**What:** Add client-side and server-side validation to email input
**Involved:** Regex pattern, error messages, unit tests
**Complexity:** Low - straightforward validation logic
**Work:** ~1 day
**Use this for comparison:** "Is this story simpler or more complex than email validation?"

### 5 Points: Bulk Product Tagging
**What:** Allow merchants to apply tags to multiple products at once
**Involved:** UI selection, batch API calls, progress indicator, error handling
**Complexity:** Moderate - requires batch processing and UX considerations
**Work:** ~2 days
**Use this for comparison:** "Is this story about the same size as bulk tagging?"

### 8 Points: Tag Management UI
**What:** Full CRUD interface for managing product tags
**Involved:** Create, read, update, delete tags; tag list with search/filter; validation; confirmation dialogs
**Complexity:** High - multiple screens, state management, full workflow
**Work:** ~3 days
**Use this for comparison:** "Is this story as complex as the full tag management UI?"
```

### Step 1.2: Review Estimation Factors

**Remind team of estimation factors:**

```markdown
## Estimation Factors

When estimating, consider:

### 1. Complexity (Mental Effort)
- How complex is the business logic?
- How many edge cases must be handled?
- How intricate is the algorithm?
- **Examples:**
  - Low: Simple CRUD operations
  - High: Complex validation rules, multi-step workflows

### 2. Amount of Work (Code Volume)
- How much code to write?
- How many files to modify?
- How many tests to write?
- **Examples:**
  - Low: Single function change
  - High: Multiple components, services, tests

### 3. Risk & Uncertainty (Unknowns)
- How well do we understand the requirements?
- Have we done something similar before?
- Are there new technologies/libraries?
- **Examples:**
  - Low: Repeating known patterns
  - High: Unfamiliar library, unclear requirements

### 4. Dependencies (External Factors)
- How many external systems are involved?
- Do we need other teams' help?
- Are there third-party API limitations?
- **Examples:**
  - Low: Self-contained within our codebase
  - High: Requires coordination with 2+ teams/services

---

**Key Principle:** Estimate as a TEAM, not individually
- Different perspectives improve accuracy
- Discussion reveals hidden complexity
- Shared understanding emerges
```

---

## Phase 2: Estimation Process

### Step 2.1: Product Owner Presents Story

**For the story being estimated:**

Use the **product-owner** agent:

```
Present story for estimation:

Story: [PBI-XXX Title]

Format:
**As a** [role/persona]
**I want** [feature/capability]
**So that** [business value/benefit]

**Description:**
[Detailed description of what needs to be built]

**Acceptance Criteria:**
1. Given [context], when [action], then [outcome]
2. Given [context], when [action], then [outcome]
3. ...

**Dependencies:**
- [Dependency 1]
- [Dependency 2]

**Open Questions:**
- [Question 1]
- [Question 2]

Present clearly and answer team questions.
```

**Presentation Example:**
```markdown
## Story: PBI-020 API Versioning

**As a** third-party developer
**I want** versioned API endpoints
**So that** my integrations don't break when the API changes

### Description
Implement API versioning to allow backward compatibility.
- Support v1 and v2 endpoints simultaneously
- v1 continues current behavior (deprecated)
- v2 introduces new product fields
- Documentation for both versions

### Acceptance Criteria
1. **Given** I call `/api/v1/products`, **when** API responds, **then** I get v1 schema (current)
2. **Given** I call `/api/v2/products`, **when** API responds, **then** I get v2 schema (new fields)
3. **Given** both versions exist, **when** I test, **then** both work correctly
4. **Given** documentation is updated, **when** developers access it, **then** both versions are documented

### Dependencies
- API documentation system
- Backward compatibility testing framework

### Open Questions
None - requirements clear from API Guild discussion

---

**Ready for questions from team.**
```

### Step 2.2: Team Asks Clarification Questions

**Development Team asks questions:**

```markdown
## Clarification Questions

**Q1:** Does v2 need to support all existing v1 functionality?
**A:** Yes, v2 is a superset (all v1 features + new fields)

**Q2:** How do we handle internal services - which version should they use?
**A:** Internal services should migrate to v2 within this Sprint (part of this story)

**Q3:** Do we need to version other endpoints (orders, customers) or just products?
**A:** Just products for now (others are future stories)

**Q4:** What's the deprecation timeline for v1?
**A:** v1 deprecated immediately, removed in 6 months (not part of this story)

**Q5:** Do we need metrics on v1 vs v2 usage?
**A:** Yes, add basic usage tracking (good catch!)

---

**Additional Acceptance Criterion Added:**
5. **Given** APIs are called, **when** tracking is enabled, **then** we can see v1 vs v2 usage counts
```

### Step 2.3: Silent Voting

**Each team member selects an estimate (in silence):**

```markdown
## Voting Round 1

**Instructions:**
1. Consider complexity, work, risk, dependencies
2. Compare to reference stories (2-3, 5, 8 points)
3. Select your estimate from: 1, 2, 3, 5, 8, 13, 21
4. Keep it private until everyone is ready
5. Reveal simultaneously

**Team members think silently for 1-2 minutes...**

Ready? Everyone reveal your estimate!

**Votes:**
- @remix-expert: 8 points
- @mongodb-expert: 5 points
- @shopify-api-expert: 13 points
- @shopify-polaris-expert: 8 points

**Spread:** 5 to 13 points (high variance - need discussion)
```

### Step 2.4: Discussion (Focus on Extremes)

**Facilitate discussion between high and low estimates:**

```markdown
## Discussion: Why the Differences?

**Highest Vote: 13 points** (@shopify-api-expert)
**Explain your reasoning:**

"I voted 13 because:
- Versioning infrastructure is new to us (high risk)
- Need to update 10+ internal services to v2 (lots of work)
- Testing both versions simultaneously is complex
- Documentation for both versions adds overhead
- Uncertain about routing mechanism (will need research)"

---

**Lowest Vote: 5 points** (@mongodb-expert)
**Explain your reasoning:**

"I voted 5 because:
- We already have middleware pattern for routing (low complexity)
- Schema changes are small (just add fields)
- Most work is copy-paste v1 to v2, then enhance (moderate work)
- This is similar to feature flags we did before (familiar pattern)"

---

**Middle Votes: 8 points** (@remix-expert, @shopify-polaris-expert)
**Your thoughts:**

@remix-expert:
"I'm between 5 and 13. The infrastructure exists (like @mongodb-expert said), but updating 10 services is more work than I initially thought. Documentation also adds more than I expected."

@shopify-polaris-expert:
"Agreed. I thought 8 because complexity is moderate, but work volume for service updates pushes it higher."
```

### Step 2.5: New Information & Re-vote

**After discussion, new insights emerge:**

```markdown
## New Information Discovered

From discussion:
1. **Middleware exists:** Routing mechanism is easier than expected (reduces complexity)
2. **Service updates:** 10 services need updates (increases work volume)
3. **Documentation:** Both versions need full docs (increases work)
4. **Testing:** Need test suite for both versions (increases testing work)
5. **Reference:** Similar to feature flags story (8 points in Sprint 2)

**Product Owner Clarifies:**
"Internal service updates can be separate story if that helps. Core of this story is API versioning infrastructure + one example service migration. Other services can be separate 2-3 point stories."

**Team:**
"Ah! That significantly changes scope. If only 1 service migration, much more reasonable."
```

**Re-vote:**

```markdown
## Voting Round 2

With new information (scope clarified), re-vote:

**Votes:**
- @remix-expert: 8 points
- @mongodb-expert: 5 points
- @shopify-api-expert: 8 points
- @shopify-polaris-expert: 8 points

**Spread:** 5 to 8 points (better convergence)

**Discussion on remaining difference:**

@mongodb-expert: "I can see 8 now. The documentation and testing add more than I thought. I'll go with the team."

**Final Vote:**
- All: 8 points ✅

**Consensus reached: 8 story points**
```

---

## Phase 3: Handling Special Cases

### Case 1: Too Large (>13 points)

**If estimate is >13 points, story is too large for one Sprint:**

```markdown
## Story Too Large: Split Required

**Estimate:** 21 points (too large!)

**Action:** Split into smaller stories

Use **product-owner** agent:
"This story is estimated at 21 points (too large for one Sprint).
Let's split it into smaller, independently valuable stories.

Story: [PBI-XXX]
Current scope: [describe]

Suggest split into 2-4 smaller stories:
- Each 3-8 points
- Each delivers value independently
- Each has clear acceptance criteria
- Prioritize for sequencing"

**Example Split:**
Original: "Implement advanced search" (21 pts)
Split into:
1. Basic text search (5 pts)
2. Filter by category (3 pts)
3. Filter by price range (3 pts)
4. Save search preferences (5 pts)

Total: 16 points across 4 stories
```

### Case 2: Cannot Estimate (Too Uncertain)

**If team cannot estimate due to high uncertainty:**

```markdown
## Cannot Estimate: Spike Needed

**Problem:** Too much uncertainty to estimate confidently

**Votes:**
- Team: "We don't know enough to estimate this"
- Reasons:
  - Unfamiliar technology
  - Unclear requirements
  - Unknown third-party API behavior

**Solution:** Create a SPIKE story

**Spike:** Time-boxed research/investigation to reduce uncertainty

Use **product-owner** agent:
"Create spike story for [PBI-XXX]:

Title: Spike: [Research topic]
Time-box: [X hours, e.g., 4-8 hours]
Goal: [What we need to learn]
Deliverable: [Spike report with findings]
Points: 2-3 points (for the spike, not original story)

After spike, we can estimate the original story."

**Example:**
Spike: Research GraphQL client libraries for React
Time-box: 4 hours
Goal: Evaluate 2-3 libraries, recommend one
Deliverable: Comparison doc with recommendation
Points: 2 points
Then: Estimate actual feature implementation
```

### Case 3: Persistent Disagreement

**If team cannot reach consensus after 2-3 rounds:**

```markdown
## Persistent Disagreement: Resolution Strategies

**Situation:**
- Voted 3 times
- Still split between 5 and 13 points
- No new information emerging

**Options:**

### Option 1: Average (Quick Resolution)
Take mathematical average of votes:
- Votes: 5, 5, 13, 13
- Average: 9
- Round to nearest Fibonacci: **8 points**

### Option 2: Conservative (Risk Mitigation)
Take the higher estimate (pessimistic):
- High votes: 13, 13
- **Estimate: 13 points**
- Rationale: Better to over-estimate than under-deliver

### Option 3: Defer (More Information Needed)
Can't estimate confidently:
- **Action:** Create spike or ask Product Owner for more detail
- Re-estimate after clarification

### Option 4: Product Owner Decision
Product Owner breaks tie:
- PO decides: "Let's go with **8 points** and see"
- Team commits to trying with that estimate
- Adjust based on actual experience

**Recommendation:** Try Option 1 (average) first, Option 3 (defer) if uncertainty is high.
```

---

## Phase 4: Record & Update

### Step 4.1: Record Estimate

Use the **product-owner** agent:

```
Record story point estimate for [PBI-XXX]:

Estimate: [X points]
Estimated by: [Team members who participated]
Estimated on: [Date]
Rounds of voting: [Y rounds]
Notes: [Any important context from discussion]

Update in: .scrum/product-backlog.json

Mark status: "ready-for-sprint-planning" (if Definition of Ready met)
```

**Example Update:**
```json
{
  "id": "PBI-020",
  "title": "API Versioning",
  "storyPoints": 8,
  "estimated": true,
  "estimatedDate": "2024-01-30",
  "estimatedBy": ["@remix-expert", "@mongodb-expert", "@shopify-api-expert", "@shopify-polaris-expert"],
  "estimationNotes": "Clarified scope to 1 service migration only. Similar to feature flags (Sprint 2).",
  "status": "ready"
}
```

### Step 4.2: Update Backlog

```markdown
## Estimation Summary

**Story:** PBI-020 API Versioning
**Final Estimate:** 8 points
**Voting Rounds:** 2
**Consensus:** ✅ Full team agreement

**Key Insights from Discussion:**
- Scope clarified: Only 1 service migration in this story
- Similar to previous feature flags story (8 points)
- Documentation and testing add ~30% overhead
- Infrastructure already exists (middleware pattern)

**Status:** Ready for Sprint Planning
**Next:** Can be committed in upcoming Sprint
```

---

## Integration Points

### Agents Used
1. **product-owner** - Present stories, capture estimates, update backlog
2. **scrum-master** - Facilitate discussion, resolve conflicts
3. **backlog-refinement** - Called from /backlog-refinement command

### Data Files
- **Read:**
  - `.scrum/product-backlog.json` - Stories to estimate
  - `.scrum/metrics/velocity-history.json` - Historical context

- **Write:**
  - `.scrum/product-backlog.json` - Updated with estimates

---

## Best Practices

### DO:
✅ Use relative estimation (compare to reference stories)
✅ Estimate as a team (collective wisdom)
✅ Discuss extremes (high and low votes)
✅ Vote simultaneously (avoid anchoring bias)
✅ Split large stories (>13 points)
✅ Create spikes for high uncertainty
✅ Timebox discussion (10-15 min per story max)
✅ Focus on shared understanding (not perfect accuracy)

### DON'T:
❌ Convert story points to hours (they're relative, not absolute)
❌ Let Product Owner dictate estimates (team estimates)
❌ Rush to consensus (discuss differences)
❌ Estimate in isolation (discuss as team)
❌ Over-think it (rough estimation is fine)
❌ Use story points for performance metrics (anti-pattern!)
❌ Compare velocity across teams (not meaningful)
❌ Estimate tasks individually (that's micro-management)

---

## Success Criteria

Planning Poker is successful when:
- [x] All team members participated
- [x] Consensus reached (or reasonable resolution)
- [x] Team understands the story (shared understanding)
- [x] Estimate reflects complexity, work, risk, dependencies
- [x] Large stories identified and split
- [x] High uncertainty identified (spikes created)
- [x] Backlog updated with estimates
- [x] Team confident in estimates (not perfect, but good enough)

---

## Quick Reference

### Fibonacci Scale
- **1 pt:** Trivial (< 1 hour)
- **2 pts:** Small (few hours)
- **3 pts:** Small story (0.5-1 day)
- **5 pts:** Medium story (1-2 days)
- **8 pts:** Large story (2-3 days)
- **13 pts:** Very large (3-5 days) - Consider splitting
- **21 pts:** Epic - Must split

### Process Flow
1. Product Owner presents story
2. Team asks clarifying questions
3. Team votes silently (Fibonacci)
4. Reveal votes simultaneously
5. Discuss extremes (high and low)
6. Re-vote if needed
7. Reach consensus
8. Record estimate

### Resolution Tactics
- **Disagreement:** Discuss high/low reasoning
- **Too large:** Split into smaller stories
- **Too uncertain:** Create spike
- **Persistent split:** Average or take conservative estimate

---

**Remember:** Story point estimation is about relative sizing and shared understanding, not absolute precision. The goal is for the team to have a conversation about the work, discover hidden complexity, and arrive at a reasonable estimate they can commit to. Perfect estimates don't exist - good enough estimates with team buy-in are what matters!
