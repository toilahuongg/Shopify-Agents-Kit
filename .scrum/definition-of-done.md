# Definition of Done (DoD)

## Purpose
The Definition of Done is a formal checklist of quality criteria that **must** be met for a Product Backlog Item to be considered "Done". This creates a shared understanding across the Scrum Team and ensures consistent quality.

## Team Definition of Done

Every Product Backlog Item (User Story, Bug, Spike) must meet ALL criteria below before it can be marked "Done" and included in the Increment.

---

## ✅ Code Quality

- [ ] **Code written and follows team coding standards**
  - Naming conventions followed (camelCase for variables, PascalCase for classes)
  - No commented-out code
  - No console.log() or debug statements in production code
  - Code is readable and self-documenting

- [ ] **Peer code review completed and approved**
  - At least one team member has reviewed the code
  - All review comments addressed
  - No unresolved conversations in PR
  - Code review checklist completed

- [ ] **No critical or high-severity bugs**
  - Zero critical bugs (P0)
  - Zero high-severity bugs (P1)
  - Medium/low bugs documented and accepted by Product Owner

---

## ✅ Testing

- [ ] **Unit tests written and passing**
  - New code has unit test coverage ≥80%
  - All unit tests pass locally and in CI
  - Tests follow AAA pattern (Arrange, Act, Assert)
  - Edge cases and error conditions tested

- [ ] **Integration tests passing**
  - API endpoints tested with integration tests
  - Database interactions verified
  - External service integrations tested (or mocked)
  - All integration tests pass in CI

- [ ] **Manual testing completed**
  - Feature tested in development environment
  - All acceptance criteria manually verified
  - Happy path and error scenarios tested
  - Cross-browser testing (if UI feature)

---

## ✅ Acceptance Criteria

- [ ] **All acceptance criteria met**
  - Every Given-When-Then criterion verified
  - Edge cases handled as specified
  - Error messages clear and user-friendly
  - Performance requirements met (if specified)

- [ ] **Product Owner acceptance received**
  - Demo provided to Product Owner
  - Product Owner has tested functionality
  - Product Owner explicitly accepted the work
  - Any feedback incorporated or scheduled

---

## ✅ Code Integration

- [ ] **Code merged to main branch**
  - Feature branch merged via Pull Request
  - No merge conflicts
  - CI/CD pipeline passes (build, lint, test)
  - Branch deleted after merge

- [ ] **Deployed to staging environment**
  - Code successfully deployed to staging
  - Smoke tests pass in staging
  - No deployment errors or warnings
  - Environment variables configured correctly

---

## ✅ Documentation

- [ ] **Code documentation updated**
  - Complex functions have JSDoc/comments
  - API endpoints documented (if applicable)
  - README updated (if setup changed)
  - Architecture diagrams updated (if architecture changed)

- [ ] **User-facing documentation updated**
  - User guide updated (for new features)
  - Help text or tooltips added (in UI)
  - API documentation updated (for API changes)
  - Release notes prepared

---

## ✅ Accessibility & Performance

- [ ] **Accessibility standards met**
  - WCAG 2.1 AA compliance (for UI features)
  - Keyboard navigation works
  - Screen reader compatible
  - Color contrast ratios pass (4.5:1 for normal text)

- [ ] **Performance benchmarks met**
  - Page load time <3 seconds
  - API response time <200ms (or as specified)
  - No memory leaks detected
  - Database query performance optimized

---

## ✅ Security

- [ ] **Security checklist completed**
  - Input validation and sanitization implemented
  - No SQL injection vulnerabilities
  - No XSS vulnerabilities
  - Authentication and authorization tested
  - Sensitive data encrypted (if applicable)
  - No hardcoded secrets or API keys

---

## ✅ Non-Functional Requirements

- [ ] **Error handling implemented**
  - Try-catch blocks where appropriate
  - User-friendly error messages
  - Errors logged for debugging
  - Graceful degradation for failures

- [ ] **Logging and monitoring**
  - Key operations logged
  - Error tracking configured (e.g., Sentry)
  - Metrics instrumented (if applicable)
  - Alerts configured (for critical paths)

---

## Special Criteria by Item Type

### For User Stories
- [ ] User value delivered (solves the stated problem)
- [ ] UI/UX reviewed and approved
- [ ] User flow tested end-to-end

### For Bugs
- [ ] Root cause identified and fixed
- [ ] Regression test added
- [ ] Similar issues checked and addressed
- [ ] Bug verified as fixed in staging

### For Spikes (Research)
- [ ] Research findings documented
- [ ] Recommendation provided with rationale
- [ ] Follow-up stories created (if needed)
- [ ] Presentation given to team

### For Technical Debt
- [ ] Code refactored and simplified
- [ ] Test coverage maintained or improved
- [ ] No new bugs introduced
- [ ] Performance same or better

---

## DoD Validation Checklist

Before marking an item "Done" in Sprint Review, validate:

```markdown
## Item: [PBI-XXX] [Title]

### Code Quality
- [✓] Code follows standards
- [✓] Peer review approved
- [✓] No critical/high bugs

### Testing
- [✓] Unit tests ≥80% coverage
- [✓] Integration tests pass
- [✓] Manual testing complete

### Acceptance
- [✓] All criteria met
- [✓] PO accepted

### Integration
- [✓] Merged to main
- [✓] Deployed to staging

### Documentation
- [✓] Code docs updated
- [✓] User docs updated

### Quality
- [✓] Accessible (WCAG 2.1 AA)
- [✓] Performance benchmarks met
- [✓] Security checklist complete

**Status: ✅ DONE** (Ready for Sprint Review)
```

---

## DoD Evolution

