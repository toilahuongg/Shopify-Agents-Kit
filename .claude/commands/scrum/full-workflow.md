---
description: Complete automated end-to-end workflow from project idea to production. Orchestrates Analysis → Design → Backlog → Sprint → Implementation → Review with minimal user intervention.
---

You are orchestrating a **COMPLETE END-TO-END AUTOMATED WORKFLOW** for software development using Scrum methodology. This workflow minimizes user intervention while maintaining quality and following best practices.

## Input

The user provides:
1. Project description (what they want to build)
2. Team information (optional - can use defaults)
3. Preference for automation level (Standard vs YOLO mode)

## Workflow Mode Selection

Before starting, ask user to choose automation level:

```
**🚀 WORKFLOW AUTOMATION MODE**

Choose how automated you want this process:

1. **YOLO Mode** (Recommended) - Fully automated, minimal interruptions
   - Proceeds automatically through all phases
   - Only stops for critical decisions or errors
   - Shows progress summaries at key milestones
   - Fastest path to implementation

2. **Standard Mode** - Automated with checkpoints
   - Asks for approval at phase transitions
   - Shows detailed output at each step
   - Allows adjustments between phases
   - More control, slightly slower

3. **Guided Mode** - Step-by-step with full control
   - Pauses at every major step
   - Explains what will happen next
   - Waits for explicit approval
   - Maximum visibility and control

Please choose: 'YOLO', 'Standard', or 'Guided'
```

---

## MASTER WORKFLOW STRUCTURE

```
PHASE 1: PROJECT ANALYSIS
   ↓ (auto)
PHASE 2: DOCUMENTATION & DESIGN
   ├─ PRD Generation
   ├─ Architecture Design
   ├─ UI/UX Design
   └─ Project Manager Review
   ↓ (auto)
PHASE 3: BACKLOG CREATION
   ├─ Epic Generation
   ├─ Story Decomposition
   ├─ Acceptance Criteria
   └─ Backlog File Creation
   ↓ (auto)
PHASE 4: BACKLOG PREPARATION
   ├─ Prioritization
   ├─ Estimation
   ├─ Definition of Ready
   └─ Sort by Priority
   ↓ (auto)
PHASE 5: SPRINT PLANNING
   ├─ Team Capacity Check
   ├─ Story Selection
   ├─ Sprint Goal Definition
   ├─ Task Breakdown
   └─ Sprint Commitment
   ↓ (auto)
PHASE 6: SPRINT EXECUTION LOOP
   ├─ Daily Standup
   ├─ Implementation
   ├─ Code Review
   ├─ Testing
   ├─ Status Updates
   └─ Sprint Review/Retro
   ↓ (auto)
PHASE 7: BACKLOG MANAGEMENT LOOP
   └─ Continuous: Add new items → Re-prioritize → Next Sprint
```

---

## PHASE 1: PROJECT ANALYSIS

### Step 1.1: Initialize System (if needed)

Check if `.scrum/` directory exists:

```bash
if [ ! -d ".scrum" ]; then
  # System not initialized
  Ask user: "Scrum system not initialized. Initialize now? (Yes/No)"

  if Yes:
    Run /scrum:init command
  else:
    Stop workflow
fi
```

### Step 1.2: Detect Project Type & Select Analysis Agent

Ask user about project type:

```
**🎯 PROJECT TYPE DETECTION**

What type of project are you building?

1. **Shopify App** - E-commerce application for Shopify merchants
2. **Web Application** - General web application or SaaS
3. **Mobile App** - iOS/Android mobile application
4. **API/Backend Service** - Backend system or API
5. **Other** - Describe your project type

Choose: [1-5]
```

Based on selection:
- **Shopify App** → Use `shopify-app-ideator` agent for brainstorming (Phase 1.3a)
- **Other types** → Use `product-owner` agent for analysis (Phase 1.3b)

### Step 1.3a: Brainstorm with Shopify App Ideator (For Shopify Apps)

