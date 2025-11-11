# Sprint Review Command

You are facilitating a Sprint Review - a collaborative working session where the Scrum Team and stakeholders inspect the Increment and adapt the Product Backlog.

## Overview

The Sprint Review is an informal meeting to:
- **Inspect** the Increment created during the Sprint
- **Demonstrate** working software to stakeholders
- **Collect feedback** and adapt the Product Backlog
- **Calculate velocity** for planning future Sprints
- **Celebrate** the team's achievements

**Timeboxed:** 4 hours for a 1-month Sprint (proportionally less for shorter Sprints)
- 2-week Sprint: 2 hours
- 1-week Sprint: 1 hour

**Participants:** Scrum Team (PO, SM, Dev Team) + Stakeholders

## Phase 1: Preparation (Before the Meeting)

### Step 1.1: Validate Increment Against Definition of Done

Use the **increment-validator** agent to validate all completed work:

```
Validate Sprint [X] Increment against Definition of Done:

For each item marked "Done":
1. Run automated DoD checks (tests, coverage, security, build)
2. Verify manual DoD criteria (code review, docs, accessibility)
3. Validate all acceptance criteria met
4. Confirm Product Owner acceptance received
5. Check deployment to staging/production

Load from: .scrum/sprints/sprint-[X]/backlog.json
Reference: .scrum/definition-of-done.md

Provide:
- Validation report for each item
- Overall DoD compliance summary
- Items meeting DoD vs items not meeting DoD
- Known issues or limitations
- Recommendation: Ready for Sprint Review? (Yes/No)
```

**Expected Output:**
```markdown
## Increment Validation Report

**Items Meeting DoD:** 4 of 5 (80%)
**Items NOT Meeting DoD:** 1 item (security issue)

✅ PBI-002: Bulk product tagging (5 pts) - DONE
✅ PBI-006: Tag management UI (8 pts) - DONE
✅ PBI-007: Tag validation logic (5 pts) - DONE
✅ PBI-009: Error handling (10 pts) - DONE
❌ PBI-004: Product sync (3 pts) - FAILED (security scan)

**Recommendation:** ✅ Ready for Sprint Review (demo 4 items)
```

### Step 1.2: Prepare Demo

Use the **increment-validator** agent to create demo plan:

```
Generate Sprint Review demo plan for Sprint [X]:

For each completed item (meeting DoD):
1. Demo scenario (user story to demonstrate)
2. Acceptance criteria to show
3. Key features to highlight
4. Edge cases or error handling
5. Demo sequence and timing

Create engaging demo script that:
- Shows business value (not just technical features)
- Demonstrates acceptance criteria validation
- Flows logically from item to item
- Fits within time constraints

Output demo checklist and script.
```

**Demo Plan Example:**
```markdown
## Demo Plan (15 minutes total)

### 1. PBI-002: Bulk Product Tagging (3 min)
**Scenario:** Merchant tags 100 products for "Summer Sale"
- Select 100 products in admin
- Apply "Summer Sale" tag
- Show performance (<5 seconds)
- Verify tags appear on products

### 2. PBI-006: Tag Management UI (3 min)
**Scenario:** Merchant manages tag library
- Create new tag "Clearance"
- Edit existing tag
- Delete obsolete tag
- Show tag usage counts

[... continue for all items ...]
```

### Step 1.3: Calculate Sprint Metrics

Use the **scrum-metrics-analyzer** agent:

```
Calculate Sprint [X] final metrics:

Velocity:
- Committed story points: [X]
- Completed story points: [Y]
- Velocity: [Y points]
- Completion rate: [Y/X]%

Sprint Performance:
- Sprint Goal achieved? (Yes/No)
- Items completed: [Z items]
- Items deferred: [A items]
- Scope changes: [added/removed]

Historical Comparison:
- Previous Sprint velocity: [B points]
- Average velocity (last 5 Sprints): [C points]
- Trend: [Improving/Stable/Declining]

Update: .scrum/metrics/velocity-history.json
```

---

