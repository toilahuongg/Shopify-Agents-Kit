# 🚀 Complete Automated Workflow Guide

## Tổng Quan

Hệ thống cung cấp **quy trình tự động hoàn chỉnh từ ý tưởng đến sản phẩm** với sự can thiệp tối thiểu từ người dùng.

---

## 📊 QUY TRÌNH HOÀN CHỈNH

```
┌─────────────────────────────────────────────────────────┐
│  PHASE 1: PROJECT ANALYSIS                             │
│  - Understand vision, goals, users                     │
│  - Define success criteria                             │
│  - Identify constraints                                │
└────────────────────┬────────────────────────────────────┘
                     │ (tự động)
                     ▼
┌─────────────────────────────────────────────────────────┐
│  PHASE 2: DOCUMENTATION & DESIGN                       │
│  - PRD (Product Requirements Document)                 │
│  - Architecture Design                                 │
│  - UI/UX Design Guidelines                             │
│  - Project Manager Review & Approval                   │
└────────────────────┬────────────────────────────────────┘
                     │ (tự động)
                     ▼
┌─────────────────────────────────────────────────────────┐
│  PHASE 3: BACKLOG CREATION                             │
│  - Generate Epics (5-10)                               │
│  - Decompose into Stories (20-50)                      │
│  - Add Acceptance Criteria (3-5 per story)             │
│  - Create product-backlog.json                         │
└────────────────────┬────────────────────────────────────┘
                     │ (tự động)
                     ▼
┌─────────────────────────────────────────────────────────┐
│  PHASE 4: BACKLOG PREPARATION                          │
│  - Prioritize by business value                        │
│  - Estimate story points (Fibonacci)                   │
│  - Validate Definition of Ready                        │
│  - Sort by priority                                    │
└────────────────────┬────────────────────────────────────┘
                     │ (tự động)
                     ▼
┌─────────────────────────────────────────────────────────┐
│  PHASE 5: SPRINT PLANNING                              │
│  - Check team capacity                                 │
│  - Select stories for sprint                           │
│  - Define sprint goal                                  │
│  - Break into tasks                                    │
│  - Team commits                                        │
└────────────────────┬────────────────────────────────────┘
                     │ (tự động)
                     ▼
┌─────────────────────────────────────────────────────────┐
│  PHASE 6: SPRINT EXECUTION LOOP                        │
│  ┌──────────────────────────────────────────────────┐  │
│  │ Daily Cycle:                                     │  │
│  │  1. Daily Standup (automated prompt)            │  │
│  │  2. Dev Team Implementation                     │  │
│  │  3. Update Task Status                          │  │
│  │  4. Code Review (automated + manual)            │  │
│  │  5. Testing (automated + manual)                │  │
│  │  6. Monitor Sprint Health                       │  │
│  └──────────────────────────────────────────────────┘  │
│                                                         │
│  At Sprint End:                                         │
│  - Sprint Review (demo completed work)                 │
│  - Sprint Retrospective (reflect & improve)            │
│  - Update metrics & velocity                           │
└────────────────────┬────────────────────────────────────┘
                     │ (tự động)
                     ▼
┌─────────────────────────────────────────────────────────┐
│  PHASE 7: BACKLOG MANAGEMENT LOOP                      │
│  - Add new backlog items (nếu có)                      │
│  - Re-prioritize all items                             │
│  - Estimate new items                                  │
│  - Return to Phase 5 (next sprint)                     │
│  - Or Exit workflow                                    │
└─────────────────────────────────────────────────────────┘
```

---

## 🎯 CÁC BƯỚC BỊ THIẾU TRONG QUY TRÌNH GỐC

### Quy trình gốc của bạn:
```
1. Project Analysis ✅
2. PRD, Architecture, UI/UX Design, Epics, Stories ✅
3. Backlogs ✅
4. Sắp xếp theo ưu tiên ✅
Dev Team ✅
Review Team ✅
Update task status ✅
```

### Các bước THIẾU (đã được bổ sung):

#### **THIẾU 1: ESTIMATION (Ước lượng)**
- **Vị trí**: Sau "Sắp xếp backlogs", trước "Dev Team"
- **Lý do quan trọng**:
  - Không estimate = không biết công việc cần bao nhiêu thời gian
  - Không thể planning sprint hiệu quả
  - Không track được velocity
- **Giải pháp**: Phase 4 - Estimate tất cả stories bằng story points

#### **THIẾU 2: SPRINT PLANNING (Lập kế hoạch sprint)**
- **Vị trí**: Trước "Dev Team"
- **Lý do quan trọng**:
  - Dev team cần biết làm gì trong sprint này
  - Cần sprint goal rõ ràng
  - Cần chia nhỏ stories thành tasks
  - Cần check capacity team