The Definition of Done should evolve over time to raise quality standards.

### Current Version: 1.0
**Effective Date:** January 22, 2024

**Changelog:**
- v1.0 (Jan 22, 2024): Initial Definition of Done created

### How to Update DoD

1. **Retrospective Discussion**: Team identifies quality improvements
2. **Propose Changes**: New criteria suggested
3. **Team Agreement**: Entire Scrum Team agrees
4. **Document**: Update this file with new version
5. **Communicate**: Announce changes in Sprint Planning

**Example Evolution:**
- Sprint 1-3: Basic DoD (code quality, testing, acceptance)
- Sprint 4-6: Add accessibility and performance
- Sprint 7+: Add security checklist and monitoring

---

## DoD vs Definition of Ready

**Definition of Done (DoD):** Checklist for completing work
- Applied when marking item "Done"
- Ensures quality of the Increment
- Team's commitment to quality

**Definition of Ready (DoR):** Checklist for starting work
- Applied before Sprint Planning
- Ensures item is clear and ready
- Product Owner's responsibility

---

## Exceptions

In rare cases, the Product Owner may accept an item that doesn't fully meet DoD if:

1. **Business Critical**: Urgent business need (customer emergency, security patch)
2. **Partial Acceptance**: Explicitly defined subset meets DoD
3. **Technical Debt Created**: Missing work logged as technical debt item
4. **Time-Boxed Fix**: Commitment to complete within next Sprint

**Process for Exception:**
1. Product Owner and Development Team discuss
2. Explicitly document what's missing
3. Create follow-up story for incomplete work
4. Update Sprint Retrospective with lessons learned

---

## Benefits of Strong DoD

✅ **Quality**: Consistent quality across all work
✅ **Transparency**: Everyone knows what "Done" means
✅ **Trust**: Stakeholders trust Increments are production-ready
✅ **Predictability**: Velocity is based on truly complete work
✅ **Technical Excellence**: Prevents technical debt accumulation
✅ **Team Alignment**: Shared understanding of quality standards

---

## Anti-Patterns to Avoid

❌ **"Done" but not really**: Marking items done with incomplete work
❌ **DoD Waivers**: Regularly skipping DoD criteria
❌ **DoD Negotiation**: Weakening DoD under pressure
❌ **Documentation Only**: Having DoD but not enforcing it
❌ **One-Size-Fits-All**: Same DoD for all item types without consideration

---

## Enforcement

**Responsibility:**
- **Development Team**: Ensures work meets DoD before Demo
- **Scrum Master**: Coaches team on DoD adherence
- **Product Owner**: Validates acceptance criteria but trusts team on DoD
- **increment-validator Agent**: Automates DoD checklist validation

**Process:**
1. Developer completes work
2. Peer review validates code quality
3. Developer runs DoD checklist
4. `increment-validator` agent validates automated checks
5. Product Owner reviews acceptance criteria
6. Only if ALL criteria met → Mark "Done" in Sprint Review

---

## Tools Integration

**Automated Validation:**
- CI/CD pipeline enforces test coverage and passing tests
- Linting enforces code standards
- Security scanning detects vulnerabilities
- Performance monitoring tracks benchmarks
- Accessibility tools check WCAG compliance

**Manual Validation:**
- Code review (GitHub PR review)
- Product Owner acceptance (Sprint Review demo)
- `increment-validator` agent (DoD checklist automation)

---

## Example: Applying DoD

### Before Sprint Review

**Item:** [PBI-002] Bulk product tagging

**DoD Validation:**
```
✅ Code Quality
  ✅ Code follows standards (Prettier + ESLint pass)
  ✅ Peer review approved (PR #123 approved by @senior-dev)
  ✅ No critical/high bugs (Zero bugs found)

✅ Testing
  ✅ Unit tests ≥80% (coverage: 87%)
  ✅ Integration tests pass (12/12 tests passing)
  ✅ Manual testing complete (Tested in staging)

✅ Acceptance Criteria
  ✅ All criteria met (4/4 verified)
  ✅ PO accepted (Demo completed Jan 25)

✅ Integration
  ✅ Merged to main (PR #123 merged Jan 24)
  ✅ Deployed to staging (Deploy #456 successful)

✅ Documentation
  ✅ Code docs updated (JSDoc added)
  ✅ User docs updated (README and help text added)

✅ Quality
  ✅ Accessible (WCAG 2.1 AA compliant)
  ✅ Performance met (<100ms API response)
  ✅ Security checked (No vulnerabilities)

RESULT: ✅ MEETS DEFINITION OF DONE
Action: Mark as "Done" in Sprint Review, include in velocity
```

### Item Not Meeting DoD

**Item:** [PBI-003] Bulk price updates

**DoD Validation:**
```
✅ Code Quality - OK
✅ Testing - OK
⚠️ Acceptance Criteria
  ✅ 3/4 criteria met
  ❌ Preview before confirming (not implemented)
✅ Integration - OK
✅ Documentation - OK
⚠️ Quality
  ❌ Performance (API taking 800ms, target <200ms)

RESULT: ❌ DOES NOT MEET DEFINITION OF DONE
Action:
1. Do NOT mark as "Done" in Sprint Review
2. Do NOT include in velocity
3. Return to Product Backlog
4. Create follow-up stories:
   - [PBI-010] Add preview UI (3 points)
   - [PBI-011] Optimize price update API (2 points)
5. Discuss in Sprint Retrospective: Why was performance not caught earlier?
```

---

**Remember:** The Definition of Done is not optional. It's the team's commitment to quality. When tempted to skip DoD criteria, ask: "Would we be proud to ship this to production right now?" If the answer is no, the work is not "Done".
