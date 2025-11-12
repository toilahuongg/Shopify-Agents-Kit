# Add Backlog Item - Interactive Backlog Creation

You are helping users add new backlog items to the Product Backlog in a structured, template-driven way.

## Your Role

Guide users through creating well-formed backlog items that follow the Product Backlog schema and Scrum best practices.

## Command Flow

### Step 1: Check System State

First, verify the backlog file exists:

```bash
Check if .scrum/product-backlog.json exists
```

If it doesn't exist, suggest running `/scrum:init` first.

### Step 2: Gather Item Information

Use the AskUserQuestion tool to collect information about the new backlog item. Ask questions progressively based on the item type.

**Question 1: Item Type**
```
What type of backlog item do you want to create?
Options:
- Story: User story delivering end-user value
- Epic: Large feature broken into multiple stories
- Bug: Defect or issue to fix
- Spike: Research or investigation task
- Technical Debt: Code quality improvement
```

**Question 2: Basic Information**
After type is selected, ask for:
- Title (short, descriptive)
- Description (detailed explanation)
- Priority (1-10, where 1 is highest)
- Business Value (1-10, where 10 is highest)

For **Stories**, ensure description follows format:
```
As a [role], I want [goal], so that [benefit]
```

For **Bugs**, ensure description includes:
```
What happens: [current behavior]
What should happen: [expected behavior]
Impact: [who/what is affected]
```

For **Epics**, ensure description includes:
```
High-level goal: [what we want to achieve]
Value proposition: [why this matters]
Scope: [broad outline of features included]
```

For **Spikes**, ensure description includes:
```
Research question: [what we need to learn]
Time-box: [how long to spend]
Expected output: [what we'll produce]
```

**Question 3: Acceptance Criteria (Required for Stories and Bugs)**
For stories and bugs, collect 3-5 acceptance criteria in Given/When/Then format:
```
Given [context/precondition]
When [action/event]
Then [expected outcome]
```

**Question 4: Additional Details**
Ask for optional information:
- Story Points (use Fibonacci: 1, 2, 3, 5, 8, 13, 21, 40, 100)
- Labels (comma-separated: feature, bug, high-priority, etc.)
- Dependencies (comma-separated list of PBI IDs)
- Parent Epic (if this is a child story)

### Step 3: Generate Backlog Item

Read the current backlog to:
1. Get the next available ID (e.g., if last is PBI-005, next is PBI-006)
2. Get current metadata counts
3. Validate parent IDs if specified

Create the new backlog item object:

```json
{
  "id": "PBI-XXX",
  "type": "[story|epic|bug|spike|technical-debt]",
  "title": "[User-provided title]",
  "description": "[User-provided description]",
  "priority": [User-provided priority],
  "status": "backlog",
  "storyPoints": [User-provided or null],
  "businessValue": [User-provided business value],
  "createdDate": "[Today's date in YYYY-MM-DD format]",
  "updatedDate": "[Today's date in YYYY-MM-DD format]",
  "sprint": null,
  "acceptanceCriteria": ["[criteria 1]", "[criteria 2]", ...],
  "dependencies": ["[dependency IDs if provided]"],
  "labels": ["[labels if provided]"],
  "productOwnerNotes": "",
  "definitionOfReady": [Calculate based on completeness],
  "parent": "[Parent PBI ID or null]",
  "children": []
}
```

### Step 4: Validate Item

Check the new item against Definition of Ready criteria:

**For Stories:**
- ✅ Clear description in user story format
- ✅ Acceptance criteria defined (at least 3)
- ✅ Estimated (story points assigned)
- ✅ Dependencies identified
- ✅ Small enough for one Sprint (≤13 story points recommended)
- ✅ Testable (acceptance criteria are testable)
- ✅ Value/benefit clear

**For Epics:**
- ✅ High-level goal defined
- ✅ Value proposition clear
- ✅ Has or will have child stories
- ✅ Scope is clear

**For Bugs:**
- ✅ Current vs expected behavior clear
- ✅ Reproduction steps or acceptance criteria
- ✅ Impact identified
- ✅ Estimated (story points)

**For Spikes:**
- ✅ Research question clear
- ✅ Time-boxed
- ✅ Expected output defined
- ✅ Does NOT need story points (spikes are time-boxed by hours)

Set `definitionOfReady: true` only if all applicable criteria are met.

### Step 5: Update Backlog File

Read the current product-backlog.json, then:

1. Add the new item to the `backlog` array
2. If this is a child story, add its ID to parent's `children` array
3. Update metadata:
   - `totalItems`: increment by 1
   - `readyItems`: increment by 1 if definitionOfReady is true
   - `estimatedItems`: increment by 1 if storyPoints is not null
   - `lastUpdated`: current timestamp

4. Re-sort the backlog array by priority (lower number = higher priority)

5. Write the updated JSON back to the file

### Step 6: Confirmation

Display a summary of the created item:

```
✅ BACKLOG ITEM CREATED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

ID:              [PBI-XXX]
Type:            [Type]
Title:           [Title]
Priority:        [Priority] ([Priority level description])
Story Points:    [Points or "Not estimated"]
Business Value:  [Value]/10
Status:          backlog
Ready:           [✅ Yes / ❌ No]

[If parent exists]
Parent Epic:     [Parent ID] - [Parent Title]

[If has dependencies]
Dependencies:    [List of dependencies]

[If has acceptance criteria]
Acceptance Criteria:
  1. [Criteria 1]
  2. [Criteria 2]
  ...

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 Updated Backlog Stats:
  Total Items:     [X] (+1)
  Ready Items:     [Y]
  Estimated Items: [Z]
```

### Step 7: Suggest Next Actions

Based on the item created and backlog state:

```
🎯 SUGGESTED NEXT ACTIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[If item is not ready]
1. Complete item details to mark it as "ready"
   - Add acceptance criteria
   - Estimate story points
   - Clarify dependencies

[If item is ready and backlog has 8+ ready items]
2. Ready for Sprint Planning
   → Command: /sprint-planning

[If item is not estimated]
3. Estimate this item
   → You can add story points by editing the item

[Always]
4. Add another backlog item
   → Command: /scrum:add-backlog

5. View full backlog
   → File: .scrum/product-backlog.json
```

## Special Cases

### Creating Child Stories for an Epic

If user wants to create a story under an epic:
1. Ask which epic (show list of existing epics)
2. Set the `parent` field to the epic's ID
3. Automatically add this story's ID to the epic's `children` array
4. Suggest priority based on parent's priority

### Creating Technical Debt Items

For technical-debt type:
- No user story format needed
- Focus on technical description
- Include "Current state" and "Desired state"
- Include "Benefits" section
- Technical debt should be estimated like stories

### Cloning Existing Items

Offer to clone an existing item as a template:
```
Would you like to base this item on an existing backlog item?
- This will copy the structure, labels, and format
- You can then modify the specific details
```

## Validation Rules

**Title:**
- 5-100 characters
- Clear and descriptive
- Starts with action verb for stories (e.g., "Enable", "Create", "Fix")

**Description:**
- Minimum 20 characters
- Follows format for item type
- Clear and unambiguous

**Priority:**
- Must be a positive integer
- Lower number = higher priority
- Suggest adjusting other item priorities if conflicts

**Story Points:**
- Must be from Fibonacci sequence or null
- Stories > 13 points should be broken down
- Epics don't get story points (sum of children)
- Spikes use time-boxing instead (capture in description)

**Business Value:**
- 1-10 scale
- Required field
- Helps with ROI prioritization

**Dependencies:**
- Must reference valid PBI IDs
- Circular dependencies not allowed
- Show warning if creates complex dependency chain

## Smart Suggestions

**Priority Suggestions:**
Based on item type and backlog state:
- Bugs with high impact → Priority 1-3
- High business value stories → Priority 1-5
- Spikes before related stories → Higher priority
- Technical debt → Usually lower priority (unless blocking)

**Label Suggestions:**
Based on title/description keywords:
- "bug", "fix", "error" → Add "bug" label
- "research", "investigate" → Add "spike" or "research" label
- "performance", "scale" → Add "performance" label
- "security", "auth" → Add "security" label
- "api", "graphql" → Add "api" label

**Acceptance Criteria Templates:**

For CRUD operations:
```
Given I am on the [entity] page
When I click [action button]
Then I can [perform action]
And I see [expected result]
```

For API features:
```
Given valid [input parameters]
When I call [API endpoint]
Then I receive [expected response]
And the response contains [expected data]
```

For UI features:
```
Given I am a [role]
When I navigate to [page/section]
Then I see [expected UI elements]
And I can [perform expected interactions]
```

## Integration with Other Commands

**After adding an item:**
- If backlog now has 8+ ready items and no active sprint → Suggest `/sprint-planning`
- If item needs estimation → Suggest `/story-estimation`
- If item is an epic → Suggest adding child stories
- If item has dependencies → Show dependency tree

## Output Examples

**Example 1: Creating a User Story**
```
✅ BACKLOG ITEM CREATED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

ID:              PBI-006
Type:            story
Title:           Bulk product deletion with confirmation
Priority:        2 (High priority)
Story Points:    5
Business Value:  8/10
Status:          backlog
Ready:           ✅ Yes

Parent Epic:     PBI-001 - Bulk Product Operations

Acceptance Criteria:
  1. Given I have selected products, when I click delete, then I see a confirmation modal
  2. Given I confirm deletion, when the operation completes, then all products are deleted
  3. Given I cancel deletion, when I close the modal, then no products are deleted
  4. Given deletion fails, when an error occurs, then I see a clear error message

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 Updated Backlog Stats:
  Total Items:     6 (+1)
  Ready Items:     3 (+1)
  Estimated Items: 5 (+1)

🎯 SUGGESTED NEXT ACTIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1. Add more child stories to epic PBI-001
   → Command: /scrum:add-backlog

2. Ready for Sprint Planning (8+ items recommended)
   → Need 2 more ready items
   → Command: /scrum:add-backlog or /story-estimation

3. View updated backlog
   → File: .scrum/product-backlog.json
```

## Error Handling

**If backlog file doesn't exist:**
```
❌ Product backlog not found.

Please initialize the Scrum system first:
→ Command: /scrum:init
```

**If invalid parent ID:**
```
⚠️ Warning: Parent epic "PBI-999" does not exist.

Available epics:
- PBI-001: Bulk Product Operations

Would you like to:
1. Select a different parent
2. Create this as a standalone item
3. Create a new epic first
```

**If priority conflict:**
```
⚠️ Notice: Another item (PBI-003) has the same priority (3).

Would you like to:
1. Keep priority 3 (items can share priorities)
2. Adjust to priority 4
3. Review and reorder all priorities
```

## Best Practices

1. **Story Size**: Encourage stories ≤8 points, suggest splitting if larger
2. **Acceptance Criteria**: Minimum 3, maximum 8 for clarity
3. **Epics**: Should have at least 2 child stories
4. **Dependencies**: Keep dependency chains short (warn if >2 levels deep)
5. **Labels**: Suggest 2-4 relevant labels per item
6. **Business Value**: Guide users on rating scale with examples

## Success Criteria

The command is successful when:
✅ New item is added to product-backlog.json
✅ Item follows the correct schema
✅ Metadata is updated correctly
✅ Parent-child relationships are established
✅ User understands next steps
✅ Definition of Ready is accurately calculated
✅ Item is automatically sorted by priority
