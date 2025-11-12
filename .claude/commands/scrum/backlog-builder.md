---
description: Automated workflow to build complete product backlog from project idea. Takes a project description and generates epics, stories, and acceptance criteria through structured phases with validation.
---

You are orchestrating a comprehensive backlog building workflow that takes a project idea and transforms it into a complete, ready-to-use product backlog.

## Input

The user provides a project/product description they want to build.

## Workflow Overview

This workflow follows a structured, sequential approach:

**Phase 1: Project Analysis** - Understand the vision, goals, and scope
**Phase 2: Epic Generation** - Create high-level feature epics
**Phase 3: Story Decomposition** - Break epics into implementable stories
**Phase 4: Story Refinement** - Add acceptance criteria and details
**Phase 5: Prioritization & Estimation** - Order by value and estimate complexity
**Phase 6: Validation** - Review completeness and readiness

Each phase automatically proceeds to the next after completion.

---

## Phase 1: Project Analysis

### Step 1.1: Gather Project Information

Ask the user for clarification if the project description is too vague:

```
**Project Analysis**

I'll help build a complete product backlog for your project. Let me understand your vision:

1. **Project Name**: What should we call this project?
2. **Problem Statement**: What problem does this solve?
3. **Target Users**: Who will use this product?
4. **Success Criteria**: How will we measure success?
5. **Constraints**: Any technical, budget, or time constraints?
```

### Step 1.2: Analyze and Extract

Use the `Task` tool to launch the `product-owner` agent:

```
Launch product-owner agent with:
- Analyze the project description
- Identify core value propositions
- Extract key features and functionalities
- Define product goal
- Identify user personas
- List potential epics (5-10 high-level features)
- Assess scope and MVP boundaries

Input: {user's project description + answers}

Expected Output:
- Product Goal statement
- List of 5-10 potential epics with brief descriptions
- User personas identified
- Success metrics defined
- MVP scope recommendations
```

After analysis, display results to user:

```
✅ PROJECT ANALYSIS COMPLETE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📋 Product Goal:
{Product goal statement}

👥 Target Users:
{User personas}

🎯 Success Metrics:
{Success criteria}

🗂️ Identified Epics ({count}):
1. {Epic 1 name} - {brief description}
2. {Epic 2 name} - {brief description}
...

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⏩ Proceeding to Phase 2: Epic Generation...
```

---

## Phase 2: Epic Generation

### Step 2.1: Create Epic Items

For each identified epic from Phase 1:

Use the `product-owner` agent to:

```
Launch product-owner agent for each epic with:
- Create detailed epic description
- Define high-level goal
- Describe value proposition
- Outline scope (what's included)
- Suggest priority based on value and dependencies
- Suggest labels/tags
- Estimate business value (1-10)

Input: Epic name and brief description from Phase 1

Expected Output for each epic:
- Full epic description (high-level goal, value prop, scope)
- Priority recommendation (1-10)
- Business value (1-10)
- Suggested labels
- Dependencies on other epics
```

### Step 2.2: Write Epics to Backlog

For each epic, add to `.scrum/product-backlog.json`:

1. Read current backlog
2. Generate next PBI ID
3. Create epic object:
```json
{
  "id": "PBI-XXX",
  "type": "epic",
  "title": "{Epic title}",
  "description": "{Generated epic description}",
  "priority": {priority},
  "status": "backlog",
  "storyPoints": null,
  "businessValue": {businessValue},
  "createdDate": "{today}",
  "updatedDate": "{today}",
  "sprint": null,
  "dependencies": [],
  "labels": ["{labels}"],
  "productOwnerNotes": "",
  "definitionOfReady": false,
  "parent": null,
  "children": []
}
```
4. Add to backlog array
5. Update metadata

### Step 2.3: Display Progress

```
✅ PHASE 2 COMPLETE: EPICS CREATED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Created {count} Epics:
✅ PBI-001: {Epic 1 title} (Priority: {p}, Value: {v}/10)
✅ PBI-002: {Epic 2 title} (Priority: {p}, Value: {v}/10)
...

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⏩ Proceeding to Phase 3: Story Decomposition...
```

