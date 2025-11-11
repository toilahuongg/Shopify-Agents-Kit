# Sprint Planning Command

You are orchestrating a comprehensive Sprint Planning ceremony following Scrum best practices. This ceremony creates the Sprint Backlog and Sprint Goal for the upcoming Sprint.

## Overview

Sprint Planning answers two questions:
1. **What can be delivered in the Sprint?** (Sprint Goal and committed items)
2. **How will the chosen work get done?** (Task breakdown and capacity planning)

**Timeboxed:** 8 hours for a 1-month Sprint (proportionally less for shorter Sprints)
- 2-week Sprint: 4 hours
- 1-week Sprint: 2 hours

**Participants:** Product Owner, Scrum Master, Development Team

## Phase 1: Sprint Preparation

### Step 1.1: Load Historical Data
Use the **scrum-metrics-analyzer** agent to gather historical metrics:

```
I need Sprint Planning preparation data. Please provide:
1. Historical velocity (last 5 Sprints)
2. Average velocity and standard deviation
3. Team capacity utilization trends
4. Velocity stability assessment
5. Recommended Sprint commitment range

Load data from:
- .scrum/metrics/velocity-history.json
- .scrum/team-capacity.json
```

**Expected Output:**
- Average velocity: X points/Sprint
- Recommended commitment: Y-Z points
- Team capacity: W hours available

### Step 1.2: Calculate Team Capacity
Use the **sprint-manager** agent to calculate Sprint capacity:

```
Calculate team capacity for the upcoming Sprint:
- Sprint duration: [X days]
- Team size: [Y developers]
- Available hours per day: [Z hours]
- Focus factor: 0.7 (70% of time on Sprint work)
- Planned absences: [list any planned time off]

Load team data from: .scrum/team-capacity.json

Provide:
1. Total available hours
2. Effective Sprint capacity
3. Story point capacity (based on velocity)
4. Any capacity warnings or constraints
```

**Expected Output:**
- Total capacity: X hours
- Story point capacity: Y-Z points
- Warnings: [e.g., "Developer on vacation Day 3-5"]

### Step 1.3: Review Product Backlog
Use the **product-owner** agent to prepare Product Backlog:

```
Prepare Product Backlog for Sprint Planning:
1. Review top priority items (top 20% or 2 Sprints worth)
2. Verify all items meet Definition of Ready
3. Confirm acceptance criteria are clear
4. Check dependencies and impediments
5. Prepare Product Owner presentation

Load from: .scrum/product-backlog.json

Provide:
- List of ready items (prioritized)
- Items NOT ready (why?)
- Suggested Sprint Goal based on top priorities
- Any risks or dependencies
```

**Expected Output:**
- Ready items: [list top 10-15 items]
- Sprint Goal suggestion: [proposed goal]
- Risks: [any identified risks]

---

## Phase 2: Product Owner Presentation

### Step 2.1: Product Owner Presents Sprint Goal
**Prompt for Product Owner (user or product-owner agent):**

```
Product Owner, please present:
1. Proposed Sprint Goal for this Sprint
2. Why this goal is important (business value)
3. How it aligns with Product Goal
4. Success criteria for the Sprint

Sprint Goal should be:
- Clear and concise (1-2 sentences)
- Achievable in one Sprint
- Provides focus and coherence
- Inspires the team
```

**User Approval Checkpoint:**
> **User, please review the proposed Sprint Goal and approve or suggest changes.**

**Example Sprint Goal:**
"Enable merchants to efficiently manage product tags at scale, improving catalog organization and customer discovery."

### Step 2.2: Product Owner Presents Top Items
Use the **product-owner** agent:

```
Product Owner, present the top priority Product Backlog Items:
1. Walk through each item (title, description, acceptance criteria)
2. Explain business value and priority
3. Clarify any questions from the team
4. Provide context and background

Focus on top [X] items based on velocity: [Y points]

For each item, provide:
- ID and title
- User story (As a... I want... So that...)
- Acceptance criteria (Given-When-Then)
- Story points (if estimated)
- Dependencies
- Risks or unknowns
```

---

## Phase 3: Sprint Goal Definition

### Step 3.1: Team Discussion
**Facilitate team discussion:**

```
Development Team, discuss the proposed Sprint Goal:
1. Is the goal clear and achievable?
2. Do you have the skills and capacity?
3. Are there technical risks or dependencies?
4. Do you need any clarifications from the Product Owner?

Provide your assessment:
- Can we achieve this goal? (Yes/No/Maybe)
- What are the main risks?
- What questions do you have?
```

