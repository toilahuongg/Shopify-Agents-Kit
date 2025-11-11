# Daily Standup Command

You are facilitating a Daily Scrum (Daily Standup) - a 15-minute time-boxed event for the Development Team to synchronize and plan the next 24 hours of work.

## Overview

The Daily Scrum is a daily inspection and adaptation event where the Development Team:
- Synchronizes activities
- Plans work for next 24 hours
- Identifies impediments
- Tracks progress toward Sprint Goal

**Timeboxed:** 15 minutes (strictly enforced)
**Participants:** Development Team (required), Scrum Master (facilitator), Product Owner (optional)
**Frequency:** Every working day at the same time and place

## Workflow

### Step 1: Opening & Sprint Context

Use the **sprint-manager** agent to load Sprint context:

```
Load current Sprint information:
- Sprint number and Sprint Goal
- Sprint day (X of Y)
- Days remaining in Sprint
- Committed story points
- Completed story points
- Remaining story points
- Sprint health status

Load from: .scrum/sprints/sprint-[current]/backlog.json

Provide Sprint context summary for team.
```

**Expected Output:**
```markdown
## Daily Standup - Sprint [X], Day [Y]

**Sprint Goal:** "[goal text]"
**Progress:** Day [Y] of [Z] ([A]% complete)
**Commitment:** [B] points | **Completed:** [C] points | **Remaining:** [D] points
**Sprint Health:** [🟢 Healthy / 🟡 At Risk / 🔴 Critical]
```

---

### Step 2: Three Questions (Per Team Member)

For **each team member** (or agent representing work streams), ask the three standard questions:

#### Question 1: What did I do yesterday?
```
@[team-member], what did you complete yesterday that helped the team meet the Sprint Goal?

Please provide:
- Tasks/PBIs completed (with IDs)
- Story points completed (if any items finished)
- Any progress made on in-progress items
- Any learnings or discoveries
```

#### Question 2: What will I do today?
```
@[team-member], what will you work on today to help the team meet the Sprint Goal?

Please provide:
- Tasks/PBIs you'll work on (with IDs)
- Expected progress or completion
- Any collaboration needed with other team members
```

#### Question 3: Are there any impediments?
```
@[team-member], is anything blocking you or slowing you down?

Please report:
- Any blockers preventing work
- Dependencies waiting on others
- Questions needing Product Owner input
- Technical challenges or unknowns
- Resource or access needs
```

**Note:** Keep each person's update to 2-3 minutes maximum. This is a synchronization meeting, not a detailed discussion.

---

### Step 3: Capture Impediments

For any impediments reported, use the **impediment-resolver** agent:

```
Log new impediment:
- Title: [brief description]
- Reported by: @[team-member]
- Sprint: Sprint [X]
- Sprint Day: [Y]
- Description: [detailed description]
- Impact: [what work is blocked]
- Blocked items: [PBI IDs]
- Blocked points: [story points affected]

Determine:
- Category: [technical/organizational/external/team]
- Severity: [critical/high/medium/low]
- Assign to: @scrum-master (default) or appropriate owner
- Target resolution: [based on severity]

Save to: .scrum/sprints/sprint-[X]/impediments.json
```

**Impediment Severity Guide:**
- **Critical:** Blocks entire team or Sprint Goal
- **High:** Blocks 1-2 items, needs resolution in 1-2 days
- **Medium:** Slows progress, resolve within Sprint
- **Low:** Minor inconvenience, workaround exists

---

### Step 4: Update Sprint Backlog

Use the **sprint-manager** agent to update Sprint Backlog based on team updates:

```
Update Sprint Backlog for Day [X]:

For each item reported as complete:
- Mark status: "in-progress" → "done"
- Record completion date
- Validate meets Definition of Done

For each item started today:
- Mark status: "todo" → "in-progress"
- Record start date
- Assign to team member

Update story points remaining:
- Calculate points completed yesterday
- Update running total
- Record in burndown data

Save to: .scrum/sprints/sprint-[X]/backlog.json
```