## Phase 2: Sprint Review Meeting

### Step 2.1: Opening (5 minutes)

**Scrum Master welcomes everyone and sets context:**

Use the **sprint-manager** agent:

```
Generate Sprint Review opening:

Sprint Context:
- Sprint number: [X]
- Sprint Goal: "[goal text]"
- Sprint duration: [Y days]
- Team size: [Z developers]

Commitment:
- Story points committed: [A points]
- Items committed: [B items]

Outcomes:
- Story points completed: [C points] ([D]%)
- Items completed: [E items]
- Sprint Goal achieved: [Yes/No]

Participants:
- Scrum Team: [list]
- Stakeholders: [list]

Provide welcome message and Sprint summary.
```

**Opening Script:**
```markdown
# Sprint [X] Review

Welcome everyone! Thank you for joining us.

## Sprint Goal
"[Sprint Goal text]"

## Sprint Summary
- **Duration:** [X] days ([Start] to [End])
- **Commitment:** [Y] points, [Z] items
- **Delivered:** [A] points ([B]%), [C] items
- **Sprint Goal:** ✅ Achieved / ❌ Not Achieved

Today we'll:
1. Demo the working Increment (15 min)
2. Collect your feedback (15 min)
3. Review metrics and adapt backlog (10 min)
4. Discuss next steps (5 min)

Let's start with the demo!
```

### Step 2.2: Demonstration (15-20 minutes)

**Product Owner and Development Team demo the Increment:**

For each completed item, follow the demo plan:

```markdown
## Demo: [PBI-XXX Title]

**User Story:**
As a [role]
I want [feature]
So that [benefit]

**Demo Scenario:**
[Step-by-step demonstration]

**Acceptance Criteria Validated:**
✅ [Criterion 1]
✅ [Criterion 2]
✅ [Criterion 3]

**Key Features:**
- [Feature 1]
- [Feature 2]

[LIVE DEMO]

**Questions?**
[Pause for stakeholder questions]
```

**Demo Tips:**
- Show working software (not slides or mockups)
- Focus on business value (not technical implementation)
- Demonstrate acceptance criteria validation
- Show error handling and edge cases
- Invite stakeholder interaction (let them try it!)
- Keep it engaging and fast-paced

### Step 2.3: Feedback Collection (15-20 minutes)

**Facilitate stakeholder feedback:**

```markdown
## Feedback Questions

**For each demonstrated feature:**

1. **Does this meet your expectations?**
   - What did you like?
   - What surprised you?
   - What's missing?

2. **How would you improve this?**
   - What changes would you make?
   - What features would you add?
   - What would you prioritize differently?

3. **Does this deliver the expected value?**
   - Will this solve the user's problem?
   - Is this ready for release?
   - What's the impact on your business/users?

4. **What should we build next?**
   - What's the highest priority now?
   - Any new requirements discovered?
   - Market changes or competitive pressures?
```

**Capture feedback using product-owner agent:**

```
Record Sprint Review feedback:

For each feedback item:
- Feedback: [description]
- From: [stakeholder name/role]
- Type: [enhancement/bug/new feature/change]
- Priority: [high/medium/low]
- Impact: [users affected, business value]

Classify feedback:
- Immediate (add to Product Backlog top)
- Next Sprint (consider for Sprint Planning)
- Backlog (add as lower priority)
- Defer (not aligned with Product Goal)

Update Product Backlog based on feedback.
```

### Step 2.4: Metrics Review (10 minutes)

Use the **scrum-metrics-analyzer** agent to present Sprint metrics:

```
Generate Sprint [X] Metrics Report:

### Velocity & Completion
- Velocity chart (last 5 Sprints)
- Completion rate trend
- Predictability assessment

### Burndown Analysis
- Final burndown chart
- Variance analysis
- Sprint health over time

### Quality Metrics
- Test coverage: [X]%
- Bugs found: [Y]
- Definition of Done compliance: [Z]%

### Cycle Time
- Average cycle time: [A] days
- Lead time: [B] days
- Flow efficiency: [C]%

### Impediments
- Total impediments: [D]
- Average resolution time: [E] days
- Recurring patterns

Provide insights and trends for stakeholders.
```

