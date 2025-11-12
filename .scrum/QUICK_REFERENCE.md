# 🚀 Quick Reference Card

## One Command to Rule Them All

```bash
/scrum:full-workflow
```

**From idea to production in ~2.5 hours!**

---

## 🎯 Project Types Supported

| Type | Agent Used | Time |
|------|-----------|------|
| **Shopify App** | shopify-app-ideator + product-owner | 2.5h |
| **Web App** | product-owner | 2h |
| **Mobile App** | product-owner | 2h |
| **API/Backend** | product-owner | 2h |
| **Other** | product-owner | 2h |

---

## 📋 Quick Decision Tree

```
Do you have an idea?
├─ No
│  └─ Use: Shopify App → Get 3-5 concepts
│     └─ Use: Other → Describe problem space
│
└─ Yes
   ├─ Is it Shopify app?
   │  └─ Yes → Get evaluation & refinement
   │  └─ No → Standard workflow
   │
   └─ Ready to code?
      └─ Run: /scrum:full-workflow
```

---

## ⚡ Automation Modes

### YOLO Mode (Recommended) 🚀
- **Fastest:** Minimal interruptions
- **Best for:** Experienced teams, clear ideas
- **Speed:** Maximum automation

### Standard Mode 🎯
- **Balanced:** Approval at phase transitions
- **Best for:** Most projects
- **Speed:** Automated with checkpoints

### Guided Mode 📚
- **Controlled:** Step-by-step with full visibility
- **Best for:** Learning, complex projects
- **Speed:** Maximum control

---

## 📊 What You Get

### Phase 1-2: Documentation (~1 hour)
```
✅ PRD.md (Product Requirements)
✅ ARCHITECTURE.md (System Design)
✅ UXUI_DESIGN.md (UI/UX Guidelines)
```

### Phase 3-4: Backlog (~45 min)
```
✅ product-backlog.json
   ├─ 5-10 Epics
   ├─ 20-50 Stories
   ├─ Acceptance Criteria
   ├─ Story Points
   └─ Priorities
```

### Phase 5: Sprint Planning (~30 min)
```
✅ sprint-001/backlog.json
   ├─ Sprint Goal
   ├─ Selected Stories
   ├─ Tasks (with hours)
   └─ Team Commitment
```

### Phase 6: Execution (1-4 weeks)
```
✅ Daily standup automation
✅ Code review automation
✅ Metrics tracking
✅ Sprint review/retro
```

---

## 🎯 Common Use Cases

### 1. No Idea → Need Brainstorming
```bash
/scrum:full-workflow
→ Choose: Shopify App
→ Say: "Tôi cần ideas"
→ Answer questions
→ Get 3-5 concepts
→ Choose best one
→ Continue workflow
```
**Time:** 2.5 hours

### 2. Have Rough Idea → Need Refinement
```bash
/scrum:full-workflow
→ Choose: Project type
→ Describe idea
→ Get evaluation (if Shopify)
→ Refine based on feedback
→ Continue workflow
```
**Time:** 2 hours

### 3. Clear Idea → Just Execute
```bash
/scrum:full-workflow
→ Choose: Project type
→ Provide detailed description
→ Skip brainstorming
→ Straight to documentation
```
**Time:** 1.5 hours

---

## 🔧 Individual Commands

### Planning
```bash
/scrum:init                   # First time setup
/scrum:backlog-builder        # Generate backlog only
/scrum:add-backlog           # Add single item
```

### Sprint
```bash
/sprint-planning              # Plan sprint
/daily-standup               # Daily sync
/sprint-review               # Demo & review
/sprint-retro                # Reflect & improve
```

### Backlog
```bash
/backlog-refinement          # Refine items
/story-estimation            # Estimate points
```

### Guidance
```bash
/scrum:orchestrator          # Smart guidance anytime
```

---

## 📁 Important Files

### Documentation
```
.scrum/docs/
├── PRD.md                    # Requirements
├── ARCHITECTURE.md           # System design
└── UXUI_DESIGN.md           # UI/UX guide
```

