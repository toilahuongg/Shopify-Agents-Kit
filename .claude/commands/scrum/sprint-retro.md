# Sprint Retrospective Command

You are facilitating a Sprint Retrospective - a meeting for the Scrum Team to inspect itself and create a plan for improvements to be enacted during the next Sprint.

## Overview

The Sprint Retrospective is the team's opportunity to:
- **Reflect** on how the Sprint went regarding people, relationships, process, and tools
- **Identify** what went well and what could be improved
- **Create** 1-3 actionable improvement items for the next Sprint
- **Celebrate** wins and learn from challenges

**Timeboxed:** 3 hours for a 1-month Sprint (proportionally less for shorter Sprints)
- 2-week Sprint: 1.5 hours
- 1-week Sprint: 45 minutes

**Participants:** Scrum Team only (Product Owner, Scrum Master, Development Team)
**Rule:** Safe space - what's said in Retro stays in Retro

## Preparation (Before the Meeting)

### Step 1: Gather Sprint Data

Use the **scrum-metrics-analyzer** agent to collect Sprint data:

```
Gather Sprint [X] data for Retrospective:

### Performance Metrics
- Velocity: [X points]
- Completion rate: [Y%]
- Sprint Goal achieved: [Yes/No]
- Burndown variance: [±Z points]
- Sprint health trend: [chart or summary]

### Quality Metrics
- Test coverage: [A%]
- Bugs introduced: [B count]
- Definition of Done compliance: [C%]
- Code review feedback: [summary]

### Cycle Time
- Average cycle time: [D days]
- Lead time: [E days]
- Flow efficiency: [F%]
- Bottlenecks identified: [list]

### Impediments
- Total impediments: [G]
- Average resolution time: [H days]
- Recurring impediments: [list]
- Patterns identified: [summary]

Load from:
- .scrum/sprints/sprint-[X]/backlog.json
- .scrum/metrics/velocity-history.json
- .scrum/sprints/sprint-[X]/impediments.json
- .scrum/metrics/sprint-health.json
```

### Step 2: Review Previous Retrospective Actions

Use the **scrum-master** agent (or read directly):

```
Review action items from previous Retrospective:

Load from: .scrum/retrospectives/sprint-[X-1]-retro.md

For each action item:
- Action: [description]
- Owner: [person]
- Status: [completed/in-progress/not-started]
- Outcome: [what happened]
- Impact: [did it help?]

Provide summary:
- Actions completed: [X of Y]
- Actions with positive impact: [list]
- Actions that didn't work: [list]
- Actions to continue: [list]
```

### Step 3: Select Retrospective Format

**Choose a format based on team preference and Sprint context:**

**Common Formats:**

1. **Start-Stop-Continue** (Simple, good for new teams)
   - Start: What should we start doing?
   - Stop: What should we stop doing?
   - Continue: What should we keep doing?

2. **Mad-Sad-Glad** (Focus on emotions)
   - Mad: What made you frustrated?
   - Sad: What disappointed you?
   - Glad: What made you happy?

3. **4 Ls** (Balanced reflection)
   - Liked: What went well?
   - Learned: What did we discover?
   - Lacked: What was missing?
   - Longed for: What do we wish we had?

4. **Sailboat** (Visual metaphor)
   - Wind: What helped us move forward?
   - Anchor: What held us back?
   - Rocks: What risks do we face?
   - Island: What's our goal?

5. **Timeline** (Chronological events)
   - Plot Sprint events on timeline
   - Mark highs and lows
   - Discuss patterns

**Recommendation:** Rotate formats to keep Retrospectives fresh and engaging.

---

## Phase 1: Set the Stage (5-10 minutes)

### Step 1.1: Welcome & Context

**Scrum Master sets the tone:**