**Metrics Presentation:**
```markdown
## Sprint [X] Metrics

### Velocity
```
Sprint | Velocity | Commitment | Rate
-------|----------|------------|------
  1    |    31    |     34     | 91%
  2    |    28    |     32     | 88%
  3    |    34    |     35     | 97%
  4    |    25    |     33     | 76%
  5    |    32    |     34     | 94%
```

**Average Velocity:** 30 points/Sprint
**Predictability:** High (88% avg completion)

### Quality
- **Test Coverage:** 86% (target: 80%) ✅
- **Bugs:** 0 critical, 2 minor
- **DoD Compliance:** 80% (4 of 5 items)

### Insights
1. Velocity stable and predictable
2. Quality metrics strong
3. One security issue found (addressed next Sprint)
4. Team capacity well-utilized (78%)
```

### Step 2.5: Product Backlog Adaptation (10-15 minutes)

Use the **product-owner** agent to adapt Product Backlog:

```
Update Product Backlog based on:
1. Sprint Review feedback
2. New discoveries during Sprint
3. Market changes or new requirements
4. Completed items (remove from backlog)
5. Deferred items (re-prioritize)

Actions:
- Add new items from feedback
- Reprioritize existing items
- Update item descriptions/acceptance criteria
- Remove completed items
- Split large items if needed

Provide:
- Updated Product Backlog (top 20 items)
- Changes made (added/removed/re-prioritized)
- Recommended focus for next Sprint
```

**Backlog Update Summary:**
```markdown
## Product Backlog Updates

### Items Completed (Removed from Backlog)
✅ PBI-002, PBI-006, PBI-007, PBI-009, PBI-010

### Items Added (from feedback)
🆕 PBI-011: Tag analytics dashboard (feedback from Marketing)
🆕 PBI-012: Bulk tag removal (user request)
🆕 PBI-013: Tag export to CSV (ops team need)

### Items Re-prioritized
⬆️ PBI-004: Product sync (security fix - now #1 priority)
⬇️ PBI-005: Advanced filtering (deferred to Sprint 5)

### Updated Top 5 Priorities
1. PBI-004: Product sync timeout (HIGH - security)
2. PBI-011: Tag analytics dashboard (NEW)
3. PBI-008: Bulk inventory updates
4. PBI-012: Bulk tag removal (NEW)
5. PBI-014: Product search improvements
```

---

## Phase 3: Sprint Summary & Next Steps

### Step 3.1: Generate Sprint Summary

Use the **sprint-manager** agent:

```
Generate comprehensive Sprint [X] Summary:

Include:
1. Sprint Goal and achievement status
2. Commitment vs delivery
3. Completed items with business value
4. Metrics (velocity, quality, cycle time)
5. Impediments encountered and resolved
6. Lessons learned
7. Stakeholder feedback summary
8. Product Backlog updates
9. Forecast for next Sprint

Format as executive summary for distribution.
```

**Sprint Summary Example:**
```markdown
# Sprint [X] Summary

**Sprint Goal:** "[goal text]"
**Status:** ✅ ACHIEVED

## Delivery
- **Committed:** 34 points, 5 items
- **Delivered:** 31 points, 4 items (91%)
- **Sprint Goal:** ✅ Achieved

## What We Built
1. **Bulk Product Tagging** (5 pts)
   - Merchants can tag 100+ products instantly
   - Performance: <5 seconds for 100 products
   - **Value:** Saves 30 minutes per tagging session

2. **Tag Management UI** (8 pts)
   - Intuitive interface for tag library management
   - Create, edit, delete tags with validation
   - **Value:** Streamlines merchant workflow

3. **Tag Validation** (5 pts)
   - Prevents invalid tag names
   - Clear error messages
   - **Value:** Reduces data quality issues

4. **Error Handling** (10 pts)
   - User-friendly error messages
   - Retry functionality
   - **Value:** Better user experience

## Metrics
- **Velocity:** 31 points (avg: 30 points)
- **Quality:** 86% test coverage, 0 critical bugs
- **Cycle Time:** 3.3 days average

## Stakeholder Feedback
- ✅ Very positive on tag management UI
- 🆕 Request for tag analytics (added to backlog)
- 🆕 Request for bulk tag removal (added to backlog)

## Next Sprint Focus
1. Fix PBI-004 security issue (high priority)
2. Implement tag analytics dashboard
3. Continue with inventory management features

---
**Team:** Great work this Sprint! 🎉
**Stakeholders:** Thank you for your valuable feedback!
```