### Step 3.2: Finalize Sprint Goal
**User Approval Checkpoint:**
> **Team, do you commit to this Sprint Goal? Please confirm or suggest modifications.**

**Once approved, use sprint-manager to record Sprint Goal:**

```
Record Sprint Goal for Sprint [X]:
- Sprint Goal: "[final agreed goal]"
- Sprint Duration: [X days]
- Start Date: [YYYY-MM-DD]
- End Date: [YYYY-MM-DD]

Create Sprint Backlog structure at:
.scrum/sprints/sprint-[XXX]/backlog.json
```

---

## Phase 4: Item Selection & Commitment

### Step 4.1: Select Items for Sprint
**Iterative selection process:**

Use the **product-owner** and **sprint-manager** agents together:

```
product-owner: Present items in priority order
sprint-manager: Track running total of story points

For each item:
1. Product Owner presents the item
2. Team asks clarifying questions
3. Team confirms story points (or re-estimates if needed)
4. Team decides: commit or defer?
5. sprint-manager adds to Sprint Backlog if committed

Continue until:
- Sprint capacity reached (based on velocity)
- Team feels committed items are achievable
- Sprint Goal can be met

Running total:
- Committed: [X points]
- Capacity: [Y-Z points]
- Remaining capacity: [Z-X points]
```

### Step 4.2: Validate Commitment
Use the **scrum-metrics-analyzer** agent:

```
Validate Sprint commitment:
- Committed story points: [X points]
- Historical velocity: [Y points average]
- Team capacity: [Z hours]
- Commitment within range? (Yes/No)

Provide recommendation:
- Is commitment realistic?
- Over-committed? (suggest descoping)
- Under-committed? (suggest adding work)
- Risk assessment (Low/Medium/High)
```

**User Approval Checkpoint:**
> **Team, do you commit to delivering these items? This is your Sprint forecast.**

---

## Phase 5: Task Breakdown

### Step 5.1: Decompose Items into Tasks
Use the **todo-manager** agent for each committed item:

```
For each committed PBI, create detailed tasks:

PBI-[XXX]: [Title]
Break down into tasks:
1. [Task 1] - [Estimated hours]
2. [Task 2] - [Estimated hours]
3. [Task 3] - [Estimated hours]

Tasks should be:
- Small enough to complete in 1-2 days
- Clear and actionable
- Assigned to specific developers (or self-assigned during Sprint)
- Estimated in hours

Link tasks to:
- Sprint Backlog: .scrum/sprints/sprint-[XXX]/backlog.json
- Product Backlog Item: PBI-[XXX]
- Story points: [X points]
```

**Repeat for all committed items.**

### Step 5.2: Validate Total Hours
Use the **sprint-manager** agent:

```
Validate total task hours against capacity:
- Total task hours: [X hours]
- Team capacity: [Y hours]
- Utilization: [X/Y]%

Recommendation:
- Is task breakdown realistic?
- Over-planned? (reduce tasks or hours)
- Under-planned? (add detail or buffer)
```

---

## Phase 6: Sprint Backlog Creation

### Step 6.1: Create Sprint Backlog
Use the **sprint-manager** agent:

```
Create Sprint Backlog for Sprint [X]:

Sprint Metadata:
- Sprint Number: [X]
- Sprint Goal: "[goal]"
- Start Date: [YYYY-MM-DD]
- End Date: [YYYY-MM-DD]
- Duration: [X days]
- Working Days: [Y days]

Committed Items:
[List all PBIs with story points]

Total Commitment:
- Story Points: [X points]
- Tasks: [Y tasks]
- Estimated Hours: [Z hours]

Team Capacity:
- Available Hours: [A hours]
- Utilization: [Z/A]%

Initialize Burndown:
- Day 0: [X points remaining]
- Ideal burndown rate: [X/Y points per day]

Save to: .scrum/sprints/sprint-[XXX]/backlog.json
```

### Step 6.2: Create Initial Burndown Chart
Use the **scrum-metrics-analyzer** agent:

```
Generate initial Sprint Burndown chart:
- Sprint: Sprint [X]
- Committed: [Y points]
- Duration: [Z days]

Create ASCII burndown chart showing:
- Ideal burndown line
- Day 0 starting point
- Target completion (Day Z, 0 points)

Save burndown data structure to Sprint Backlog.
```

---

## Phase 7: Final Confirmation & Summary

### Step 7.1: Sprint Planning Summary
**Generate comprehensive summary:**