---

### Step 5: Update Burndown Chart

Use the **scrum-metrics-analyzer** agent to update daily burndown:

```
Update burndown chart for Sprint [X], Day [Y]:

Current data:
- Story points remaining: [Z points]
- Story points completed today: [A points]
- Ideal remaining: [B points] (based on linear burndown)
- Variance: [Z - B points]

Generate updated burndown:
- Add today's data point
- Calculate trend (improving/declining/stable)
- Compare actual vs ideal line
- Determine Sprint health status

Output:
- ASCII burndown chart (updated)
- Variance from ideal
- Forecast Sprint completion
- Sprint health status (🟢/🟡/🔴)

Update: .scrum/sprints/sprint-[X]/backlog.json (burndown section)
```

**Burndown Chart ASCII Example:**
```
Sprint [X] Burndown (Day [Y] of [Z])

35 |●                              ● Actual
30 |  ●                            ○ Ideal
25 |    ●                          Status: 🟢 On Track
20 |      ●
15 |        ●                      Day [Y]: [A] pts remaining
10 |          ○○                   Variance: [±X] points
 5 |            ○○                 Forecast: [B] pts complete
 0 |________________○○
   0  2  4  6  8 10 12 14

Current Status: 🟢 Healthy (on track for Sprint Goal)
```

---

### Step 6: Sprint Health Assessment

Use the **scrum-metrics-analyzer** agent to assess Sprint health:

```
Perform Sprint health check for Day [Y]:

Assess:
1. Burndown variance: [actual vs ideal]
2. Open impediments: [count and severity]
3. Scope changes: [items added/removed]
4. Team availability: [any absences]
5. Velocity pace: [on track for commitment?]

Calculate health score (0-100):
- Base score: 100
- Deduct for burndown variance
- Deduct for impediments
- Deduct for scope changes
- Deduct for reduced capacity

Determine status:
- 80-100: 🟢 Healthy
- 60-79: 🟡 At Risk
- 0-59: 🔴 Critical

Provide recommendations if At Risk or Critical.

Update: .scrum/metrics/sprint-health.json
```

**Health Score Example:**
```markdown
## Sprint Health: Day [Y]

**Score:** 65/100 - 🟡 AT RISK

**Factors:**
- Burndown: -15 points (5 points behind ideal)
- Impediments: -15 points (2 open, 1 high severity)
- Scope: 0 points (stable)
- Capacity: -5 points (1 developer out sick)

**Risks:**
- IMP-001 blocking 8 points (3 days open)
- Behind schedule by 1.5 days
- Reduced capacity this week

**Recommendations:**
1. Resolve IMP-001 urgently today
2. Consider descoping lowest priority item (5 points)
3. Focus on highest value items first
4. Re-assess tomorrow after impediment resolution

**Forecast:** 60% chance of achieving Sprint Goal
```

---

### Step 7: Identify Action Items

Based on team updates, impediments, and Sprint health, identify immediate actions:

```markdown
## Daily Actions

### Impediments to Resolve (Priority)
1. **IMP-XXX:** [Description] - Assigned to: @[owner] - Target: [date]
2. **IMP-YYY:** [Description] - Assigned to: @[owner] - Target: [date]

### Blockers Needing Escalation
- [Blocker 1] - Escalate to: [Manager/PO/External]

### Coordination Needed
- @[member-A] and @[member-B]: Pair on [PBI-XXX]
- @[member-C]: Get PO clarification on [PBI-YYY]

### Scope Adjustments (If Needed)
- Consider descoping: [PBI-ZZZ] ([X] points)
- Reason: [Sprint health, impediments, etc.]

### Follow-ups
- [Action 1] - Owner: @[person] - By: [time]
- [Action 2] - Owner: @[person] - By: [time]
```

---

### Step 8: Generate Daily Summary

Create a concise Daily Standup summary:

```markdown
# Daily Standup Summary
**Sprint [X], Day [Y] of [Z]**
**Date:** [YYYY-MM-DD]
**Duration:** [X] minutes

## Sprint Goal
"[Sprint Goal text]"

## Progress
- **Committed:** [A] points
- **Completed:** [B] points ([C]%)
- **Remaining:** [D] points
- **In Progress:** [E] items
- **To Do:** [F] items

## Yesterday's Achievements
- ✅ Completed: [PBI-XXX] ([X] points)
- ✅ Completed: [Task A], [Task B]
- 🏗️  Progress on: [PBI-YYY] (50% done)

## Today's Plan
- **@[member-1]:** Working on [PBI-XXX]
- **@[member-2]:** Finishing [PBI-YYY], starting [PBI-ZZZ]
- **@[member-3]:** Resolving impediment, then [Task A]

## Impediments
1. **IMP-XXX:** [Description] - [Status] - Owner: @[person]
2. **IMP-YYY:** [Description] - [Status] - Owner: @[person]

**New Today:** [X new impediments]
**Resolved:** [Y impediments resolved]

## Burndown Status
```
[ASCII burndown chart]
```

**Variance:** [±X] points from ideal
**Trend:** [Improving/Stable/Declining]
**Forecast:** [Y] points by Sprint end ([Z]% of commitment)

## Sprint Health
**Status:** [🟢 Healthy / 🟡 At Risk / 🔴 Critical]
**Score:** [X]/100

**Risks:**
- [Risk 1]
- [Risk 2]

**Actions:**
- [Action 1]
- [Action 2]

## Next Steps
- Continue working toward Sprint Goal
- Address impediments: [IMP-XXX]
- Next Daily Standup: [Tomorrow at same time]

---
**Sprint Backlog:** .scrum/sprints/sprint-[X]/backlog.json
**Health Tracking:** .scrum/metrics/sprint-health.json
```

---

### Step 9: Save & Distribute Summary

**Checklist:**
- [x] Sprint Backlog updated with today's progress
- [x] Burndown chart updated with Day [Y] data point
- [x] New impediments logged
- [x] Sprint health assessed and recorded
- [x] Daily summary generated
- [x] Action items identified and assigned

**Save summary to:** `.scrum/sprints/sprint-[X]/daily-standup-day-[Y].md`

---

## Integration Points

### Agents Used
1. **sprint-manager** - Load Sprint context, update Sprint Backlog
2. **impediment-resolver** - Log and track impediments
3. **scrum-metrics-analyzer** - Update burndown, assess Sprint health
4. **todo-manager** - Update individual tasks and work items

### Data Files
- **Read:**
  - `.scrum/sprints/sprint-[X]/backlog.json` - Current Sprint Backlog
  - `.scrum/sprints/sprint-[X]/impediments.json` - Existing impediments
  - `.scrum/metrics/sprint-health.json` - Previous health data

- **Write:**
  - `.scrum/sprints/sprint-[X]/backlog.json` - Updated with progress
  - `.scrum/sprints/sprint-[X]/impediments.json` - New impediments
  - `.scrum/metrics/sprint-health.json` - Today's health assessment
  - `.scrum/sprints/sprint-[X]/daily-standup-day-[Y].md` - Summary

---

## Best Practices