### Step 3.2: Celebrate Achievements

**Take time to celebrate what the team accomplished:**

```markdown
## 🎉 Sprint [X] Celebrations

### Wins
- ✅ Achieved Sprint Goal!
- 🚀 Delivered 4 high-value features
- 📈 91% completion rate (above average)
- 🏆 86% test coverage (exceeded target)
- 🎯 Zero critical bugs
- 💪 Resolved 5 impediments quickly

### Shout-outs
- **@remix-expert:** Excellent work on tag UI (great UX!)
- **@mongodb-expert:** Performance optimization (sub-5s for 100 products!)
- **@shopify-api-expert:** Solid error handling implementation
- **Team:** Great collaboration and focus!

### Stakeholder Praise
"The tag management UI is exactly what we needed!" - Marketing Team
"Performance is impressive - merchants will love this!" - Product Manager
```

### Step 3.3: Next Steps & Closing

**Scrum Master wraps up:**

```markdown
## Next Steps

### Immediate
1. **Product Owner:** Update Product Backlog with feedback
2. **Team:** Prepare for Sprint Retrospective tomorrow
3. **Scrum Master:** Schedule next Sprint Planning

### Upcoming Events
- **Sprint Retrospective:** [Date/Time]
  - Reflect on Sprint process
  - Identify improvements
  - Celebrate wins

- **Next Sprint Planning:** [Date/Time]
  - Plan Sprint [X+1]
  - Commit to next iteration

### Before Next Sprint
- [ ] Product Backlog refined and prioritized
- [ ] Top items have Definition of Ready
- [ ] Team capacity known for next Sprint
- [ ] Impediments from this Sprint resolved

---

**Thank you all for participating!**

Questions? Reach out to:
- Product Owner: [contact]
- Scrum Master: [contact]
```

---

## Phase 4: Post-Review Actions

### Step 4.1: Update Velocity History

Use the **scrum-metrics-analyzer** agent:

```
Record Sprint [X] velocity:

Data:
- Sprint number: [X]
- End date: [YYYY-MM-DD]
- Committed points: [Y]
- Completed points: [Z]
- Velocity: [Z]
- Completion rate: [Z/Y]%
- Items completed: [A]
- Items deferred: [B]
- Sprint Goal achieved: [Yes/No]

Add to velocity history: .scrum/metrics/velocity-history.json

Calculate rolling averages:
- Last 3 Sprints
- Last 5 Sprints
- All time

Update team capacity with new average velocity.
```

### Step 4.2: Close Sprint Backlog

Use the **sprint-manager** agent:

```
Finalize Sprint [X] Backlog:

Mark Sprint as complete:
- Status: "completed"
- End date: [YYYY-MM-DD]
- Final velocity: [X points]
- Sprint Goal status: [achieved/not achieved]

Archive Sprint data:
- Move completed items to history
- Move deferred items to Product Backlog
- Update item statuses
- Generate final burndown chart

Save to: .scrum/sprints/sprint-[X]/backlog.json (finalized)
```

### Step 4.3: Generate Release Notes (If Releasing)

If the Increment is being released to production, use the **increment-validator** agent:

```
Generate release notes for Sprint [X] Increment:

Include:
- New features (user-facing)
- Bug fixes
- Performance improvements
- Breaking changes (if any)
- Known issues
- Upgrade notes
- Contributors

Format for end users (non-technical language).

Save to: .scrum/sprints/sprint-[X]/release-notes.md
```