```markdown
# Sprint [X] Planning Summary

**Date:** [YYYY-MM-DD]
**Duration:** [X hours]
**Participants:** Product Owner, Scrum Master, Development Team

## Sprint Goal
"[Sprint Goal text]"

## Commitment
- **Story Points:** [X points] ([Y%] of capacity)
- **Items:** [Z PBIs]
- **Tasks:** [A tasks]
- **Estimated Hours:** [B hours] ([C%] utilization)

## Committed Product Backlog Items
1. **PBI-XXX:** [Title] ([X points])
   - [Brief description]
   - [Y tasks], [Z hours estimated]

2. **PBI-YYY:** [Title] ([X points])
   - [Brief description]
   - [Y tasks], [Z hours estimated]

[... continue for all items ...]

## Team Capacity
- **Team Size:** [X developers]
- **Sprint Duration:** [Y working days]
- **Available Hours:** [Z hours]
- **Planned Utilization:** [A%]

## Historical Context
- **Average Velocity:** [X points]
- **Commitment vs Velocity:** [Y%] (within/above/below range)
- **Risk Assessment:** [Low/Medium/High]

## Risks & Dependencies
- [Risk 1]
- [Risk 2]
- [Dependency 1]

## Definition of Done
All items must meet: .scrum/definition-of-done.md
- Code quality, testing, documentation
- Acceptance criteria validated
- Product Owner acceptance

## Next Steps
1. Daily Standup starts tomorrow at [time]
2. Sprint Review scheduled: [date/time]
3. Sprint Retrospective scheduled: [date/time]
4. Team starts work on highest priority items

---
**Sprint Backlog:** .scrum/sprints/sprint-[XXX]/backlog.json
**Burndown Tracking:** Updated daily in Daily Standup
```

### Step 7.2: Save All Artifacts
**Checklist:**

- [x] Sprint Backlog created: `.scrum/sprints/sprint-XXX/backlog.json`
- [x] Sprint Goal recorded
- [x] Committed items listed with story points
- [x] Tasks created and linked to PBIs
- [x] Burndown data structure initialized
- [x] Team capacity recorded
- [x] Sprint Planning summary generated

### Step 7.3: Final Confirmation
**User Approval Checkpoint:**
> **Sprint Planning complete! Team, please confirm:**
> - Do you understand the Sprint Goal?
> - Do you commit to the Sprint Backlog?
> - Do you have everything you need to start the Sprint?
> - Any final questions or concerns?

---

## Integration Points

### Agents Used
1. **scrum-metrics-analyzer** - Historical velocity, capacity recommendations
2. **product-owner** - Product Backlog preparation, item presentation
3. **sprint-manager** - Sprint Backlog creation, capacity validation
4. **todo-manager** - Task breakdown and tracking

### Data Files
- **Read:**
  - `.scrum/product-backlog.json` - Source of items
  - `.scrum/team-capacity.json` - Team capacity data
  - `.scrum/metrics/velocity-history.json` - Historical velocity

- **Write:**
  - `.scrum/sprints/sprint-XXX/backlog.json` - Sprint Backlog
  - `.scrum/sprints/sprint-XXX/planning-summary.md` - Summary

---

## Success Criteria

Sprint Planning is successful when:
- [x] Sprint Goal is clear, achievable, and agreed upon
- [x] Team commits to Sprint Backlog based on capacity
- [x] All committed items meet Definition of Ready
- [x] Tasks are broken down and estimated
- [x] Sprint Backlog created with burndown structure
- [x] Team understands what to build and how
- [x] Everyone is aligned and ready to start

---

## Tips for Effective Sprint Planning

### DO:
✅ Start with clear Sprint Goal (provides focus)
✅ Use historical velocity as guide (not exact target)
✅ Let team self-organize and commit (don't force)
✅ Break down items into tasks (makes work tangible)
✅ Validate capacity (don't over-commit)
✅ Ask questions and clarify (better now than mid-Sprint)
✅ Focus on value and Sprint Goal (not just points)

### DON'T:
❌ Skip Sprint Goal (leads to unfocused Sprint)
❌ Over-commit beyond capacity (recipe for failure)
❌ Let Product Owner dictate commitment (team decides)
❌ Rush through item details (causes rework later)
❌ Ignore team concerns or risks (they'll bite you)
❌ Treat Sprint Planning as ceremony (it's crucial planning)
❌ Forget Definition of Done (quality gate)

---

**Remember:** Sprint Planning is collaborative planning, not command-and-control. The team commits to what they believe they can deliver. The Product Owner proposes, the team disposes. Good Sprint Planning sets up the Sprint for success!