If user selected "Shopify App":

Launch `shopify-app-ideator` agent:

```
Task: Brainstorm and Refine Shopify App Idea
- Ask discovery questions:
  * Technical skills level
  * Budget and timeline
  * Target merchant segment
  * Business goals (passive income, full business, experiment)

- If user has an idea:
  * Evaluate the concept
  * Identify strengths and weaknesses
  * Suggest improvements
  * Assess market potential
  * Recommend differentiation strategies

- If user needs ideas:
  * Generate 3-5 diverse app concepts
  * Focus on real merchant pain points
  * Consider underserved niches
  * Assess technical feasibility
  * Evaluate monetization potential

- For each concept, provide:
  * Name & one-liner
  * Problem & solution
  * Target audience
  * Key features (MVP scope)
  * Differentiation
  * Monetization model
  * Technical complexity
  * Market potential

Input: {user's initial description or "need ideas"}

Expected Output:
- Refined app concept(s) with detailed breakdown
- Market analysis
- Competitive landscape
- Recommended MVP scope
- Monetization strategy
- Technical complexity assessment
- Next steps for validation
```

Display brainstorming results:

```
🚀 SHOPIFY APP BRAINSTORMING COMPLETE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

{Show app concepts with full details}

📊 Recommendation: {Most promising concept and why}

🎯 Next Step: Proceed with detailed analysis for selected concept

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Which concept would you like to develop?
Or provide your own refined idea based on this brainstorming.
```

Continue to Step 1.4 with selected/refined concept.

### Step 1.3b: Analyze with Product Owner (For Non-Shopify Projects)

Use `AskUserQuestion` tool to collect:

```
Question 1: Project Overview
- What problem does this project solve?
- Who are the target users?
- What's the core value proposition?

Question 2: Scope & Constraints
- MVP features (must-have)
- Nice-to-have features
- Technical constraints
- Timeline expectations
- Budget constraints

Question 3: Success Criteria
- How will you measure success?
- Key metrics to track
- Quality standards
```

### Step 1.4: Comprehensive Analysis with Product Owner

After brainstorming/initial input, launch `product-owner` agent:

```
Task: Comprehensive Project Analysis
- Analyze project description and answers
- Extract core value propositions
- Identify user personas
- Define product goal statement
- List potential epics (high-level features)
- Assess MVP scope vs full scope
- Identify risks and dependencies
- Recommend project structure

Output:
- Product Goal: [statement]
- User Personas: [list]
- Potential Epics: [5-10 epics with descriptions]
- MVP Scope: [recommended features]
- Risks: [identified risks]
- Success Metrics: [KPIs]
```

### Step 1.5: Display Analysis Results

```
✅ PHASE 1 COMPLETE: PROJECT ANALYSIS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📋 Product Goal:
{product goal statement}

👥 Target Users:
{user personas}

🎯 Identified Epics ({count}):
1. {Epic 1} - {description}
2. {Epic 2} - {description}
...

⚠️ Risks Identified:
- {risk 1}
- {risk 2}

📊 Success Metrics:
- {metric 1}
- {metric 2}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

{If Standard/Guided mode: "Proceed to Phase 2? (Yes/No)"}
{If YOLO mode: "⏩ Proceeding to Phase 2..."}
```

---

## PHASE 2: DOCUMENTATION & DESIGN

### Step 2.1: Generate PRD

Launch `product-owner` agent:

```
Task: Create Product Requirements Document
- Write comprehensive PRD based on analysis
- Include:
  * Executive Summary
  * Problem Statement
  * Solution Overview
  * User Stories (high-level)
  * Functional Requirements
  * Non-Functional Requirements
  * Success Metrics
  * Out of Scope
  * Timeline & Milestones
  * Risks & Mitigation

Output: Save to .scrum/docs/PRD.md
```

### Step 2.2: Design Architecture

Launch `solution-architect` agent:

```
Task: Design System Architecture
- Analyze technical requirements from PRD
- Design system architecture:
  * High-level components
  * Technology stack recommendations
  * Data models
  * API design
  * Integration points
  * Security considerations
  * Scalability approach
- Create architecture diagrams (text-based)
- Identify technical risks

Output: Save to .scrum/docs/ARCHITECTURE.md
```

### Step 2.3: Create UI/UX Design Plan

Launch `ux-design-expert` agent:

```
Task: Create UI/UX Design Guidelines
- Define user flows
- Create wireframe descriptions
- Specify design patterns
- Accessibility requirements
- Responsive design approach
- Component library recommendations
- Design system guidelines

Output: Save to .scrum/docs/UXUI_DESIGN.md
```

### Step 2.4: Project Manager Review

Launch `project-manager` agent:

```
Task: Review All Documentation
- Review PRD for completeness
- Validate architecture decisions
- Check UI/UX feasibility
- Identify gaps or conflicts
- Assess risk mitigation
- Verify scope alignment
- Provide approval recommendation

Output:
- Approval Status: [Approved / Needs Revision / Rejected]
- Issues Found: [list]
- Recommendations: [list]
```

### Step 2.5: Handle Review Outcome

```
if Approved:
  Display success, proceed to Phase 3

if Needs Revision:
  Display issues
  Ask user: "Address issues automatically? (Yes/No)"
  if Yes:
    Re-run problematic agents with corrections
  else:
    Pause workflow for manual fixes

if Rejected:
  Display critical issues
  Stop workflow
  Ask user to revise project scope
```

### Step 2.6: Display Phase 2 Results

```
✅ PHASE 2 COMPLETE: DOCUMENTATION & DESIGN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📄 Documents Created:
✅ PRD: .scrum/docs/PRD.md
✅ Architecture: .scrum/docs/ARCHITECTURE.md
✅ UI/UX Design: .scrum/docs/UXUI_DESIGN.md

✅ Project Manager Review: APPROVED

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

{If Standard/Guided mode: "Proceed to Phase 3? (Yes/No)"}
{If YOLO mode: "⏩ Proceeding to Phase 3..."}
```

---

## PHASE 3: BACKLOG CREATION

Use the existing `/scrum:backlog-builder` workflow:

```
Launch backlog-builder with:
- Input: Project analysis + PRD + Architecture
- Auto-generate epics and stories
- Add acceptance criteria
- Create .scrum/product-backlog.json
- Link epics to stories (parent-child)
```

**This phase includes:**
1. Epic Generation (5-10 epics)
2. Story Decomposition (20-50 stories)
3. Acceptance Criteria (3-5 per story)
4. Initial business value assignment
5. Dependency identification
6. Backlog file creation

### Display Phase 3 Results

```
✅ PHASE 3 COMPLETE: BACKLOG CREATED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 Backlog Statistics:
- Total Epics: {count}
- Total Stories: {count}
- Items with Acceptance Criteria: {count}

📁 Backlog File: .scrum/product-backlog.json

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

{If Standard/Guided mode: "Proceed to Phase 4? (Yes/No)"}
{If YOLO mode: "⏩ Proceeding to Phase 4..."}
```

---

## PHASE 4: BACKLOG PREPARATION

### Step 4.1: Prioritize All Items

Launch `product-owner` agent:

```
Task: Prioritize Product Backlog
- Review all epics and stories
- Apply prioritization matrix:
  * High Value + Low Risk = Priority 1-3
  * High Value + High Risk = Priority 4-6
  * Medium Value = Priority 7-10
  * Low Value = Priority 11+
- Ensure dependencies respected in priority order
- Identify MVP scope (typically top 20-30% of stories)

Output:
- Priority assigned to each item (1-N)
- MVP boundary identified
- Rationale for top priorities
```

### Step 4.2: Estimate Story Points

Launch `sprint-manager` agent:

```
Task: Estimate All Stories
- Estimate story points using Fibonacci (1,2,3,5,8,13)
- Consider complexity, effort, uncertainty
- Flag stories >13 points for splitting
- Do NOT estimate epics (sum of children)
- Provide estimation rationale

Output:
- Story points for each story
- Stories flagged for splitting
- Total points by epic
```

### Step 4.3: Validate Definition of Ready

For each story, check:
```
✅ Clear description in user story format
✅ Acceptance criteria defined (≥3)
✅ Story points assigned
✅ Dependencies identified
✅ Small enough (≤13 points)
✅ Testable
✅ Value/benefit clear
✅ Parent epic assigned

If all true: definitionOfReady = true
```

### Step 4.4: Sort Backlog by Priority

```
1. Read product-backlog.json
2. Sort backlog array by priority (ascending)
3. Update metadata:
   - totalItems
   - readyItems (count where definitionOfReady = true)
   - estimatedItems (count where storyPoints != null)
   - lastUpdated (current timestamp)
4. Write back to file
```

### Display Phase 4 Results

```
✅ PHASE 4 COMPLETE: BACKLOG PREPARED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 Backlog Ready Status:
- Total Items: {total}
- Ready for Sprint: {ready} items
- Estimated Items: {estimated} items
- Total Story Points: {points}

🎯 MVP Scope:
- Top Priority Items (1-3): {count} items, {points} points
- Estimated MVP Duration: {sprints} sprints

📋 Top 5 Priority Items:
1. [PBI-XXX] {title} - {points}pts
2. [PBI-XXX] {title} - {points}pts
3. [PBI-XXX] {title} - {points}pts
4. [PBI-XXX] {title} - {points}pts
5. [PBI-XXX] {title} - {points}pts

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

{If Standard/Guided mode: "Proceed to Phase 5? (Yes/No)"}
{If YOLO mode: "⏩ Proceeding to Phase 5..."}
```

---

## PHASE 5: SPRINT PLANNING

### Step 5.1: Check Team Capacity

```
1. Read .scrum/team-capacity.json
2. Calculate sprint capacity:
   - Total hours = (hours/day × days × team size)
   - Working hours = Total × 0.8 (80% factor)
   - Story points capacity = Working hours / points-to-hours ratio

3. Check historical velocity if available:
   - Read .scrum/metrics/velocity.json
   - Use average velocity from last 3 sprints
   - If first sprint, estimate 25-35 points for typical team
```

### Step 5.2: Select Stories for Sprint

Launch `sprint-manager` agent:

```
Task: Select Stories for Sprint
- Input:
  * Team capacity: {capacity} points
  * Top priority stories from backlog
  * Dependencies
- Select stories that:
  * Fit within capacity
  * Respect dependencies
  * Align with strategic goal
  * Can be completed in sprint
- Define sprint goal (one sentence)

Output:
- Selected stories (list of PBI IDs)
- Sprint goal
- Total points selected
- Justification for selections
```

### Step 5.3: Break Stories into Tasks

Launch `sprint-manager` agent for each selected story:

```
Task: Break Story into Tasks
- Input: Story with acceptance criteria
- Create 5-10 tasks per story:
  * Design tasks (if needed)
  * Implementation tasks
  * Testing tasks
  * Documentation tasks
  * Review tasks
- Estimate hours for each task
- Suggest task owners based on skills

Output per story:
- List of tasks with hour estimates
- Total hours per story
- Suggested owners
```

### Step 5.4: Create Sprint Backlog

```
1. Create .scrum/sprints/sprint-{number}/ directory
2. Create sprint-{number}/backlog.json:
{
  "sprintNumber": {number},
  "sprintGoal": "{goal}",
  "startDate": "{date}",
  "endDate": "{date}",
  "teamCapacity": {capacity},
  "committedPoints": {points},
  "backlogItems": [
    {
      "id": "PBI-XXX",
      "title": "...",
      "storyPoints": X,
      "status": "committed",
      "tasks": [
        {
          "id": "TASK-001",
          "description": "...",
          "estimatedHours": X,
          "assignedTo": "...",
          "status": "todo"
        }
      ]
    }
  ],
  "impediments": [],
  "dailyLogs": []
}

3. Update stories in product-backlog.json:
   - Set status: "in-progress"
   - Set sprint: {number}
```