```markdown
# Sprint [X] Retrospective

Welcome to our Sprint Retrospective!

## Purpose
Reflect on our Sprint and identify improvements for next time.

## Ground Rules
1. **Safe Space:** What's said here stays here
2. **Focus on Process:** Not blaming people
3. **Everyone Participates:** All voices matter
4. **Be Constructive:** Criticize ideas, not people
5. **Action-Oriented:** End with concrete improvements

## Sprint Context
- **Sprint Goal:** "[goal]"
- **Outcome:** [Achieved/Not Achieved]
- **Velocity:** [X points] ([Y%] of commitment)
- **Duration:** [Z days]

## Today's Format
We'll use **[chosen format]** to structure our discussion.

Let's get started!
```

### Step 1.2: Check-In Activity

**Quick temperature check (optional but recommended):**

```markdown
## Check-In: How was this Sprint for you?

Rate on scale of 1-5:
1 = Very difficult / frustrating
2 = Challenging
3 = Neutral / OK
4 = Good
5 = Great / Energizing

@[member-1]: [rating] - [brief why]
@[member-2]: [rating] - [brief why]
@[member-3]: [rating] - [brief why]
@[member-4]: [rating] - [brief why]

Average: [X]/5
```

---

## Phase 2: Gather Data (15-20 minutes)

### Step 2.1: Present Sprint Data

Use **scrum-metrics-analyzer** output from preparation:

```markdown
## Sprint [X] By the Numbers

### Delivery
- Committed: [X] points, [Y] items
- Delivered: [A] points ([B]%), [C] items
- Sprint Goal: [✅ Achieved / ❌ Not Achieved]

### Burndown
[ASCII burndown chart]

Trend: [On track/Behind/Ahead]
Variance: [±X points]

### Quality
- Test Coverage: [X%] (target: 80%)
- Bugs: [Y critical], [Z minor]
- DoD Compliance: [A%]

### Impediments
- Total: [B impediments]
- Critical: [C]
- Average Resolution: [D days]
- Recurring: [list top 3]

### Cycle Time
- Average: [E days]
- Shortest: [F days]
- Longest: [G days]
```

### Step 2.2: Brainstorm (Using Chosen Format)

**Example: Using "Start-Stop-Continue" format**

**Prompt each team member:**

```markdown
## Brainstorming: Start-Stop-Continue

Take 5 minutes to individually write:

### START
What should we **START** doing next Sprint?
- New practices, tools, or approaches
- Things we've been avoiding
- Experiments to try

### STOP
What should we **STOP** doing?
- Wasteful activities
- Things that don't add value
- Bad habits or anti-patterns

### CONTINUE
What should we **CONTINUE** doing?
- Things that worked well
- Practices we want to keep
- Wins to celebrate

---

**Everyone:** Write your items (silently for 5 minutes)
Then we'll share and discuss.
```

**Alternative: "Mad-Sad-Glad" format**

```markdown
## Brainstorming: Mad-Sad-Glad

### MAD
What made you **frustrated or angry** this Sprint?
- Blockers that wasted time
- Process inefficiencies
- Technical frustrations

### SAD
What **disappointed** you?
- Missed opportunities
- Things that didn't go as planned
- Unmet expectations

### GLAD
What made you **happy or proud**?
- Accomplishments
- Good collaboration
- Learning moments

---

Take 5 minutes to write your items.
```

---

## Phase 3: Generate Insights (20-30 minutes)

### Step 3.1: Share & Group Insights

**Facilitate sharing:**

```markdown
## Sharing Time

Each person shares their items (2 minutes per person).

As items are shared:
- Note on shared board/document
- Group similar items together
- Look for patterns and themes

No discussion yet - just capture all ideas.
```

**Example Output:**
```markdown
## Gathered Insights (Start-Stop-Continue)

### START
- **Pair programming on complex stories** (mentioned by 3 people)
- Automated security scans in CI/CD
- Pre-Sprint backlog review
- Weekly tech talks / knowledge sharing
- Earlier PO involvement in technical decisions

### STOP
- **Late-day meetings** (mentioned by 4 people)
- Adding scope mid-Sprint
- Skipping code review for "small" changes
- Leaving technical debt for "later"
- Context-switching between multiple PBIs

### CONTINUE
- **Daily Standups at 9am** (everyone likes it)
- Mob programming on architectural decisions
- Celebrating wins in Sprint Review
- Good documentation practices
- Fast impediment resolution
```

