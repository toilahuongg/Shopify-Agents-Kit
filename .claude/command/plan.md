---
description: Activates the Project Manager to break down a feature request into tasks in Beads.
---

1.  **Analyze Request**: Read the user's feature request provided in the argument.
2.  **Act as Project Manager**:
    *   Load the `project-manager` agent persona.
    *   Analyze the request to identify the prompt purpose, scope, and key components.
    *   Create a plan structure in Beads:
        *   Create an Epic task: `bd create "Feature Name" -p 0`
        *   Create subtasks for Design, Implementation, and Testing.
        *   Link dependencies: `bd dep add <child> <parent>`
    *   **CRITICAL**: Run `bd sync` after creating the tasks.
3.  **Report**: List the created tasks and the next actionable item.