---

## Phase 3: Story Decomposition

### Step 3.1: Decompose Each Epic

For each epic created in Phase 2:

Use the `product-owner` agent to:

```
Launch product-owner agent for epic decomposition:
- Break down epic into 3-7 user stories
- Each story should deliver incremental value
- Follow user story format: "As a [role], I want [goal], so that [benefit]"
- Ensure stories follow INVEST criteria:
  * Independent
  * Negotiable
  * Valuable
  * Estimable
  * Small (fits in 1 sprint)
  * Testable
- Suggest priority for each story
- Estimate business value (1-10)
- Identify dependencies between stories

Input: Epic ID and description

Expected Output:
- 3-7 user stories with:
  * Title
  * User story description
  * Parent epic ID
  * Priority recommendation
  * Business value
  * Dependencies (if any)
  * Suggested labels
```

### Step 3.2: Write Stories to Backlog

For each story:

1. Generate next PBI ID
2. Create story object:
```json
{
  "id": "PBI-XXX",
  "type": "story",
  "title": "{Story title}",
  "description": "{User story format description}",
  "priority": {priority},
  "status": "backlog",
  "storyPoints": null,
  "businessValue": {businessValue},
  "createdDate": "{today}",
  "updatedDate": "{today}",
  "sprint": null,
  "acceptanceCriteria": [],
  "dependencies": ["{dependency IDs}"],
  "labels": ["{labels}"],
  "productOwnerNotes": "",
  "definitionOfReady": false,
  "parent": "{epic ID}",
  "children": []
}
```
3. Add story ID to parent epic's `children` array
4. Add to backlog array
5. Update metadata

### Step 3.3: Display Progress

```
✅ PHASE 3 COMPLETE: STORIES CREATED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Created {count} User Stories from {epic_count} Epics:

Epic: PBI-001 - {Epic title}
  ✅ PBI-010: {Story 1 title}
  ✅ PBI-011: {Story 2 title}
  ✅ PBI-012: {Story 3 title}

Epic: PBI-002 - {Epic title}
  ✅ PBI-013: {Story 1 title}
  ✅ PBI-014: {Story 2 title}
  ...

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⏩ Proceeding to Phase 4: Story Refinement...
```

---

## Phase 4: Story Refinement

### Step 4.1: Add Acceptance Criteria

For each story created in Phase 3:

Use the `product-owner` agent to:

```
Launch product-owner agent for story refinement:
- Generate 3-5 acceptance criteria for each story
- Use Given/When/Then format:
  * Given [context/precondition]
  * When [action/event]
  * Then [expected outcome]
- Ensure criteria are:
  * Testable
  * Specific
  * Clear
  * Measurable
- Add technical notes if needed
- Validate INVEST criteria

Input: Story ID, title, and description

Expected Output:
- 3-5 acceptance criteria in Given/When/Then format
- Optional technical notes
- Validation that story meets INVEST criteria
```

### Step 4.2: Update Stories with Criteria

For each story:

1. Read story from backlog
2. Add acceptance criteria array
3. Add technical notes if provided
4. Update `definitionOfReady` based on criteria:
   - Has clear description ✅
   - Has acceptance criteria (≥3) ✅
   - Dependencies identified ✅
   - Small enough ✅
   - Testable ✅
   - Value clear ✅
   - Missing: story points (will be added in Phase 5)
   - Set `definitionOfReady: false` (needs estimation)
5. Write back to backlog

### Step 4.3: Display Progress

```
✅ PHASE 4 COMPLETE: STORIES REFINED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Added acceptance criteria to {count} stories:

✅ PBI-010: {Story title}
   Criteria: {count} acceptance criteria

✅ PBI-011: {Story title}
   Criteria: {count} acceptance criteria

...

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⏩ Proceeding to Phase 5: Prioritization & Estimation...
```

---

## Phase 5: Prioritization & Estimation