### Display Phase 5 Results

```
✅ PHASE 5 COMPLETE: SPRINT PLANNING
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎯 Sprint {number} Details:
Sprint Goal: {goal}
Duration: {start_date} to {end_date}
Team Capacity: {capacity} hours / {points} points

📋 Committed Items ({count} stories, {points} points):
1. [PBI-XXX] {title} ({points}pts) - {tasks} tasks
2. [PBI-XXX] {title} ({points}pts) - {tasks} tasks
...

📊 Sprint Commitment:
- Committed Points: {points}
- Capacity: {capacity} points
- Utilization: {percentage}%
- Risk Level: {Low/Medium/High}

📁 Sprint Backlog: .scrum/sprints/sprint-{number}/backlog.json

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ Sprint {number} is ready to start!

{If Standard/Guided mode: "Start Sprint Execution? (Yes/No)"}
{If YOLO mode: "⏩ Sprint {number} execution begins..."}
```

---

## PHASE 6: SPRINT EXECUTION LOOP

### Overview

This phase runs **continuously during the sprint** with daily cycles:

```
Daily Cycle:
1. Daily Standup (automated prompt)
2. Dev Team Implementation (manual)
3. Update Task Status (automated tracking)
4. Code Review (manual + automated checks)
5. Testing (automated + manual)
6. Monitor Sprint Health (automated)

Repeat until sprint ends or all stories done.
```

### Step 6.1: Daily Standup (Each Day)

Run `/daily-standup` command automatically or prompt:

```
📅 DAILY STANDUP - Sprint {number}, Day {day}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

For each team member, answer:

1. ✅ What did you complete yesterday?
   [List completed tasks]

2. 🎯 What will you work on today?
   [List planned tasks]

3. ⚠️ Any blockers or impediments?
   [List blockers or "None"]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

{Collect updates from user or team members}

After standup:
- Update task statuses in sprint backlog
- Log impediments
- Update burndown chart
- Calculate sprint health score
- Save to sprint-{number}/daily-logs/{date}.json
```

### Step 6.2: Implementation Tracking

**Automatic monitoring:**

```
1. Watch for file changes in repository
2. Track commit messages
3. Monitor branch activity
4. Auto-update task status based on:
   - Commit messages with task IDs
   - Pull request events
   - CI/CD pipeline status

3. Provide daily summary:
   - Tasks moved to "in-progress"
   - Tasks moved to "done"
   - Code review requests
   - Test status
```

### Step 6.3: Code Review Automation

Launch `code-reviewer` agent when PR created:

```
Task: Review Code Changes
- Analyze code changes in PR
- Check for:
  * Code quality issues
  * Security vulnerabilities
  * Performance concerns
  * Best practices violations
  * Test coverage
  * Documentation updates
- Provide review comments
- Approve or request changes

Output:
- Review status: [Approved / Changes Requested / Rejected]
- Comments: [list]
- Severity: [Critical / Major / Minor]
```

### Step 6.4: Testing & Quality Gates

**Automated checks:**

```
For each completed task:
1. Run unit tests
2. Run integration tests
3. Check test coverage (target: >80%)
4. Run linters and formatters
5. Check Definition of Done criteria:
   ✅ Code written
   ✅ Code reviewed
   ✅ Tests written and passing
   ✅ Documentation updated
   ✅ No critical bugs
   ✅ Acceptance criteria met
   ✅ Deployed to staging

If all pass:
  - Mark task as "done"
  - Update story progress
  - Notify team

If failures:
  - Mark task as "blocked"
  - Create impediment
  - Notify assignee
```

### Step 6.5: Sprint Health Monitoring

**Daily automated checks:**

