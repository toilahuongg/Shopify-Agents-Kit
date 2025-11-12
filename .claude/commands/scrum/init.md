---
name: scrum:init
description: Initialize a new Scrum project with all necessary artifacts and configuration
---

# Scrum System Initialization

You are helping the user initialize a complete Scrum Agile system for their project. This command will guide them through setting up all necessary artifacts, configurations, and initial data.

## Your Task

**Initialize the Scrum system by creating all required artifacts and gathering initial project information.**

## YOLO MODE Detection

**First, check if the user wants YOLO mode (auto-accept all defaults):**

Ask the user:
```
Would you like to use YOLO mode? (Auto-accept all defaults for quick setup)
- Yes - Use smart defaults, no prompts
- No - Guide me through configuration
```

If **YOLO mode enabled**, use these defaults:
- Project Name: Extract from git repository name or use "My Scrum Project"
- Sprint Duration: 2 weeks (most common)
- Team Size: 5 members (typical)
- Start Date: Next Monday
- Team Members: Generate 5 generic team members (Dev1-5, 6hrs/day each)

**Skip all prompts** and proceed directly to Step 3 with these defaults.

### Step 1: Welcome and Overview

Display a welcoming message:
```
╔════════════════════════════════════════════════════════════════════╗
║                                                                    ║
║              🎊 SCRUM AGILE SYSTEM INITIALIZATION 🎊               ║
║                                                                    ║
╚════════════════════════════════════════════════════════════════════╝

Welcome! I'll help you set up a complete Scrum Agile system for your project.

This will create:
✅ Product backlog structure
✅ Team capacity configuration
✅ Sprint templates
✅ Metrics systems
✅ Definition of Done
✅ All 7 AI agents
✅ All 6 workflow commands

Let's get started!
```

If YOLO mode: Add "⚡ YOLO MODE: Using smart defaults for rapid setup!"

### Step 2: Gather Project Information

**Only if NOT in YOLO mode**, ask the user these questions (use the AskUserQuestion tool):

1. **Project Name**: "What is your project name?"
2. **Sprint Duration**: "How many weeks per sprint?" (Options: 1 week, 2 weeks, 3 weeks, 4 weeks)
3. **Team Size**: "How many team members?" (Options: 2-3, 4-5, 6-8, 9+)
4. **Start Date**: "When would you like to start Sprint 1?" (Format: YYYY-MM-DD)

**If YOLO mode**, automatically determine:
```javascript
// Get project name from git or directory
const projectName = await getGitRepoName() || path.basename(process.cwd()) || "My Scrum Project";

// Use smart defaults
const config = {
  projectName: projectName,
  sprintDurationWeeks: 2,
  sprintDurationDays: 10, // 2 weeks × 5 working days
  teamSize: 5,
  startDate: getNextMonday(), // Calculate next Monday
  teamMembers: [
    { id: "TM-001", name: "Developer 1", role: "Full-stack Developer", hoursPerDay: 6, daysAvailable: 10 },
    { id: "TM-002", name: "Developer 2", role: "Frontend Developer", hoursPerDay: 6, daysAvailable: 10 },
    { id: "TM-003", name: "Developer 3", role: "Backend Developer", hoursPerDay: 6, daysAvailable: 10 },
    { id: "TM-004", name: "Designer", role: "UX/UI Designer", hoursPerDay: 6, daysAvailable: 10 },
    { id: "TM-005", name: "QA Engineer", role: "Quality Assurance", hoursPerDay: 6, daysAvailable: 10 }
  ]
};
```

