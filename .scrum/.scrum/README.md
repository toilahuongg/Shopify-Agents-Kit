
## 🎯 System Commands

### `/scrum:init` - Initialize Scrum System
**Purpose**: Set up a new Scrum project from scratch

**What it does**:
- Creates complete directory structure
- Initializes product backlog
- Configures team capacity
- Sets up sprint templates
- Initializes all metrics systems
- Verifies agent and workflow availability
- Runs tests to validate setup

**When to use**:
- Starting a new project
- Setting up Scrum for the first time
- Resetting the system

**Example**:
```
Run: /scrum:init
```

### `/scrum:orchestrator` - Intelligent Workflow Guide
**Purpose**: Analyze current state and guide you through the Scrum process

**What it does**:
- Analyzes current sprint state
- Displays comprehensive status dashboard
- Recommends next best actions
- Executes chosen workflows
- Monitors progress and alerts
- Enforces Scrum best practices
- Provides continuous guidance

**When to use**:
- Unsure what to do next
- Want overview of current state
- Need guidance on workflow order
- Starting each work session
- Daily progress monitoring

**Example**:
```
Run: /scrum:orchestrator
```

**Features**:
- 📊 Real-time status dashboard
- 🎯 Smart action recommendations
- ⏰ Daily standup reminders
- 🏁 Sprint milestone alerts
- ⚠️ Impediment detection
- 📈 Velocity monitoring
- ✅ Best practices enforcement

---

## 🚀 Getting Started Workflow

### For New Projects

1. **Initialize System**:
   ```
   /scrum:init
   ```

2. **Add Backlog Items**:
   - Manually edit `.scrum/product-backlog.json`
   - Or use orchestrator guidance

3. **Refine Backlog**:
   ```
   /backlog-refinement
   ```

4. **Estimate Stories**:
   ```
   /story-estimation
   ```

5. **Plan First Sprint**:
   ```
   /sprint-planning
   ```

6. **Use Orchestrator Daily**:
   ```
   /scrum:orchestrator
   ```

### For Ongoing Projects

Start each day with:
```
/scrum:orchestrator
```

The orchestrator will:
- Show your current status
- Remind you of pending actions
- Guide you to the next workflow
- Monitor sprint health
- Provide actionable recommendations

---

## 🎯 Command Reference Summary

| Command | Purpose | When to Use |
|---------|---------|-------------|
| `/scrum:init` | Initialize system | New project setup |
| `/scrum:orchestrator` | Workflow guidance | Daily, start of work |
| `/sprint-planning` | Plan sprint | Start of sprint |
| `/daily-standup` | Daily sync | Every working day |
| `/sprint-review` | Demo & review | End of sprint |
| `/sprint-retro` | Reflect & improve | After sprint review |
| `/backlog-refinement` | Refine stories | Mid-sprint, as needed |
| `/story-estimation` | Estimate work | Before planning |

---