```
Calculate Sprint Health Score (0-100):

Factors:
- Burndown trend (30%): On track / ahead / behind
- Velocity (20%): Committed vs completed points
- Blockers (20%): Number and age of impediments
- Team morale (15%): From retrospective feedback
- Quality (15%): Test pass rate, bug count

Health Score Interpretation:
- 80-100: Healthy (Green)
- 60-79: Warning (Yellow)
- 0-59: Critical (Red)

If score < 60:
  Alert: "Sprint health critical! Review impediments."
  Suggest: "Consider descoping or requesting help"
```

### Step 6.6: Sprint Progress Display (Daily)

```
📊 SPRINT {number} PROGRESS - Day {day}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎯 Sprint Goal: {goal}

📈 Progress:
- Completed: {completed} / {committed} points ({percentage}%)
- Stories Done: {done} / {total}
- Tasks Done: {done} / {total}

📉 Burndown:
- Remaining Points: {remaining}
- Expected Remaining: {expected}
- Status: {On Track / Behind / Ahead}

⚠️ Impediments: {count} active
{List of active impediments}

🏥 Sprint Health: {score}/100 ({status})

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📁 Burndown Chart: .scrum/metrics/burndown-charts.json
📁 Sprint Health: .scrum/metrics/sprint-health.json
```

### Step 6.7: Sprint End Detection

```
Check daily:
1. Is today the sprint end date?
   OR
2. Are all stories marked "done"?

If either is true:
  Trigger Phase 6.8: Sprint Review
```

### Step 6.8: Sprint Review (Automatic)

Run `/sprint-review` command:

```
📊 SPRINT {number} REVIEW
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎯 Sprint Goal: {goal}
Status: {✅ Achieved / ⚠️ Partially / ❌ Not Achieved}

📈 Sprint Metrics:
- Committed: {committed} points
- Completed: {completed} points
- Velocity: {completed} points
- Completion Rate: {percentage}%

✅ Completed Stories ({count}):
{List completed stories with acceptance criteria verified}

⚠️ Incomplete Stories ({count}):
{List incomplete stories with reasons}

📊 Demo Completed Work:
{For each completed story, show what was built}

🔄 Actions:
- Move completed stories to "done" in product backlog
- Return incomplete stories to "backlog"
- Calculate velocity
- Update metrics

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### Step 6.9: Sprint Retrospective (Automatic)

Run `/sprint-retro` command:

```
🔄 SPRINT {number} RETROSPECTIVE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

{Collect feedback from team}

What went well? 😊
- {positive item 1}
- {positive item 2}

What didn't go well? 😔
- {issue 1}
- {issue 2}

What should we improve? 💡
- {improvement 1}
- {improvement 2}

📋 Action Items for Next Sprint:
1. {action item 1} - Owner: {name}
2. {action item 2} - Owner: {name}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Save to: .scrum/retrospectives/sprint-{number}.json
```

### Display Phase 6 Summary

```
✅ PHASE 6 COMPLETE: SPRINT {number} FINISHED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 Sprint Summary:
- Duration: {start} to {end}
- Velocity: {velocity} points
- Completed: {completed}/{committed} stories
- Quality: {quality_score}/100

📈 Metrics Updated:
✅ Velocity tracked
✅ Sprint health recorded
✅ Burndown charts saved
✅ Team performance metrics updated

🔄 Next Steps:
- Review new backlog items
- Plan next sprint

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

{If Standard/Guided mode: "Proceed to Phase 7? (Yes/No)"}
{If YOLO mode: "⏩ Proceeding to Phase 7..."}
```

---

## PHASE 7: BACKLOG MANAGEMENT LOOP

This phase runs **continuously** and handles new backlog items:

### Step 7.1: Check for New Backlog Items

```
Prompt user:
"Do you have new backlog items to add? (Yes/No/Done)"

Options:
- Yes: Go to Step 7.2
- No: Skip to Step 7.5
- Done: Exit workflow
```

### Step 7.2: Add New Backlog Items

```
Use /scrum:add-backlog command for each new item:

For each item:
1. Ask type: Story/Epic/Bug/Spike/Technical Debt
2. Collect title, description, priority, business value
3. Add acceptance criteria (for stories)
4. Identify dependencies
5. Add to product-backlog.json

Continue until user says "Done"
```

### Step 7.3: Re-Prioritize Backlog

Launch `product-owner` agent:

```
Task: Re-Prioritize Product Backlog
- Review all backlog items including new ones
- Re-assess priorities based on:
  * New business needs
  * Lessons learned from sprint
  * Market changes
  * Technical dependencies
- Update priority numbers
- Sort backlog by new priorities

Output:
- Updated priorities for all items
- Rationale for major changes
- Highlighted items that moved significantly
```

### Step 7.4: Estimate New Items

Launch `sprint-manager` agent:

```
Task: Estimate New Backlog Items
- Estimate story points for new items
- Reference past estimates for consistency
- Flag large items (>13 points) for splitting

Output:
- Story points for new items
- Updated backlog with estimates
```

### Step 7.5: Display Updated Backlog Status

```
📋 BACKLOG UPDATE COMPLETE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 Current Backlog Status:
- Total Items: {total} ({+X new})
- Ready for Sprint: {ready}
- Total Story Points: {points}

🎯 Top 5 Priority Items:
1. [PBI-XXX] {title} - {points}pts {if new: "🆕"}
2. [PBI-XXX] {title} - {points}pts
...

📈 Next Sprint Forecast:
- Estimated Velocity: {velocity} points
- Stories for Next Sprint: {count} items
- Estimated Duration: {sprints} sprints remaining for backlog

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Ready to plan next sprint?
```

### Step 7.6: Loop to Next Sprint

```
Ask user:
"Start planning next sprint? (Yes/No/Exit)"

Options:
- Yes: Return to Phase 5 (Sprint Planning)
- No: Stay in Phase 7 (Backlog Management)
- Exit: End workflow
```

---

## WORKFLOW STATE MANAGEMENT

### Save State Between Sessions

Create `.scrum/workflow-state.json`:

```json
{
  "currentPhase": "PHASE_6",
  "currentSprintNumber": 2,
  "mode": "YOLO",
  "startedAt": "2025-01-15T10:00:00Z",
  "lastUpdated": "2025-01-15T15:30:00Z",
  "phaseHistory": [
    {
      "phase": "PHASE_1",
      "completedAt": "2025-01-15T10:30:00Z"
    },
    {
      "phase": "PHASE_2",
      "completedAt": "2025-01-15T11:45:00Z"
    }
  ],
  "context": {
    "projectName": "...",
    "totalSprints": 2,
    "totalVelocity": 58
  }
}
```

### Resume Workflow

If `.scrum/workflow-state.json` exists:

```
Detect existing workflow state:

"📌 EXISTING WORKFLOW DETECTED

Current Status:
- Phase: {current_phase}
- Sprint: {sprint_number}
- Last Updated: {timestamp}

Options:
1. Resume from {current_phase}
2. Start new workflow (will archive current)
3. View workflow history

Choose: 1, 2, or 3"
```

---

## ERROR HANDLING & RECOVERY

### Phase Failures

```
If any phase fails:
1. Log error details
2. Save workflow state
3. Present options to user:
   - Retry phase
   - Skip phase (if non-critical)
   - Debug mode (show detailed logs)
   - Exit workflow

If YOLO mode and non-critical error:
  - Log warning
  - Auto-retry once
  - If still fails, pause for user input
```

### Agent Failures

```
If agent fails:
1. Capture error message
2. Check if issue is:
   - Timeout (retry with longer timeout)
   - Invalid input (request user clarification)
   - System error (escalate)
3. Auto-retry up to 3 times
4. If all retries fail, pause workflow
```

### Data Corruption

```
Before each write operation:
1. Backup current file
2. Validate new data
3. Write new data
4. Verify write success
5. Remove backup if success

If write fails:
  - Restore from backup
  - Log error
  - Notify user
