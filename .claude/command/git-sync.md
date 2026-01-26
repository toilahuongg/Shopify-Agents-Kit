---
description: Sync with remote repository (pull --rebase)
---

1. Fetch the latest changes from the remote repository.
   - Command: `git fetch origin`
2. Pull and rebase the current branch on top of the remote branch.
   - Command: `git pull origin HEAD --rebase`
   - If there are conflicts, resolve them, then `git rebase --continue`.