### Step 4.4: Save All Artifacts

**Checklist:**
- [x] Increment validation report
- [x] Demo recording/screenshots (optional)
- [x] Stakeholder feedback captured
- [x] Product Backlog updated
- [x] Velocity recorded
- [x] Sprint Summary generated
- [x] Sprint Backlog finalized
- [x] Release notes created (if releasing)

---

## Integration Points

### Agents Used
1. **increment-validator** - DoD validation, demo prep, release notes
2. **sprint-manager** - Sprint context, Sprint Summary, finalization
3. **scrum-metrics-analyzer** - Velocity calculation, burndown, trends
4. **product-owner** - Feedback capture, Backlog adaptation

### Data Files
- **Read:**
  - `.scrum/sprints/sprint-[X]/backlog.json` - Sprint Backlog
  - `.scrum/definition-of-done.md` - Quality criteria
  - `.scrum/metrics/velocity-history.json` - Historical data

- **Write:**
  - `.scrum/metrics/velocity-history.json` - Updated velocity
  - `.scrum/product-backlog.json` - Updated with feedback
  - `.scrum/sprints/sprint-[X]/backlog.json` - Finalized
  - `.scrum/sprints/sprint-[X]/sprint-summary.md` - Summary
  - `.scrum/sprints/sprint-[X]/release-notes.md` - Release notes

---

## Best Practices

### DO:
✅ Demo working software (not slides or promises)
✅ Invite real stakeholders (get real feedback)
✅ Focus on business value (not technical details)
✅ Encourage interaction (let stakeholders try it)
✅ Adapt Product Backlog based on feedback
✅ Celebrate achievements (recognize team effort)
✅ Be transparent about what wasn't completed
✅ Look forward (what's next?)

### DON'T:
❌ Make it a formal presentation (it's collaborative)
❌ Demo incomplete work (only Done items)
❌ Ignore stakeholder feedback (defeats the purpose)
❌ Blame team for unmet commitments (inspect and adapt)
❌ Skip Sprint Review because "nothing to show" (show something!)
❌ Turn it into Sprint Retrospective (process discussion comes later)
❌ Let it run over time (respect timebox)
❌ Forget to update Product Backlog (feedback must be captured)

---

## Success Criteria

Sprint Review is successful when:
- [x] Working Increment demonstrated to stakeholders
- [x] Stakeholder feedback collected and captured
- [x] Product Backlog adapted based on feedback
- [x] Velocity calculated and recorded
- [x] Sprint Summary generated and distributed
- [x] Team feels recognized for their work
- [x] Stakeholders understand progress and next steps
- [x] Transparency maintained (show real progress)

---

## Common Scenarios

### Scenario: Didn't Meet Sprint Goal
**What to do:**
1. Be transparent: Explain what happened and why
2. Demo what WAS completed (show progress)
3. Discuss impediments and challenges
4. Adapt: Adjust approach for next Sprint
5. Learn: Feed insights to Sprint Retrospective

**What NOT to do:**
- Don't blame the team
- Don't make excuses
- Don't hide the problem

### Scenario: Stakeholder Requests Major Change
**What to do:**
1. Capture the feedback
2. Discuss impact on Product Goal
3. Product Owner prioritizes in Product Backlog
4. Plan for future Sprint (not mid-Sprint change)
5. Explain trade-offs and dependencies

### Scenario: No Stakeholders Show Up
**What to do:**
1. Still conduct the review (team inspects Increment)
2. Record demo for stakeholders to watch
3. Follow up individually for feedback
4. Scrum Master: Investigate why attendance was low
5. Improve stakeholder engagement for next time

---

**Remember:** Sprint Review is about inspecting the Increment and adapting the Product Backlog. It's a collaborative working session, not a formal approval meeting. The goal is to get feedback, adapt the plan, and ensure we're building the right thing. Keep it informal, engaging, and focused on delivering value!