### Step 3.2: Discussion & Prioritization

**Facilitate discussion on grouped items:**

```markdown
## Discussion

For each grouped theme, discuss:

1. **Why is this an issue/opportunity?**
   - What's the root cause?
   - How does it impact our work?
   - Is this a symptom or the real problem?

2. **What's the impact?**
   - How much does this affect our Sprint?
   - Who does this impact most?
   - What's the cost of not addressing this?

3. **What could we do about it?**
   - What experiments could we try?
   - What changes would help?
   - What's within our control?

4. **Priority?**
   - High: Major impact, must address
   - Medium: Important, should address
   - Low: Nice to have, if time permits
```

**Dot Voting (Optional):**
```markdown
## Prioritization: Dot Voting

Each person gets 3 votes.
Vote for items you think are most important to address.

[After voting]

Top 5 Priorities:
1. **Pair programming on complex stories** (8 votes)
2. **Stop late-day meetings** (7 votes)
3. **Pre-Sprint backlog review** (5 votes)
4. **Stop mid-Sprint scope changes** (4 votes)
5. **Weekly knowledge sharing** (3 votes)
```

---

## Phase 4: Decide What to Do (15-20 minutes)

### Step 4.1: Create Action Items

**For top 2-3 priorities, create SMART action items:**

SMART Actions are:
- **S**pecific: Clear and concrete
- **M**easurable: Can verify it's done
- **A**chievable: Realistic within one Sprint
- **R**elevant: Addresses the issue
- **T**ime-bound: Completed by next Retro

**Template:**
```markdown
## Action Item [#]: [Title]

**Problem:** [What problem does this solve?]

**Action:** [Specific action to take]

**Owner:** @[person responsible]

**Success Criteria:** [How will we know it worked?]

**Deadline:** [When will this be done?]

**Measurement:** [How will we measure impact?]

---

### Example:

## Action Item 1: Implement Pairing for Complex Stories

**Problem:** Complex stories take longer and have more bugs. Knowledge is siloed.

**Action:** For any story ≥8 points, assign two developers to pair program.

**Owner:** @scrum-master (to enforce) + whole team (to execute)

**Success Criteria:**
- All stories ≥8 points are paired in next Sprint
- Pair feedback collected in next Retro
- Measure: Cycle time for complex stories (should decrease)

**Deadline:** Implement in Sprint [X+1], review in next Retro

**Measurement:**
- Count of paired stories
- Cycle time comparison (Sprint X vs Sprint X+1)
- Qualitative feedback from team

---

## Action Item 2: Eliminate Late-Day Meetings

**Problem:** Meetings after 4pm disrupt flow and reduce focus time.

**Action:** No team meetings scheduled after 3pm. Scrum Master to enforce.

**Owner:** @scrum-master (scheduling) + @team (decline late invites)

**Success Criteria:**
- Zero team meetings after 3pm in next Sprint
- Team reports more focus time in next Retro
- Measure: Calendar audit + team feedback

**Deadline:** Effective immediately (Sprint [X+1])

**Measurement:**
- Calendar review weekly
- Focus time survey in next Retro
```

### Step 4.2: Review Previous Actions

**Close the loop on previous Retrospective actions:**

```markdown
## Previous Retrospective Actions - Review

### From Sprint [X-1] Retrospective:

#### Action 1: Improve Definition of Ready
**Status:** ✅ COMPLETE
**Outcome:** Added DoR checklist, all items now reviewed before Sprint Planning
**Impact:** Positive - fewer mid-Sprint clarifications needed
**Decision:** ✅ CONTINUE this practice

#### Action 2: Automate Deployment to Staging
**Status:** ⏳ IN PROGRESS (80% done)
**Outcome:** CI/CD pipeline created, testing in progress
**Impact:** Neutral (not finished yet)
**Decision:** 🔄 CARRY FORWARD to next Sprint

#### Action 3: Weekly Team Lunch
**Status:** ❌ NOT STARTED
**Outcome:** Scheduling conflicts, never happened
**Impact:** None
**Decision:** ❌ DROP (not realistic with remote team)
```