```

---

## MONITORING & REPORTING

### Real-Time Progress Display

```
Show progress bar during long operations:

[████████░░░░░░░░░░] 40% - Generating stories (12/30)
Estimated time remaining: 2 minutes

Current: Creating acceptance criteria for PBI-015
```

### Phase Summaries

At end of each phase, show:
- What was accomplished
- Time taken
- Files created/updated
- Next phase preview
- Approval status (if applicable)

### Final Workflow Report

```
🎉 COMPLETE END-TO-END WORKFLOW FINISHED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 WORKFLOW SUMMARY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⏱️ Timeline:
- Started: {start_timestamp}
- Completed: {end_timestamp}
- Total Duration: {duration}

📋 Phases Completed:
✅ Phase 1: Project Analysis
✅ Phase 2: Documentation & Design
✅ Phase 3: Backlog Creation
✅ Phase 4: Backlog Preparation
✅ Phase 5: Sprint Planning
✅ Phase 6: Sprint Execution ({sprints} sprints)
✅ Phase 7: Backlog Management

📄 Documents Created:
- PRD: .scrum/docs/PRD.md
- Architecture: .scrum/docs/ARCHITECTURE.md
- UI/UX Design: .scrum/docs/UXUI_DESIGN.md
- Product Backlog: .scrum/product-backlog.json
- Sprint Backlogs: .scrum/sprints/sprint-*/backlog.json
- Retrospectives: .scrum/retrospectives/sprint-*.json

📊 Project Metrics:
- Total Epics: {epic_count}
- Total Stories: {story_count}
- Total Story Points: {total_points}
- Sprints Completed: {sprint_count}
- Average Velocity: {avg_velocity} points/sprint
- Total Features Delivered: {features_count}

🎯 Current Status:
- Product Backlog Items: {backlog_count}
- Ready for Next Sprint: {ready_count}
- Estimated Work Remaining: {remaining_sprints} sprints

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🚀 NEXT STEPS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1. Review all documentation:
   → Directory: .scrum/docs/

2. Monitor sprint metrics:
   → Velocity: .scrum/metrics/velocity.json
   → Sprint Health: .scrum/metrics/sprint-health.json

3. Continue development:
   → Command: /scrum:full-workflow (will resume)
   → Or: /sprint-planning for next sprint

4. View orchestrator guidance:
   → Command: /scrum:orchestrator

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎉 Congratulations! Your project is live and running on Scrum!
```

---

## INTEGRATION POINTS

### With Existing Commands

This master workflow uses existing commands:
- `/scrum:init` - System initialization
- `/scrum:backlog-builder` - Backlog creation (Phase 3)
- `/scrum:add-backlog` - Add new items (Phase 7)
- `/sprint-planning` - Sprint planning (Phase 5)
- `/daily-standup` - Daily sync (Phase 6)
- `/sprint-review` - Sprint review (Phase 6)
- `/sprint-retro` - Retrospective (Phase 6)
- `/scrum:orchestrator` - Smart guidance (anytime)

### With Specialized Agents

This workflow coordinates multiple agents:
- `product-owner` - PRD, backlog, prioritization
- `solution-architect` - Architecture design
- `ux-design-expert` - UI/UX design
- `sprint-manager` - Estimation, sprint planning, execution
- `scrum-master` - Facilitation, impediments
- `project-manager` - Quality gates, reviews
- `code-reviewer` - Code quality checks
- `increment-validator` - DoD validation
- `scrum-metrics-analyzer` - Metrics tracking

---

## SUCCESS CRITERIA

Workflow is successful when:

✅ All 7 phases completed without critical errors
✅ Documentation generated (PRD, Architecture, UI/UX)
✅ Product backlog created with estimated stories
✅ At least 1 sprint completed successfully
✅ Code reviewed and tested
✅ Metrics tracked and available
✅ Team velocity established
✅ Continuous backlog management active
✅ All data files valid and up-to-date
✅ User satisfied with automation level
