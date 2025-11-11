# Complete User Guide: From Idea to First Sprint

**A step-by-step guide to launching your project with the Scrum Agile System**

---

## 📋 Table of Contents

1. [Before You Begin](#before-you-begin)
2. [Step 1: Project Ideation](#step-1-project-ideation)
3. [Step 2: System Setup](#step-2-system-setup)
4. [Step 3: Building Your Product Backlog](#step-3-building-your-product-backlog)
5. [Step 4: Team Configuration](#step-4-team-configuration)
6. [Step 5: Backlog Refinement](#step-5-backlog-refinement)
7. [Step 6: Story Estimation](#step-6-story-estimation)
8. [Step 7: Sprint Planning](#step-7-sprint-planning)
9. [Step 8: Daily Sprint Execution](#step-8-daily-sprint-execution)
10. [Step 9: Sprint Review](#step-9-sprint-review)
11. [Step 10: Sprint Retrospective](#step-10-sprint-retrospective)
12. [Next Steps](#next-steps)

---

## Before You Begin

### What You'll Need

- ✅ Claude Code installed and configured
- ✅ A project idea or concept
- ✅ Basic understanding of your team structure
- ✅ 30-60 minutes for initial setup
- ✅ Access to this repository

### Time Commitment

- **Initial Setup**: 30-60 minutes
- **Daily Usage**: 15-30 minutes (standups + updates)
- **Weekly Ceremonies**: 2-4 hours (planning, review, retro)

### Prerequisites

No prior Scrum experience required! This guide will walk you through everything.

---

## Step 1: Project Ideation

### 1.1 Define Your Vision

**Start with the basics:**

```
What problem are you solving?
Who are your users?
What value will you deliver?
```

**Example:**
```
Problem: Shopify merchants struggle with bulk product operations
Users: E-commerce store owners
Value: Save time by editing multiple products at once
```

### 1.2 Identify Key Features

**List 5-10 main features you want to build:**

```
Example features:
1. Bulk product tagging
2. Bulk price updates
3. Bulk inventory adjustments
4. Product export/import
5. Scheduled price changes
6. Bulk category assignment
7. Image optimization
8. SEO bulk updates
```

**Prioritize** them (which are most important?):
- Must-have (critical)
- Should-have (important)
- Could-have (nice to have)

### 1.3 Define Success Criteria

**What does "done" mean for your project?**

```
Example success criteria:
- Can bulk edit 1000+ products in under 2 minutes
- 95% of operations complete without errors
- User can undo bulk operations
- Works on all Shopify plans
```

---

## Step 2: System Setup

### 2.1 Initialize the Scrum System

**Run the initialization command:**

```
/scrum:init
```

**You'll be asked:**

1. **Project Name**
   ```
   Example: "Shopify Bulk Operations App"
   ```

2. **Sprint Duration**
   ```
   Recommendation: Start with 2 weeks
   Options: 1 week, 2 weeks, 3 weeks, 4 weeks
   ```

3. **Team Size**
   ```
   Example: 4-5 members
   Count developers, designers, QA, etc.
   ```

4. **Sprint Start Date**
   ```
   Example: 2025-01-13 (next Monday)
   Format: YYYY-MM-DD
   ```

### 2.2 Team Member Setup

**Provide team member details:**

```
Example Team:
- Alex Chen (Full-stack Developer) - 6 hrs/day
- Sarah Johnson (Frontend Developer) - 6 hrs/day
- Mike Rodriguez (Backend Developer) - 5 hrs/day
- Emma Watson (UX Designer) - 4 hrs/day
- Tom Brown (QA Engineer) - 5 hrs/day
```

**For each member, specify:**
- Name
- Role
- Available hours per day
- Days available in sprint

### 2.3 Verify Setup

**The system will:**
- ✅ Create directory structure
- ✅ Initialize product backlog
- ✅ Set up team capacity
- ✅ Create sprint template
- ✅ Initialize metrics
- ✅ Run validation tests

**Expected output:**
```
✅ SCRUM SYSTEM INITIALIZED SUCCESSFULLY!

Created Artifacts:
✅ Product Backlog
✅ Team Capacity Configuration
✅ Sprint 001 Template
✅ Definition of Done
✅ Metrics Systems (6 files)
✅ Directory Structure

Ready to start!
```

---

## Step 3: Building Your Product Backlog

### 3.1 Understanding Backlog Items

**Types of items:**

1. **Epic** - Large feature (multiple sprints)
   ```
   Example: "Bulk Product Operations System"
   ```

2. **User Story** - Single feature (1-2 sprints)
   ```
   Example: "As a merchant, I want to bulk update prices so I can run sales quickly"
   ```

3. **Bug** - Fix existing issue
   ```
   Example: "Product sync fails for products with special characters"
   ```

4. **Spike** - Research or investigation
   ```
   Example: "Research GraphQL bulk operations API"
   ```

5. **Task** - Technical work
   ```
   Example: "Set up CI/CD pipeline"
   ```

### 3.2 Create Your First Backlog Items

**Open the product backlog file:**
```bash
code .scrum/product-backlog.json
```

**Add items using this template:**

```json
{
  "id": "PBI-001",
  "type": "epic",
  "title": "Bulk Product Operations",
  "description": "Enable merchants to perform operations on multiple products simultaneously",
  "priority": 1,
  "status": "backlog",
  "storyPoints": null,
  "businessValue": 10,
  "createdDate": "2025-01-10",
  "updatedDate": "2025-01-10",
  "sprint": null,
  "dependencies": [],
  "labels": ["feature", "high-priority"],
  "productOwnerNotes": "Critical for Q1 launch",
  "definitionOfReady": false,
  "children": ["PBI-002", "PBI-003"]
}
```

### 3.3 Write User Stories (INVEST Criteria)

**Good user stories are:**
- **I**ndependent - Can be done separately
- **N**egotiable - Details can be discussed
- **V**aluable - Provides clear value
- **E**stimable - Team can size it
- **S**mall - Fits in one sprint
- **T**estable - Can verify completion

**Template:**
```
As a [user type],
I want to [action],
So that [benefit].
```

**Example:**
```json
{
  "id": "PBI-002",
  "type": "story",
  "title": "Bulk Product Tagging",
  "description": "As a merchant, I want to add tags to multiple products at once, so that I can organize my catalog efficiently.",
  "acceptanceCriteria": [
    "Merchant can select multiple products from product list",
    "Merchant can add one or more tags to selected products",
    "Changes apply to all selected products",
    "Success/failure message shown",
    "Undo operation available for 5 minutes"
  ],
  "priority": 2,
  "status": "backlog",
  "storyPoints": null,
  "businessValue": 8,
  "createdDate": "2025-01-10",
  "updatedDate": "2025-01-10",
  "sprint": null,
  "dependencies": [],
  "labels": ["feature", "merchant-experience"],
  "technicalNotes": "Use Shopify GraphQL bulk mutation API",
  "definitionOfReady": false
}
```

### 3.4 Add 10-15 Initial Items

**Recommended mix:**
- 1-2 Epics (high-level features)
- 8-10 User Stories (specific features)
- 1-2 Technical Tasks (setup, infrastructure)
- 1-2 Spikes (if research needed)

**Save the file** and update metadata:
```json
{
  "metadata": {
    "projectName": "Your Project Name",
    "totalItems": 12,
    "lastUpdated": "2025-01-10T10:00:00Z",
    "version": "1.0.0"
  }
}
```

---

## Step 4: Team Configuration

### 4.1 Review Team Capacity

**Check team capacity file:**
```bash
cat .scrum/team-capacity.json | jq
```

### 4.2 Calculate Sprint Capacity

**Formula:**
```
Total Hours = (Hours per day × Days in sprint × Number of team members)
Working Hours = Total Hours × 0.8 (80% - account for meetings, etc.)
```

**Example (2-week sprint, 5 members):**
```
Total: 6 hrs/day × 10 days × 5 people = 300 hours
Working: 300 × 0.8 = 240 hours
```

### 4.3 Set Velocity Baseline

**For first sprint:**
```
Estimate: 25-35 story points (typical for new teams)

This will be refined after your first sprint based on actual completion.
```

### 4.4 Configure Definition of Done

**Review and customize:**
```bash
cat .scrum/definition-of-done.md
```

**Typical DoD includes:**
- ✅ Code written and peer reviewed
- ✅ Unit tests written (>80% coverage)
- ✅ Integration tests passing
- ✅ Documentation updated
- ✅ Acceptance criteria met
- ✅ Product Owner approved
- ✅ Deployed to staging
- ✅ No critical bugs

**Edit if needed** to match your team's standards.

---

## Step 5: Backlog Refinement

### 5.1 Run Backlog Refinement Session

**Execute the command:**
```
/backlog-refinement
```

**The session will:**
1. Review each backlog item
2. Clarify requirements
3. Add acceptance criteria
4. Break down large items
5. Identify dependencies
6. Mark items as "Ready"

### 5.2 Make Items "Ready"

**A story is "Ready" when it has:**
- ✅ Clear title and description
- ✅ Well-defined acceptance criteria (3-5 criteria)
- ✅ No major dependencies or blockers
- ✅ Understood by the team
- ✅ Small enough for one sprint
- ✅ Value is clear

**Example - Before Refinement:**
```json
{
  "title": "Add bulk operations",
  "description": "Merchants need bulk features",
  "acceptanceCriteria": []
}
```

**Example - After Refinement:**
```json
{
  "title": "Bulk Product Tagging Interface",
  "description": "As a merchant, I want to select multiple products and add tags to all of them at once, so that I can organize my catalog efficiently without editing products individually.",
  "acceptanceCriteria": [
    "Product list shows checkbox next to each product",
    "Select all checkbox at top of list",
    "Bulk actions menu appears when products selected",
    "Tag input field accepts comma-separated tags",
    "Success message shows number of products updated",
    "Products refresh to show new tags",
    "Error handling for API failures",
    "Undo option available for 5 minutes"
  ],
  "technicalNotes": "Use Shopify GraphQL productUpdate mutation in bulk mode. Max 100 products per operation.",
  "definitionOfReady": true
}
```

### 5.3 Aim for 15-20 Ready Stories

**Have enough "Ready" stories to:**
- Fill 2-3 sprints
- Provide options during planning
- Account for changing priorities

---

## Step 6: Story Estimation

### 6.1 Understand Story Points

**Story points measure:**
- Complexity (how hard?)
- Effort (how much work?)
- Uncertainty (how many unknowns?)

**NOT time!** Story points are relative sizing.

### 6.2 Use Fibonacci Sequence

**Valid estimates:**
```
1  - Very simple, well understood
2  - Simple, minimal complexity
3  - Straightforward, some complexity
5  - Moderate complexity, clear approach
8  - Complex, some unknowns
13 - Very complex, significant unknowns
21 - Extremely complex, should probably be split
```

**Reference Story:**
```
Pick a medium-sized story (3 or 5 points) as your reference.
Compare all other stories to this reference.
```

### 6.3 Run Estimation Session

**Execute the command:**
```
/story-estimation
```

**Planning Poker process:**
1. Product Owner reads story
2. Team asks clarifying questions
3. Everyone estimates privately
4. Reveal estimates simultaneously
5. Discuss differences
6. Re-estimate until consensus

**Example estimation:**
```
Story: "Bulk Product Tagging Interface"

Team estimates:
- Alex: 5
- Sarah: 5
- Mike: 8
- Emma: 3

Discussion: Mike concerned about error handling complexity.
Sarah suggests using existing API wrapper.

Final consensus: 5 points
```

### 6.4 Estimate 15-20 Stories

**Focus on:**
- Stories likely for next 2-3 sprints
- High-priority items first
- Keep estimates relative to each other

**Update story points in backlog:**
```json
{
  "id": "PBI-002",
  "title": "Bulk Product Tagging Interface",
  "storyPoints": 5,
  "estimatedDate": "2025-01-10"
}
```

---

## Step 7: Sprint Planning

### 7.1 Prepare for Planning

**Before the meeting:**
- ✅ Backlog refined and prioritized
- ✅ Stories estimated
- ✅ Team capacity calculated
- ✅ Sprint goal ideas brainstormed

### 7.2 Run Sprint Planning

**Execute the command:**
```
/sprint-planning
```

**Part 1: Define Sprint Goal**

The sprint goal is a single sentence describing what you'll achieve.

**Examples:**
```
✅ Good: "Enable merchants to bulk update product tags and prices"
❌ Bad: "Work on bulk operations"
❌ Bad: "Complete stories PBI-001 through PBI-008"
```

**Part 2: Select Stories**

**Selection criteria:**
1. **Priority** - High-priority items first
2. **Dependencies** - Items needed for sprint goal
3. **Capacity** - Don't over-commit!
4. **Team skills** - Match work to available expertise

**Example selection (35 point capacity):**
```
Selected Stories:
□ PBI-002: Bulk Product Tagging (5 points)
□ PBI-003: Bulk Price Update (5 points)
□ PBI-006: Product Selection UI (3 points)
□ PBI-007: Bulk Operation Queue (8 points)
□ PBI-009: Error Handling & Retry (5 points)
□ PBI-011: Activity Log (3 points)
□ PBI-014: Unit Test Suite (3 points)

Total: 32 points (within 35 point capacity)
```

### 7.3 Break Down Stories into Tasks

**For each story, create tasks:**

**Example for "Bulk Product Tagging" (5 points):**
```
Tasks:
□ Design product selection component (4 hrs)
□ Implement checkbox selection logic (3 hrs)
□ Create tag input interface (3 hrs)
□ Integrate with Shopify API (6 hrs)
□ Add error handling (3 hrs)
□ Write unit tests (4 hrs)
□ Update documentation (2 hrs)

Total: 25 hours
```

### 7.4 Commit to Sprint

**Final commitment:**
```
Sprint 1 Commitment:
Sprint Goal: "Enable merchants to bulk update product tags and prices"
Stories: 7 stories
Total Points: 32 points
Total Hours: ~240 hours capacity
Team: All 5 members available
Start Date: 2025-01-13
End Date: 2025-01-24
```

---

## Step 8: Daily Sprint Execution

### 8.1 Daily Standup

**Run every working day:**
```
/daily-standup
```

**Answer three questions:**
1. What did I complete yesterday?
2. What will I work on today?
3. Any blockers or impediments?

**Example:**
```
Yesterday:
✅ Completed product selection component
✅ Started checkbox selection logic

Today:
□ Finish checkbox selection logic
□ Start tag input interface

Blockers:
⚠️  Waiting on API documentation from Shopify
```

### 8.2 Update Story Status

**Status flow:**
```
backlog → ready → in-progress → done
```

**Update sprint backlog:**
```bash
# Edit sprint backlog
code .scrum/sprints/sprint-001/backlog.json
```

**Update story status:**
```json
{
  "id": "PBI-002",
  "status": "in-progress",
  "assignedTo": "Sarah Johnson",
  "startedDate": "2025-01-14"
}
```

### 8.3 Monitor Sprint Health

**Check daily:**
```bash
# Sprint health score
cat .scrum/metrics/sprint-health.json | jq '.sprintHealthHistory[0].overallHealthScore'

# Burndown progress
cat .scrum/metrics/burndown-charts.json | jq '.sprints[0].chartData.actualBurndown'
```

**Healthy sprint indicators:**
- Health score > 80
- Burndown trending toward zero
- Stories moving to "done"
- No growing impediments list

### 8.4 Use the Orchestrator

**Check status anytime:**
```
/scrum:orchestrator
```

**The orchestrator will:**
- Show current progress
- Remind you of standup if missed
- Alert to risks
- Suggest actions

### 8.5 Handle Impediments

**If blockers arise:**
1. Log in daily standup
2. Try to resolve within team
3. Escalate to Scrum Master if needed
4. Update impediments list

**Example impediment:**
```json
{
  "id": "IMP-001",
  "description": "Shopify API rate limiting blocking bulk operations",
  "reportedBy": "Mike Rodriguez",
  "reportedDate": "2025-01-16",
  "status": "open",
  "impact": "high",
  "resolution": "Implement retry logic with exponential backoff"
}
```

---

## Step 9: Sprint Review

### 9.1 Prepare for Review

**Before the meeting:**
- ✅ Demo environment ready
- ✅ All "done" stories demoed
- ✅ Incomplete stories identified
- ✅ Metrics calculated

### 9.2 Run Sprint Review

**Execute the command:**
```
/sprint-review
```

**Review agenda:**

**1. Sprint Goal Review**
```
Goal: "Enable merchants to bulk update product tags and prices"
Status: ✅ Achieved (both features complete and working)
```

**2. Demo Completed Work**

For each completed story:
- Show working software
- Verify acceptance criteria met
- Get Product Owner approval

**Example:**
```
Story: Bulk Product Tagging (PBI-002)
Demo:
✅ Select multiple products
✅ Add tags via bulk action menu
✅ See success confirmation
✅ Verify tags applied to all products
✅ Test undo functionality

Product Owner: ✅ Accepted
```

**3. Review Incomplete Work**

```
Incomplete Stories:
□ PBI-009: Error Handling (3 of 5 points done)
  Reason: Discovered additional edge cases
  Action: Move to next sprint, split into 2 smaller stories
```

**4. Calculate Velocity**

```
Committed: 32 points
Completed: 29 points
Velocity: 29 points

Sprint Completion: 90.6%
```

**5. Update Product Backlog**

- Move completed stories to "done"
- Return incomplete stories to backlog
- Adjust priorities based on learnings
- Add new stories discovered

### 9.3 Gather Stakeholder Feedback

**Collect input on:**
- What worked well?
- What could be improved?
- New feature requests?
- Priority changes needed?

---

## Step 10: Sprint Retrospective

### 10.1 Run Retrospective

**Execute the command:**
```
/sprint-retro
```

**Retrospective format:**

**1. Set the Stage**
```
Review team agreement:
- Safe environment
- Honest feedback
- Focus on improvement
- No blame
```

**2. Gather Data**

**What went well? 😊**
```
✅ Team collaboration was excellent
✅ Daily standups kept everyone aligned
✅ Code review process worked smoothly
✅ Product Owner very responsive
```

**What didn't go well? 😔**
```
❌ Underestimated complexity of error handling
❌ Too many meetings interrupted focus time
❌ Unclear acceptance criteria on one story
❌ Test environment was unstable
```

**3. Generate Insights**

**Why did things happen?**
```
- Error handling complex because third-party API behavior unclear
- Meetings scheduled ad-hoc without considering sprint work
- Story was added late without proper refinement
- Test environment not maintained during sprint
```

**4. Decide What to Do**

**Action items for next sprint:**
```
Action 1: Research Shopify API error scenarios before estimation
  Owner: Mike Rodriguez
  Due: Before next sprint planning

Action 2: Block calendar for 4-hour focus blocks daily
  Owner: All team members
  Start: Next sprint day 1

Action 3: Ensure all stories refined 1 week before planning
  Owner: Product Owner
  Ongoing: Every sprint

Action 4: Daily test environment health check
  Owner: Tom Brown (QA)
  Start: Immediately
```

**5. Close Retrospective**

```
Review actions captured
Assign owners
Set follow-up date
Thank team for participation
```

### 10.2 Document Retrospective

**File saved automatically:**
```bash
cat .scrum/retrospectives/sprint-001.json
```

**Update metrics:**
```bash
# Team satisfaction tracked
# Process improvements logged
# Action items added to backlog
```

---

## Next Steps

### Immediate Actions

**1. Plan Sprint 2**
```
/sprint-planning
```

**2. Review Action Items**
- Implement retrospective improvements
- Follow up on action item owners
- Adjust processes as agreed

**3. Continue Refining Backlog**
```
/backlog-refinement
```

### Continuous Improvement

**After Sprint 2:**
- Compare velocities
- Adjust capacity planning
- Refine estimation accuracy

**After Sprint 3:**
- Velocity becomes predictable
- Forecasting more accurate
- Process optimizations clear

### Advanced Features

**Once comfortable with basics:**

1. **Explore Metrics**
   ```bash
   # Velocity trends
   cat .scrum/metrics/velocity.json | jq

   # Predictive analytics
   cat .scrum/metrics/predictive-analytics.json | jq
   ```

2. **Use Quality Metrics**
   ```bash
   # Track code quality
   cat .scrum/metrics/quality-metrics.json | jq
   ```

3. **Monitor Team Performance**
   ```bash
   # Cycle time, throughput, etc.
   cat .scrum/metrics/team-performance.json | jq
   ```

---

## Quick Reference

### Daily Commands
```bash
/scrum:orchestrator     # Check status, get guidance
/daily-standup          # Team sync
```

### Sprint Commands
```bash
/sprint-planning        # Start sprint
/sprint-review          # End sprint demo
/sprint-retro           # Reflect & improve
```

### Preparation Commands
```bash
/backlog-refinement     # Clarify stories
/story-estimation       # Size work
```

### Files to Know
```bash
# Product backlog
.scrum/product-backlog.json

# Current sprint
.scrum/sprints/sprint-001/backlog.json

# Team capacity
.scrum/team-capacity.json

# Metrics
.scrum/metrics/velocity.json
.scrum/metrics/sprint-health.json
```

---

## Success Checklist

### Before First Sprint ✅
- [x] System initialized
- [x] Product backlog has 10+ items
- [x] Team capacity configured
- [x] 15-20 stories refined
- [x] Stories estimated
- [x] Sprint 1 planned

### During Sprint ✅
- [ ] Daily standup every work day
- [ ] Story status updated daily
- [ ] Sprint health monitored
- [ ] Impediments addressed quickly
- [ ] Code reviews completed
- [ ] Tests written and passing

### End of Sprint ✅
- [ ] Sprint review conducted
- [ ] All done stories demoed
- [ ] Velocity calculated
- [ ] Retrospective held
- [ ] Action items captured
- [ ] Next sprint planned

---

## Getting Help

### Documentation
- **Quick Start**: `.scrum/QUICK_START.md`
- **Full Guide**: `.scrum/README.md`
- **System Overview**: `.scrum/SCRUM_SYSTEM_OVERVIEW.md`
- **All Docs**: `.scrum/INDEX.md`

### Commands
```bash
/scrum:orchestrator     # Get smart guidance
```

### Tests
```bash
bash .scrum/tests/run-all-tests.sh
```

---

## Congratulations! 🎉

You've completed the full journey from idea to running Scrum sprints!

**You now know how to:**
✅ Initialize a Scrum project
✅ Build and refine a product backlog
✅ Estimate and plan sprints
✅ Execute daily standups
✅ Review and retrospect
✅ Continuously improve

**Keep going! Your next sprints will be even better!** 🚀

---

**Questions?** Run `/scrum:orchestrator` for intelligent guidance anytime!