---

## Phase 5: Close the Retrospective (5-10 minutes)

### Step 5.1: Summarize Actions

```markdown
## Sprint [X] Retrospective - Action Summary

We identified and will implement **[X] improvements** for Sprint [X+1]:

### Action 1: [Title]
- **What:** [Brief description]
- **Who:** @[owner]
- **By When:** [deadline]
- **Measure:** [how we'll know it worked]

### Action 2: [Title]
- **What:** [Brief description]
- **Who:** @[owner]
- **By When:** [deadline]
- **Measure:** [how we'll know it worked]

### Action 3: [Title] (if applicable)
- **What:** [Brief description]
- **Who:** @[owner]
- **By When:** [deadline]
- **Measure:** [how we'll know it worked]

---

### Celebrations 🎉
- [Win 1 to celebrate]
- [Win 2 to celebrate]
- [Win 3 to celebrate]

### Carried Forward from Last Retro
- [Action still in progress]

### Dropped from Last Retro
- [Action we decided not to pursue]
```

### Step 5.2: Retrospective Feedback (Meta-Retro)

**Quick feedback on the Retrospective itself:**

```markdown
## Retrospective Feedback

How was today's Retrospective? (1-5 scale)

1 = Waste of time
2 = Not very useful
3 = OK / Neutral
4 = Good
5 = Excellent

@[member-1]: [rating]
@[member-2]: [rating]
@[member-3]: [rating]
@[member-4]: [rating]

Average: [X]/5

**One thing to improve for next Retro:**
[Feedback from team]
```

### Step 5.3: Closing

**Scrum Master closes:**

```markdown
## Closing

Thank you all for your honesty and engagement!

### Key Takeaways
1. [Main insight 1]
2. [Main insight 2]
3. [Main insight 3]

### Commitments
We committed to [X] actions for Sprint [X+1]:
- [Action 1]
- [Action 2]
- [Action 3]

Let's implement these and review in our next Retrospective.

### Next Steps
- Actions start: Tomorrow (Sprint [X+1])
- Next Retrospective: [Date/Time]

**Remember:** Continuous improvement is everyone's responsibility!

---

See you at Sprint Planning! 🚀
```

---

## Post-Retrospective Actions

### Step 1: Document Retrospective

Save comprehensive Retrospective notes:

```
Create Retrospective documentation:

File: .scrum/retrospectives/sprint-[X]-retro.md

Include:
1. Sprint context (goal, metrics, outcome)
2. Format used
3. All insights gathered (raw data)
4. Discussion themes and patterns
5. Action items (full SMART format)
6. Previous action review
7. Celebrations
8. Attendance
9. Retro feedback

Ensure actions are trackable for next Retrospective.
```

**Example Document Structure:**
```markdown
# Sprint [X] Retrospective

**Date:** [YYYY-MM-DD]
**Duration:** [X] minutes
**Format:** Start-Stop-Continue
**Facilitator:** @scrum-master
**Participants:** @member-1, @member-2, @member-3, @member-4

## Sprint Context
- **Sprint Goal:** "[goal]"
- **Sprint Outcome:** [Achieved/Not Achieved]
- **Velocity:** [X points] ([Y]% of commitment)
- **Team Satisfaction:** [A]/5 average

## Sprint Data
[Metrics from scrum-metrics-analyzer]

## Insights Gathered

### START
- Pair programming on complex stories (8 votes)
- Pre-Sprint backlog review (5 votes)
- Automated security scans
- Weekly knowledge sharing (3 votes)

### STOP
- Late-day meetings (7 votes)
- Mid-Sprint scope changes (4 votes)
- Skipping code review for small changes
- Leaving technical debt

### CONTINUE
- Daily Standups at 9am (everyone)
- Mob programming on architecture
- Fast impediment resolution
- Good documentation

## Discussion Themes
1. **Developer Flow:** Late meetings disrupt focus
2. **Code Quality:** Pairing could improve complex stories
3. **Planning:** Better backlog prep reduces mid-Sprint chaos

## Action Items

### Action 1: Pair Programming for Complex Stories
[Full SMART action details]

### Action 2: No Meetings After 3pm
[Full SMART action details]

### Action 3: Pre-Sprint Backlog Review
[Full SMART action details]

## Previous Action Review
- Action from Sprint X-1: [Status and outcome]

## Celebrations
- Achieved Sprint Goal!
- Great collaboration this Sprint
- Fast impediment resolution

## Retrospective Feedback
- Rating: 4.2/5
- Improve: Spend more time on solutions, less on problems

---

**Next Retrospective:** Sprint [X+1] on [Date]
```