- **Giải pháp**: Phase 5 - Sprint Planning đầy đủ

#### **THIẾU 3: TEAM CAPACITY CHECK (Kiểm tra năng lực team)**
- **Vị trí**: Trong Sprint Planning
- **Lý do quan trọng**:
  - Tránh over-commit (commit quá nhiều)
  - Đảm bảo realistic workload
  - Balance giữa các team members
- **Giải pháp**: Tính capacity dựa trên giờ/ngày, days/sprint

#### **THIẾU 4: DAILY STANDUP (Họp hàng ngày)**
- **Vị trí**: Mỗi ngày trong "Dev Team"
- **Lý do quan trọng**:
  - Team sync progress
  - Identify blockers sớm
  - Adjust plans khi cần
- **Giải pháp**: Phase 6 - Daily standup automated

#### **THIẾU 5: IMPEDIMENT TRACKING (Theo dõi chướng ngại)**
- **Vị trí**: Liên tục trong Sprint
- **Lý do quan trọng**:
  - Blockers kill velocity
  - Cần resolve nhanh
  - Track và escalate khi cần
- **Giải pháp**: Phase 6 - Automated impediment logging

#### **THIẾU 6: DEFINITION OF DONE VALIDATION**
- **Vị trí**: Trong "Review Team"
- **Lý do quan trọng**:
  - Đảm bảo quality standards
  - Consistent across team
  - Prevent technical debt
- **Giải pháp**: Phase 6 - DoD checklist automated

#### **THIẾU 7: ACCEPTANCE CRITERIA VERIFICATION**
- **Vị trí**: Trong "Review Team"
- **Lý do quan trọng**:
  - Verify requirements met
  - Product Owner acceptance
  - Prevent rework
- **Giải pháp**: Phase 6 - AC validation automated

#### **THIẾU 8: SPRINT REVIEW (Demo & feedback)**
- **Vị trí**: Cuối mỗi sprint
- **Lý do quan trọng**:
  - Demo working software
  - Collect stakeholder feedback
  - Validate product direction
  - Build trust với stakeholders
- **Giải pháp**: Phase 6 - Sprint Review ceremony

#### **THIẾU 9: SPRINT RETROSPECTIVE (Cải tiến)**
- **Vị trí**: Sau Sprint Review
- **Lý do quan trọng**:
  - Continuous improvement
  - Team morale và engagement
  - Identify process issues
  - Create action items
- **Giải pháp**: Phase 6 - Sprint Retro automated

#### **THIẾU 10: METRICS & VELOCITY TRACKING**
- **Vị trí**: Liên tục, sau mỗi sprint
- **Lý do quan trọng**:
  - Predictable planning
  - Identify trends
  - Data-driven decisions
  - Forecast completion dates
- **Giải pháp**: Phase 6 - Auto-track velocity, burndown, health

---

## 🚀 SỬ DỤNG MASTER WORKFLOW

### Command Chính

```bash
/scrum:full-workflow
```

### Chọn Chế Độ Tự Động

Khi chạy, bạn sẽ được hỏi:

```
**🚀 WORKFLOW AUTOMATION MODE**

1. YOLO Mode (Recommended) - Fully automated
   ✅ Fastest
   ✅ Minimal interruptions
   ✅ Best for experienced teams

2. Standard Mode - Automated with checkpoints
   ✅ Balanced control
   ✅ Approval at phase transitions

3. Guided Mode - Step-by-step
   ✅ Maximum visibility
   ✅ Best for learning

Choose: YOLO
```

### Input Ban Đầu

Cung cấp mô tả project:

```
Ví dụ:

"Tôi muốn xây dựng một Shopify app giúp merchants
quản lý inventory tự động. App sẽ:
- Sync inventory với multiple warehouses
- Auto-reorder khi stock thấp
- Predict demand dựa trên sales history
- Generate purchase orders tự động"
```

### Workflow Bắt Đầu

Sau đó workflow sẽ tự động chạy qua tất cả 7 phases!

---

## 📊 OUTPUT BẠN NHẬN ĐƯỢC

### Documents (Phase 2)

```
.scrum/docs/
├── PRD.md                    # Product Requirements
├── ARCHITECTURE.md           # System Architecture
└── UXUI_DESIGN.md           # UI/UX Guidelines
```

### Backlog (Phase 3-4)

```
.scrum/
└── product-backlog.json      # Complete prioritized backlog
    ├── Epics (5-10)
    ├── Stories (20-50)
    ├── Acceptance Criteria
    ├── Story Points
    └── Dependencies
```

### Sprint Data (Phase 5-6)