Display the auto-selected configuration:
```
⚡ YOLO MODE - Auto-configured:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Project Name:        [Detected name]
  Sprint Duration:     2 weeks (10 working days)
  Team Members:        5 developers (generic profiles)
  Sprint 1 Start:      [Next Monday date]
  Total Capacity:      300 hours (5 × 6 hrs × 10 days)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### Step 3: Create Directory Structure

Create the `.scrum/` directory structure if it doesn't exist:

```bash
.scrum/
├── product-backlog.json
├── team-capacity.json
├── definition-of-done.md
├── sprints/
│   └── sprint-001/
│       ├── backlog.json
│       └── daily-logs/
├── metrics/
│   ├── velocity.json
│   ├── sprint-health.json
│   ├── burndown-charts.json
│   ├── team-performance.json
│   ├── predictive-analytics.json
│   └── quality-metrics.json
├── retrospectives/
└── tests/
```

### Step 4: Initialize Product Backlog

Create an empty product backlog structure:

```json
{
  "schema": {
    "version": "1.0.0",
    "type": "product-backlog"
  },
  "metadata": {
    "projectName": "[User's project name]",
    "totalItems": 0,
    "lastUpdated": "[Current timestamp]",
    "version": "1.0.0"
  },
  "backlog": []
}
```

### Step 5: Initialize Team Capacity

**If NOT in YOLO mode**, ask about team members (use AskUserQuestion):
- "Please provide team member names (comma-separated)"
- For each member, gather: name, role, hours per day, days available per sprint

**If in YOLO mode**, use the 5 generic team members from Step 2.

Create `team-capacity.json`:

```json
{
  "schema": {
    "version": "1.0.0",
    "type": "team-capacity"
  },
  "metadata": {
    "projectName": "[Project name]",
    "sprintDuration": [Duration in days],
    "lastUpdated": "[Timestamp]"
  },
  "team": {
    "name": "[Project name] Team",
    "totalMembers": [Count]
  },
  "members": [
    {
      "id": "TM-001",
      "name": "[Member name]",
      "role": "[Role]",
      "hoursPerDay": 6,
      "daysAvailable": [Sprint days]
    }
  ],
  "currentSprint": {
    "sprintNumber": 1,
    "totalCapacityHours": 0,
    "allocatedHours": 0,
    "remainingHours": 0
  }
}
```

### Step 6: Copy Definition of Done

If the Definition of Done doesn't exist, create a default one based on best practices.

### Step 7: Initialize Sprint 001

Create the first sprint structure:

```json
{
  "schema": {
    "version": "1.0.0",
    "type": "sprint-backlog"
  },
  "sprintId": "SPRINT-001",
  "sprintNumber": 1,
  "sprintGoal": "To be defined in Sprint Planning",
  "startDate": "[User's start date]",
  "endDate": "[Calculated end date]",
  "durationDays": [Duration],
  "status": "planning",
  "backlogItems": [],
  "committedStoryPoints": 0,
  "completedStoryPoints": 0,
  "velocity": null,
  "dailyBurndown": [],
  "impediments": [],
  "teamCapacity": {
    "totalHours": 0,
    "allocatedHours": 0
  },
  "metadata": {
    "createdAt": "[Timestamp]",
    "lastUpdated": "[Timestamp]"
  }
}
```

### Step 8: Initialize Metrics Files

Create all 6 metrics files with empty initial structures:

1. **velocity.json** - Empty velocity history
2. **sprint-health.json** - Default health indicators
3. **burndown-charts.json** - Empty chart data
4. **team-performance.json** - Initial performance structure
5. **predictive-analytics.json** - Forecasting templates
6. **quality-metrics.json** - Quality tracking structure

### Step 9: Verify Agent Configuration

Check that all 7 agents are available:
- sprint-manager
- product-owner
- scrum-master
- scrum-metrics-analyzer
- increment-validator
- impediment-resolver
- todo-manager

If any are missing, inform the user.

### Step 10: Verify Workflow Commands

Check that all 6 workflow commands are available:
- /sprint-planning
- /daily-standup
- /sprint-review
- /sprint-retro
- /backlog-refinement
- /story-estimation

If any are missing, inform the user.

### Step 11: Run Tests

Run the test suite to verify the installation:
```bash
bash .scrum/tests/run-all-tests.sh
```

### Step 12: Display Success Summary

Show a completion summary:

**If YOLO mode**, add at the top:
```
⚡ YOLO MODE COMPLETE - System ready in seconds!
```

```
╔════════════════════════════════════════════════════════════════════╗
║                                                                    ║
║           ✅ SCRUM SYSTEM INITIALIZED SUCCESSFULLY! ✅             ║
║                                                                    ║
╚════════════════════════════════════════════════════════════════════╝

📊 INITIALIZATION SUMMARY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Project:             [Project Name]
  Sprint Duration:     [Duration] weeks
  Team Members:        [Count]
  Sprint 1 Start:      [Date]

✅ CREATED ARTIFACTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  ✅ Product Backlog
  ✅ Team Capacity Configuration
  ✅ Sprint 001 Template
  ✅ Definition of Done
  ✅ Metrics Systems (6 files)
  ✅ Directory Structure

✅ VERIFIED COMPONENTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  ✅ 7 AI Agents Available
  ✅ 6 Workflow Commands Available
  ✅ Test Suite Operational

🚀 NEXT STEPS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  1. Add items to your product backlog
  2. Run: /sprint-planning to plan your first sprint
  3. Run: /daily-standup for daily progress tracking
  4. Check metrics: cat .scrum/metrics/velocity.json | jq

📖 DOCUMENTATION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Getting Started:  cat .scrum/README.md
  Full Guide:       cat .scrum/FINAL_SUMMARY.md
  Documentation:    cat .scrum/INDEX.md

╔════════════════════════════════════════════════════════════════════╗
║                                                                    ║
║              🎉 Ready to start your first sprint! 🎉               ║
║                                                                    ║
╚════════════════════════════════════════════════════════════════════╝
```

### Step 13: Offer Orchestrator

Ask the user: "Would you like me to guide you through adding your first backlog items using the Scrum Orchestrator?"

If yes, transition to running the `/scrum:orchestrator` command.

## Important Notes

- Use the Write tool to create all JSON and markdown files
- Use the Bash tool to create directories
- Use AskUserQuestion for gathering user input
- Validate all dates and ensure they're in the future
- Calculate sprint end dates based on duration (excluding weekends)
- Ensure all file paths are correct
- Run tests at the end to verify everything works

## Error Handling

If any step fails:
1. Inform the user clearly what went wrong
2. Provide guidance on how to fix it
3. Offer to retry the failed step
4. Don't proceed if critical files can't be created

## Validation

Before completing:
- ✅ All required directories exist
- ✅ All required JSON files are valid
- ✅ Team capacity calculations are correct
- ✅ Sprint dates are valid
- ✅ Test suite passes
- ✅ All agents are available
- ✅ All commands are available