### Data
```
.scrum/
├── product-backlog.json      # All items
├── team-capacity.json        # Team info
└── sprints/
    └── sprint-001/
        ├── backlog.json      # Sprint items
        └── daily-logs/       # Daily updates
```

### Metrics
```
.scrum/metrics/
├── velocity.json             # Velocity tracking
├── sprint-health.json        # Health score
├── burndown-charts.json      # Burndown data
└── quality-metrics.json      # Quality metrics
```

---

## 🎨 Agent Quick Reference

| Agent | When to Use |
|-------|-------------|
| **shopify-app-ideator** | Shopify app brainstorming |
| **product-owner** | Requirements, backlog |
| **solution-architect** | System architecture |
| **ux-design-expert** | UI/UX design |
| **sprint-manager** | Sprint planning, execution |
| **scrum-master** | Ceremonies, facilitation |
| **project-manager** | Quality gates, reviews |
| **code-reviewer** | Code quality checks |

---

## 📊 Metrics Cheat Sheet

### Check Sprint Health
```bash
cat .scrum/metrics/sprint-health.json | jq '.sprintHealthHistory[0]'
```

### Check Velocity
```bash
cat .scrum/metrics/velocity.json | jq '.statistics'
```

### Check Burndown
```bash
cat .scrum/metrics/burndown-charts.json | jq '.sprints[0]'
```

### View Backlog
```bash
cat .scrum/product-backlog.json | jq '.backlog[] | {id, title, priority, storyPoints}'
```

---

## 🚨 Troubleshooting

### Workflow Stuck?
```bash
# Check state
cat .scrum/workflow-state.json

# Resume
/scrum:full-workflow
```

### Invalid Backlog?
```bash
# Validate
.scrum/tests/test-product-backlog.sh

# Fix
/scrum:backlog-builder
```

### Need Help?
```bash
/scrum:orchestrator
```

---

## 🎯 Success Indicators

### Healthy Project
- ✅ Health score > 80
- ✅ Burndown trending to 0
- ✅ Velocity stable (±20%)
- ✅ Stories moving to done
- ✅ Few impediments

### Needs Attention
- ⚠️ Health score 60-80
- ⚠️ Burndown behind
- ⚠️ Velocity dropping
- ⚠️ Stories stuck
- ⚠️ Growing impediments

### Critical
- 🚨 Health score < 60
- 🚨 Burndown way behind
- 🚨 Velocity crashed
- 🚨 No progress
- 🚨 Many blockers

---

## 💡 Pro Tips

### 1. Use YOLO Mode
- Fastest path
- Trust automation
- Great for experienced teams

### 2. Keep Backlog Fresh
- Add new items regularly
- Re-prioritize often
- Remove obsolete items

### 3. Monitor Daily
- Check sprint health
- Address blockers quickly
- Update task status

### 4. Run Retros Seriously
- Create action items
- Assign owners
- Track completion

### 5. Use Orchestrator
```bash
/scrum:orchestrator
```
- Smart guidance
- Context-aware suggestions
- Status checks

---

## 📚 Learning Path

### Beginner
1. Read: `AUTOMATED_WORKFLOW_GUIDE.md`
2. Try: `/scrum:full-workflow` (Guided mode)
3. Complete: 1 sprint

### Intermediate
1. Read: `USER_GUIDE.md`
2. Try: Individual commands
3. Complete: 3 sprints

### Advanced
1. Read: Agent docs
2. Customize: workflows
3. Optimize: for your team

---

## 🎉 Start Now!

```bash
/scrum:full-workflow
```

**Choose your project type and let's build!** 🚀

---

## 📖 Full Documentation

- **Overview:** `.scrum/README.md`
- **Automated:** `.scrum/AUTOMATED_WORKFLOW_GUIDE.md`
- **Shopify:** `.scrum/SHOPIFY_APP_BRAINSTORM_GUIDE.md`
- **Manual:** `.scrum/USER_GUIDE.md`
- **Index:** `.scrum/INDEX.md`
- **What's New:** `.scrum/WHATS_NEW.md`

---

**Print this for your desk!** 📄