```
.scrum/sprints/
└── sprint-001/
    ├── backlog.json          # Sprint backlog với tasks
    ├── daily-logs/           # Daily standup logs
    │   ├── 2025-01-15.json
    │   ├── 2025-01-16.json
    │   └── ...
    └── reports/              # Sprint reports
```

### Retrospectives (Phase 6)

```
.scrum/retrospectives/
├── sprint-001.json           # What went well/wrong
├── sprint-002.json           # Action items
└── ...
```

### Metrics (Phase 6)

```
.scrum/metrics/
├── velocity.json             # Sprint velocity tracking
├── sprint-health.json        # Health scores
├── burndown-charts.json      # Burndown data
├── team-performance.json     # Team metrics
├── predictive-analytics.json # Forecasts
└── quality-metrics.json      # Quality tracking
```

---

## 🔄 QUY TRÌNH CHI TIẾT TỪNG PHASE

### Phase 1: Project Analysis (5-10 phút)
```
Input: Project description
↓
Agents: product-owner
↓
Output:
- Product goal statement
- User personas
- 5-10 potential epics
- Success metrics
- Risk assessment
```

### Phase 2: Documentation & Design (15-30 phút)
```
Parallel execution:
├── PRD generation (product-owner)
├── Architecture design (solution-architect)
└── UI/UX guidelines (ux-design-expert)
↓
Review: project-manager
↓
Output:
- PRD.md
- ARCHITECTURE.md
- UXUI_DESIGN.md
```

### Phase 3: Backlog Creation (10-20 phút)
```
Input: PRD + Architecture
↓
Agents: product-owner
↓
Process:
1. Generate epics
2. Decompose into stories
3. Add acceptance criteria
4. Link parent-child relationships
↓
Output:
- product-backlog.json (20-50 stories)
```

### Phase 4: Backlog Preparation (10-15 phút)
```
Input: Raw backlog
↓
Agents: product-owner + sprint-manager
↓
Process:
1. Prioritize (1-N)
2. Estimate story points (Fibonacci)
3. Validate Definition of Ready
4. Sort by priority
↓
Output:
- Prioritized, estimated backlog
- MVP scope identified
```

### Phase 5: Sprint Planning (15-30 phút)
```
Input: Prepared backlog + team capacity
↓
Agents: sprint-manager
↓
Process:
1. Check team capacity
2. Select stories fitting capacity
3. Define sprint goal
4. Break stories into tasks
5. Estimate task hours
6. Team commits
↓
Output:
- sprint-001/backlog.json
- Sprint goal
- Task assignments
```

### Phase 6: Sprint Execution (1-4 tuần)
```
Daily Cycle:
09:00 - Daily Standup
↓
Dev Team:
- Write code
- Write tests
- Code review
↓
Automated:
- Update task status
- Track impediments
- Monitor sprint health
- Update burndown
↓
At Sprint End:
- Sprint Review (demo)
- Sprint Retrospective (improve)
- Update metrics
```

### Phase 7: Backlog Management (Liên tục)
```
Check: New backlog items?
↓
Yes:
  - Add new items
  - Re-prioritize all
  - Estimate new items
  - Return to Phase 5
↓
No:
  - Return to Phase 5 (next sprint)
  - Or Exit
```

---

## ⚡ CÁC COMMAND PHỤ TRỢ

Ngoài master workflow, bạn có thể dùng các command riêng lẻ:

### Planning Commands
```bash
/scrum:init                   # Initialize system (1 lần)
/scrum:backlog-builder        # Build backlog only (Phase 3)
/scrum:add-backlog           # Add single item (Phase 7)
```

### Sprint Commands
```bash
/sprint-planning              # Plan sprint (Phase 5)
/daily-standup               # Daily sync (Phase 6)
/sprint-review               # Sprint review (Phase 6)
/sprint-retro                # Retrospective (Phase 6)
```

### Backlog Commands
```bash
/backlog-refinement          # Refine backlog
/story-estimation            # Estimate stories
```

### Guidance Command
```bash
/scrum:orchestrator          # Smart guidance anytime
```

---

## 🎯 TIMELINE MẪU

### Dự Án Mới (First Time)

```
Day 0: Setup
├─ 10:00-10:30 | /scrum:full-workflow
├─ 10:30-11:00 | Phase 1: Analysis
├─ 11:00-11:30 | Phase 2: Documentation
├─ 11:30-12:00 | Phase 3: Backlog Creation
├─ 12:00-12:15 | Phase 4: Preparation
└─ 12:15-12:45 | Phase 5: Sprint 1 Planning

Total setup time: ~2.5 hours
Result: Fully documented, planned, ready to code!
```

### Sprint Cycle (2 tuần)