### DO:
✅ Start exactly on time (builds discipline)
✅ Timebox strictly to 15 minutes (not a status meeting)
✅ Focus on Sprint Goal (keep it relevant)
✅ Stand up (keeps energy high, meeting short)
✅ Update burndown daily (track progress)
✅ Log impediments immediately (don't wait)
✅ Keep it a team sync (not a report-out to Scrum Master)
✅ Take detailed discussions offline (parking lot)

### DON'T:
❌ Let it turn into a status report to manager
❌ Go over 15 minutes (loses effectiveness)
❌ Solve problems in the standup (take offline)
❌ Skip standup because "nothing changed" (rhythm matters)
❌ Let one person dominate (everyone speaks briefly)
❌ Update tools instead of talking (human sync first)
❌ Forget to update burndown (loses visibility)
❌ Ignore impediments (they compound)

---

## Facilitation Tips

### For Scrum Master
1. **Timekeeping:** Strict 15-minute timebox
2. **Focus:** Redirect off-topic discussions to parking lot
3. **Impediments:** Capture all blockers, follow up after
4. **Engagement:** Ensure everyone speaks (no silent observers)
5. **Energy:** Keep it energetic and focused
6. **Data:** Ensure burndown and Sprint Backlog updated

### For Development Team
1. **Preparation:** Know your update before standup
2. **Brevity:** 2-3 minutes per person maximum
3. **Honesty:** Report real status, impediments
4. **Focus:** Answer the three questions directly
5. **Collaboration:** Listen for coordination opportunities
6. **Commitment:** Update your tasks after standup

### For Product Owner (Optional Attendance)
1. **Listen:** Understand team progress and challenges
2. **Available:** Answer clarifying questions if present
3. **Brief:** Don't dominate or redirect (team's meeting)
4. **Supportive:** Help unblock if possible

---

## Common Patterns

### Pattern: Behind Schedule
**Symptoms:**
- Burndown above ideal line
- Variance increasing daily
- Sprint health: 🟡 At Risk or 🔴 Critical

**Actions:**
1. Identify root cause (impediments, over-commitment, scope creep)
2. Consider descoping lowest priority items
3. Increase collaboration (pair programming, swarming)
4. Escalate persistent impediments
5. Re-forecast and communicate to Product Owner

### Pattern: Ahead of Schedule
**Symptoms:**
- Burndown below ideal line
- All items progressing well
- Sprint health: 🟢 Healthy

**Actions:**
1. Celebrate progress!
2. Don't add scope mid-Sprint (finish committed work first)
3. Focus on quality and Definition of Done
4. Offer to help teammates if capacity available
5. Prepare for Sprint Review demo

### Pattern: Many Impediments
**Symptoms:**
- Multiple impediments reported
- Same impediments recurring
- Sprint health declining

**Actions:**
1. Triage impediments by severity
2. Swarm on critical blockers
3. Escalate organizational impediments
4. Document patterns for Retrospective
5. Consider technical debt if recurring

### Pattern: Scope Creep
**Symptoms:**
- Items added mid-Sprint
- Scope increasing daily
- Original commitment at risk

**Actions:**
1. Protect Sprint commitment (no new scope)
2. Scrum Master shields team
3. Product Owner accepts scope changes only for next Sprint
4. Consider emergency descoping if Sprint Goal threatened
5. Discuss in Sprint Review and Retrospective

---

## Success Criteria

Daily Standup is successful when:
- [x] Completed within 15 minutes
- [x] All team members synchronized
- [x] Sprint Backlog updated with progress
- [x] Burndown chart reflects current status
- [x] Impediments identified and logged
- [x] Sprint health assessed
- [x] Team knows what to do next 24 hours
- [x] Focus maintained on Sprint Goal

---

## Quick Reference

### Three Questions Template
1. **Yesterday:** What did I complete?
2. **Today:** What will I work on?
3. **Blockers:** What's in my way?

### Timeboxing
- **Total:** 15 minutes
- **Per person:** 2-3 minutes
- **Context:** 1 minute (Sprint status)
- **Wrap-up:** 1 minute (actions, parking lot)

### Sprint Health Colors
- **🟢 Healthy:** 80-100 score, on track
- **🟡 At Risk:** 60-79 score, needs attention
- **🔴 Critical:** 0-59 score, Sprint Goal threatened

---

**Remember:** The Daily Scrum is for the Development Team to synchronize and plan. It's not a status report to management. Keep it focused, brief, and action-oriented. The goal is for the team to leave knowing exactly what they need to do in the next 24 hours to achieve the Sprint Goal.