### Step 5.1: Prioritize All Items

Use the `product-owner` agent to:

```
Launch product-owner agent for prioritization:
- Review all epics and stories
- Apply prioritization factors:
  * Business value (1-10)
  * Risk (High/Medium/Low)
  * Dependencies (what must come first)
  * Strategic alignment
  * MVP scope
- Use prioritization matrix:
  * High Value + Low Risk = Top Priority (1-3)
  * High Value + High Risk = Second Priority (4-6)
  * Low Value + Low Risk = Lower Priority (7-10)
  * Low Value + High Risk = Consider removing
- Assign final priority numbers (1 = highest)
- Ensure dependency order is respected

Input: All backlog items with their business values and dependencies

Expected Output:
- Priority assignment for each item (1-N)
- Rationale for priority decisions
- Dependency-ordered list
```

### Step 5.2: Estimate Story Points

Use the `sprint-manager` agent to:

```
Launch sprint-manager agent for estimation:
- Estimate story points for each story
- Use Fibonacci sequence: 1, 2, 3, 5, 8, 13
- Consider:
  * Complexity (how hard?)
  * Effort (how much work?)
  * Uncertainty (how many unknowns?)
- Stories >13 points should be flagged for splitting
- Reference estimation guidelines:
  * 1-2 points: Very simple, well understood
  * 3 points: Straightforward, some complexity
  * 5 points: Moderate complexity, clear approach
  * 8 points: Complex, some unknowns
  * 13 points: Very complex, significant unknowns
- Do NOT estimate epics (they are sum of children)
- Do NOT estimate spikes (they are time-boxed)

Input: All stories with descriptions and acceptance criteria

Expected Output:
- Story point estimate for each story
- Rationale for estimates
- Flags for stories that should be split (>13 points)
```

### Step 5.3: Update Backlog with Priorities and Estimates

1. Read full backlog
2. Update each item with:
   - Final priority
   - Story points (for stories only)
   - Update `definitionOfReady: true` for stories that are now complete
3. Sort backlog array by priority (ascending)
4. Update metadata:
   - `totalItems`
   - `readyItems` (items with definitionOfReady: true)
   - `estimatedItems` (items with storyPoints)
   - `lastUpdated`
5. Write back to file

### Step 5.4: Display Progress

```
✅ PHASE 5 COMPLETE: PRIORITIZED & ESTIMATED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Prioritization Complete:
- Top Priority (1-3): {count} items
- High Priority (4-6): {count} items
- Medium Priority (7-10): {count} items

Estimation Complete:
- Total Story Points: {total_points}
- Average Story Size: {avg_points} points
- Stories Ready for Sprint: {ready_count}

Items flagged for splitting (>13 points):
{List any stories >13 points}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⏩ Proceeding to Phase 6: Final Validation...
```

---

## Phase 6: Validation

### Step 6.1: Validate Backlog Quality

Use the `product-owner` agent for validation:

```
Launch product-owner agent for validation:
- Verify all epics have child stories
- Check all stories have:
  * Clear description in user story format
  * At least 3 acceptance criteria
  * Story points assigned
  * Dependencies identified
  * Parent epic assigned
  * Priority set
- Validate Definition of Ready for each story
- Check for dependency conflicts or circular dependencies
- Ensure priority order respects dependencies
- Verify MVP scope is achievable (top priority items)
- Check for gaps in functionality

Input: Complete backlog

Expected Output:
- Validation report with:
  * Items passing Definition of Ready
  * Items needing attention
  * Dependency issues
  * Priority conflicts
  * MVP scope assessment
  * Recommendations for improvement
```

### Step 6.2: Generate Backlog Summary

Create comprehensive summary:

```
✅ BACKLOG BUILDING COMPLETE!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 BACKLOG STATISTICS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Total Items:       {total} ({epics} epics, {stories} stories)
Ready for Sprint:  {ready} items
Estimated Items:   {estimated} items
Total Story Points: {points} points

📋 Product Goal:
{Product goal from Phase 1}

🎯 MVP SCOPE (Top Priority Items)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Priority 1-3 Items ({count} items, {points} points):
1. [PBI-XXX] {Title} - {type} - {points}pts
2. [PBI-XXX] {Title} - {type} - {points}pts
...

Estimated Sprints for MVP: {sprints} sprints (assuming {velocity} velocity)

📂 EPICS BREAKDOWN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Epic: [PBI-001] {Epic title} (Priority: {p})
  → {count} stories, {points} total points
  Stories:
    - [PBI-010] {Story title} ({points}pts) - Ready: {✅/❌}
    - [PBI-011] {Story title} ({points}pts) - Ready: {✅/❌}
    ...

Epic: [PBI-002] {Epic title} (Priority: {p})
  → {count} stories, {points} total points
  Stories:
    - [PBI-020] {Story title} ({points}pts) - Ready: {✅/❌}
    ...

✅ VALIDATION RESULTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Definition of Ready:
  ✅ {count} items fully ready
  ⚠️  {count} items need attention

{If there are items needing attention:}
Items Needing Attention:
- [PBI-XXX]: {issue description}
- [PBI-XXX]: {issue description}

{If there are dependency issues:}
⚠️  Dependency Issues:
- {description of issue}

{If there are priority conflicts:}
⚠️  Priority Conflicts:
- {description of conflict}

🎯 NEXT STEPS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Your product backlog is ready! Here's what to do next:

1. Review the backlog file:
   → File: .scrum/product-backlog.json

2. {If issues exist: Address items needing attention}
   {Else: Your backlog is complete and ready!}

3. Configure your team:
   → Check: .scrum/team-capacity.json
   → Update team member information

4. Start Sprint Planning when ready:
   → Command: /sprint-planning

5. View your backlog visually:
   → Command: cat .scrum/product-backlog.json | jq '.backlog[] | {id, title, priority, storyPoints, status}'

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎉 Congratulations! Your product backlog is built and ready to go!
```

---

## Error Handling

### If Backlog File Doesn't Exist

```
❌ Product backlog not initialized.

Please initialize the Scrum system first:
→ Command: /scrum:init

After initialization, run this command again.
```

### If Project Description is Too Vague

Ask clarifying questions:
```
⚠️  Need More Information

Your project description needs more details. Please provide:

1. What problem does this project solve?
2. Who are the target users?
3. What are the main features you envision?
4. Any specific constraints (technical, budget, timeline)?
```

### If Epic Decomposition Fails

```
⚠️  Epic Decomposition Issue

Could not break down epic [PBI-XXX] into stories.

Would you like to:
1. Provide more details about this epic
2. Skip this epic for now
3. Manually add stories later
```

---

## Special Considerations

### Large Projects (>30 Stories)

If the project analysis identifies >30 stories:
```
⚠️  Large Project Detected

This project would generate {count} stories. Consider:

1. Focus on MVP scope first (recommended)
2. Generate full backlog (may take longer)
3. Split into phases

Please choose: 'MVP', 'Full', or 'Phases'
```

### Technical Debt and Bugs

If user mentions existing issues or technical debt:
```
Would you like to add technical debt items or bugs to the backlog?

1. Yes - I'll add a section for technical items
2. No - Focus on new features only
```

---

## Integration with Other Commands

After completion, suggest:
```
Your backlog is ready! Next recommended steps:

1. Run backlog refinement to review items:
   → /backlog-refinement

2. Estimate any remaining items:
   → /story-estimation

3. Start your first sprint:
   → /sprint-planning

4. Check system guidance:
   → /scrum:orchestrator
```

---

## Success Criteria

✅ Product backlog file created/updated
✅ All epics have descriptions and priorities
✅ All stories follow user story format
✅ All stories have 3+ acceptance criteria
✅ All stories have story points
✅ All items have priorities
✅ Parent-child relationships established
✅ Dependencies identified
✅ Metadata correctly updated
✅ Items sorted by priority
✅ Definition of Ready validated
✅ User receives comprehensive summary