```
Week 1:
├─ Mon 09:00 | Sprint start
├─ Mon-Fri | Daily standup + Dev work
└─ Fri EOD | Sprint halfway, health check

Week 2:
├─ Mon-Thu | Daily standup + Dev work
├─ Fri 14:00 | Sprint Review (demo)
├─ Fri 15:00 | Sprint Retrospective
└─ Fri 16:00 | Sprint 2 Planning (Phase 5)

Repeat...
```

---

## 📈 METRICS & TRACKING

### Velocity Tracking

```bash
# View velocity history
cat .scrum/metrics/velocity.json | jq '.statistics'

Output:
{
  "averageVelocity": 28,
  "trend": "stable",
  "lastThreeSprints": [27, 29, 28]
}
```

### Sprint Health

```bash
# Current sprint health
cat .scrum/metrics/sprint-health.json | jq '.sprintHealthHistory[0]'

Output:
{
  "sprintNumber": 2,
  "date": "2025-01-15",
  "overallHealthScore": 85,
  "status": "healthy",
  "burndownHealth": 90,
  "velocityHealth": 80,
  "blockerImpact": 10
}
```

### Burndown Chart

```bash
# Sprint burndown
cat .scrum/metrics/burndown-charts.json | jq '.sprints[0]'
```

---

## 🛠️ TROUBLESHOOTING

### Workflow Failed Mid-Phase

```bash
# Check workflow state
cat .scrum/workflow-state.json

# Resume from where it stopped
/scrum:full-workflow
# It will detect state and ask to resume
```

### Agent Timeout

```
If agent times out:
1. Workflow auto-retries (up to 3 times)
2. If still fails, workflow pauses
3. Review error in workflow-state.json
4. Fix issue
5. Resume workflow
```

### Invalid Backlog

```bash
# Validate backlog structure
.scrum/tests/test-product-backlog.sh

# If errors, fix manually or regenerate:
/scrum:backlog-builder
```

---

## ✅ BEST PRACTICES

### 1. Chọn YOLO Mode cho dự án đơn giản
- Fastest path to implementation
- Trust the automation

### 2. Chọn Standard Mode cho dự án phức tạp
- More control at phase transitions
- Review before proceeding

### 3. Chọn Guided Mode khi học Scrum
- Understand each step
- See what happens

### 4. Review documents sau Phase 2
- PRD, Architecture, UI/UX
- Make adjustments if needed

### 5. Monitor sprint health daily
- Keep health score > 80
- Address impediments quickly

### 6. Run retrospectives seriously
- Create actionable items
- Assign owners
- Track completion

### 7. Keep backlog fresh
- Add new items regularly
- Re-prioritize based on feedback
- Remove obsolete items

---

## 🎯 SUCCESS INDICATORS

### Your workflow is successful when:

✅ **Phase 1-2**: Complete documentation exists
✅ **Phase 3-4**: Prioritized, estimated backlog ready
✅ **Phase 5**: Sprint planned with realistic commitment
✅ **Phase 6**: Daily progress tracked, health > 80
✅ **Phase 6**: Sprint completed with demo
✅ **Phase 7**: Continuous backlog management active
✅ **Metrics**: Velocity established and predictable
✅ **Team**: Engaged and improving each sprint

---

## 📞 GETTING HELP

### Smart Guidance
```bash
/scrum:orchestrator
```

### Documentation
```
.scrum/INDEX.md              # All documentation
.scrum/README.md             # System overview
.scrum/USER_GUIDE.md         # Step-by-step guide
```

### Test Suite
```bash
cd .scrum
tests/run-all-tests.sh
```

---

## 🎉 TÓM TẮT

### Bạn đã có gì:
1. ✅ Master workflow command: `/scrum:full-workflow`
2. ✅ 7 phases tự động từ ý tưởng đến production
3. ✅ 3 automation modes (YOLO/Standard/Guided)
4. ✅ Complete documentation generation
5. ✅ Automated backlog creation
6. ✅ Sprint planning & execution automation
7. ✅ Continuous metrics tracking
8. ✅ Backlog management loop
9. ✅ Resume capability từ bất kỳ phase nào
10. ✅ Error handling & recovery

### Quy trình của bạn HOÀN CHỈNH với:
- ✅ Estimation (story points)
- ✅ Sprint Planning (capacity check, task breakdown)
- ✅ Daily Standup (sync & impediment tracking)
- ✅ Code Review (automated + manual)
- ✅ DoD Validation (quality gates)
- ✅ Sprint Review (demo & feedback)
- ✅ Sprint Retrospective (continuous improvement)
- ✅ Metrics Tracking (velocity, health, burndown)

---

**Sẵn sàng bắt đầu?**

```bash
/scrum:full-workflow
```

🚀 **Let's build something amazing!**
