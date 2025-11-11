# Scrum Agile System - Quick Start Guide

## 🚀 First Time Setup (5 minutes)

### Step 1: Initialize the System
```
/scrum:init
```
This will:
- Create all necessary directories and files
- Set up your team capacity
- Initialize metrics systems
- Prepare Sprint 1

### Step 2: Add Your First Backlog Items
Edit `.scrum/product-backlog.json` or use the orchestrator guidance.

### Step 3: Start Your First Sprint
```
/sprint-planning
```

---

## 📅 Daily Workflow

### Every Morning
```
/scrum:orchestrator
```

The orchestrator will:
- Show your current sprint status
- Remind you of daily standup
- Alert you to any issues
- Guide you to the next action

### Quick Status Check
```bash
# Sprint progress
cat .scrum/sprints/sprint-001/backlog.json | jq '.committedStoryPoints, .completedStoryPoints'

# Sprint health
cat .scrum/metrics/sprint-health.json | jq '.sprintHealthHistory[0].overallHealthScore'

# Velocity
cat .scrum/metrics/velocity.json | jq '.statistics.averageVelocity'
```

---

## 🎯 Command Cheat Sheet

| When | Command | Purpose |
|------|---------|---------|
| **New Project** | `/scrum:init` | Set up everything |
| **Daily** | `/scrum:orchestrator` | Get guidance |
| **Daily** | `/daily-standup` | Team sync |
| **Sprint Start** | `/sprint-planning` | Plan work |
| **Sprint End** | `/sprint-review` | Demo work |
| **Sprint End** | `/sprint-retro` | Improve |
| **As Needed** | `/backlog-refinement` | Refine stories |
| **As Needed** | `/story-estimation` | Estimate work |

---

## 📊 Quick Metrics

### View Velocity
```bash
cat .scrum/metrics/velocity.json | jq '.statistics'
```

### View Sprint Health
```bash
cat .scrum/metrics/sprint-health.json | jq '.sprintHealthHistory[0]'
```

### View Burndown
```bash
cat .scrum/metrics/burndown-charts.json | jq '.sprints[0].chartData'
```

---

## 🆘 Troubleshooting

### Run Tests
```bash
bash .scrum/tests/run-all-tests.sh
```

### View System Status
```bash
bash .scrum/show-summary.sh
```

### Re-initialize (Fresh Start)
```bash
# Backup first!
mv .scrum .scrum.backup
/scrum:init
```

---

## 💡 Pro Tips

1. **Start Every Day with Orchestrator**
   ```
   /scrum:orchestrator
   ```
   It knows what you should do next!

2. **Use Daily Standups Consistently**
   - Keeps burndown accurate
   - Identifies blockers early
   - Maintains team sync

3. **Monitor Sprint Health**
   Check `.scrum/metrics/sprint-health.json` daily

4. **Review Metrics After Each Sprint**
   Learn from velocity trends and adjust planning

5. **Keep Backlog Refined**
   Run `/backlog-refinement` regularly to stay prepared

---

## 📚 Learn More

- **Complete Guide**: `.scrum/README.md`
- **Full Documentation**: `.scrum/FINAL_SUMMARY.md`
- **All Docs**: `.scrum/INDEX.md`
- **Implementation**: `.scrum/IMPLEMENTATION_CHECKLIST.md`

---

## 🎯 Typical Sprint Cycle

```
Week 1:
  Day 1: /sprint-planning
  Day 2-5: /daily-standup (each day)

Week 2:
  Day 6-9: /daily-standup (each day)
  Day 10: /sprint-review
  Day 10: /sprint-retro
  Day 10: /sprint-planning (for next sprint)
```

---

## ✅ Success Checklist

Before your first sprint:
- [ ] Run `/scrum:init`
- [ ] Add 5+ items to product backlog
- [ ] Configure team capacity
- [ ] Run `/backlog-refinement`
- [ ] Run `/story-estimation`
- [ ] Run `/sprint-planning`

During sprint:
- [ ] Daily standup every work day
- [ ] Monitor sprint health
- [ ] Address impediments immediately
- [ ] Update story status daily

End of sprint:
- [ ] Run `/sprint-review`
- [ ] Calculate velocity
- [ ] Run `/sprint-retro`
- [ ] Capture action items
- [ ] Plan next sprint

---

**Remember**: When in doubt, run `/scrum:orchestrator` - it will guide you! 🎯