### Step 2: Add Actions to Sprint Backlog

Use **todo-manager** or **sprint-manager**:

```
Add Retrospective action items to Sprint [X+1]:

For each action:
- Create task in Sprint Backlog
- Link to Retrospective
- Assign owner
- Set deadline
- Add acceptance criteria

Mark as "retrospective-action" type.

Ensure actions are visible and tracked.
```

### Step 3: Share with Stakeholders (Optional)

**If appropriate, share summary with stakeholders:**

```markdown
## Sprint [X] Retrospective - Executive Summary

### What We Learned
- [Key insight 1]
- [Key insight 2]
- [Key insight 3]

### What We're Improving
1. **[Action 1 title]:** [Brief description]
2. **[Action 2 title]:** [Brief description]
3. **[Action 3 title]:** [Brief description]

### Expected Impact
- [Improvement expectation 1]
- [Improvement expectation 2]

---

*Full details available in Sprint Retrospective notes*
```

---

## Integration Points

### Agents Used
1. **scrum-metrics-analyzer** - Sprint metrics, impediment patterns
2. **impediment-resolver** - Impediment analysis
3. **sprint-manager** - Sprint context, action tracking
4. **scrum-master** - Facilitation, previous action review

### Data Files
- **Read:**
  - `.scrum/sprints/sprint-[X]/backlog.json` - Sprint data
  - `.scrum/metrics/velocity-history.json` - Historical metrics
  - `.scrum/sprints/sprint-[X]/impediments.json` - Impediments
  - `.scrum/retrospectives/sprint-[X-1]-retro.md` - Previous actions

- **Write:**
  - `.scrum/retrospectives/sprint-[X]-retro.md` - Retro notes
  - `.scrum/sprints/sprint-[X+1]/backlog.json` - Add action tasks

---

## Best Practices

### DO:
✅ Create a safe, blameless environment
✅ Focus on process and system, not people
✅ Limit to 2-3 actionable improvements
✅ Make actions SMART (specific, measurable, achievable)
✅ Review previous actions (close the loop)
✅ Celebrate wins (acknowledge good work)
✅ Rotate formats (keep it fresh)
✅ Ensure everyone participates

### DON'T:
❌ Skip Retrospectives (they're crucial for improvement)
❌ Blame individuals (focus on system)
❌ Create too many actions (max 3, focus on impact)
❌ Let actions be vague ("communicate better")
❌ Forget to follow up (actions must be tracked)
❌ Let it become a complaining session (be constructive)
❌ Rush through it (respect the timebox but don't cut short)
❌ Invite people outside the Scrum Team (safe space)

---

## Success Criteria

Sprint Retrospective is successful when:
- [x] All team members participated
- [x] Safe environment maintained
- [x] 2-3 concrete action items identified
- [x] Actions are SMART and assigned
- [x] Previous actions reviewed
- [x] Wins celebrated
- [x] Team leaves energized for next Sprint
- [x] Continuous improvement culture strengthened

---

**Remember:** The Sprint Retrospective is where the magic of continuous improvement happens. It's the team's opportunity to inspect and adapt their own process. Make it safe, make it constructive, and make it actionable. Small improvements every Sprint compound into major gains over time!
