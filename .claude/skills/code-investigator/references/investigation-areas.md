# Investigation Area Checklists

Detailed checklists for each subagent investigation area. Load this file and pass relevant sections to each subagent prompt.

## Table of Contents
1. [Security Audit](#1-security-audit)
2. [Dead Code Detection](#2-dead-code-detection)
3. [Architecture Review](#3-architecture-review)
4. [Error & Edge Case Analysis](#4-error--edge-case-analysis)
5. [Dependency Audit](#5-dependency-audit)
6. [Test Coverage Analysis](#6-test-coverage-analysis)
7. [Performance Profiling](#7-performance-profiling)
8. [TypeScript Strictness](#8-typescript-strictness)
9. [API Contract Check](#9-api-contract-check)
10. [Accessibility Audit](#10-accessibility-audit)

---

## 1. Security Audit

### Injection Risks
- SQL injection: raw queries with string interpolation
- Command injection: `exec()`, `spawn()` with unsanitized input
- XSS: `dangerouslySetInnerHTML`, unescaped template literals in HTML
- Path traversal: file operations with user-controlled paths
- SSRF: HTTP requests with user-controlled URLs
- Template injection: user input in template engines

### Authentication & Authorization
- Routes without auth middleware
- Missing CSRF protection on state-changing endpoints
- Hardcoded credentials, API keys, tokens in source code
- Weak session management (predictable tokens, no expiry)
- Missing role/permission checks on sensitive operations
- JWT without proper validation (algorithm confusion, no expiry)

### Data Exposure
- Secrets in `.env` committed to git
- API keys in client-side code
- Verbose error messages exposing internals
- Debug endpoints accessible in production
- Sensitive data in logs (passwords, tokens, PII)
- Missing `.gitignore` entries for sensitive files

### Crypto
- Weak hashing (MD5, SHA1 for passwords)
- Hardcoded encryption keys
- Insecure random number generation (`Math.random()` for security)

---

## 2. Dead Code Detection

### Unused Exports
- Exported functions/classes/constants not imported anywhere
- Re-exports that no consumer uses
- Index files exporting modules nobody imports

### Unreachable Code
- Code after `return`, `throw`, `break`, `continue`
- Conditions that are always true/false
- Branches that can never execute
- Deprecated feature flags that are always on/off

### Orphan Files
- Files not imported by any other file
- Test files for deleted source files
- Config files for removed features
- Migration files for rolled-back changes

### Unused Dependencies
- Packages in `dependencies` not imported in source
- Packages in `devDependencies` not used in tests/scripts/config
- Duplicate packages (same purpose, different lib)
- Packages imported but only for types (should be `devDependencies`)

### Redundant Code
- Duplicate functions doing the same thing in different files
- Copy-pasted code blocks (>10 lines identical)
- Wrapper functions that add no logic
- Re-implementations of existing utility/library functions

---

## 3. Architecture Review

### Pattern Violations
- Business logic in UI components (should be in services/hooks)
- Direct DB access from routes (should use repository/service layer)
- Mixing concerns (API calls + rendering + state in one file)
- God files (>500 lines with multiple responsibilities)

### Coupling Issues
- Circular dependencies between modules
- Deep import paths across module boundaries
- Shared mutable state between unrelated modules
- Tight coupling to third-party libraries without abstraction

### Missing Abstractions
- Repeated patterns that should be extracted (>3 occurrences)
- Configuration scattered across files (should be centralized)
- Missing error boundary/handler patterns
- No clear data flow direction

### Naming & Organization
- Inconsistent file/folder naming conventions
- Misplaced files (wrong directory for their purpose)
- Unclear module boundaries
- Missing barrel exports where expected

---

## 4. Error & Edge Case Analysis

### Unhandled Errors
- Async operations without try/catch or `.catch()`
- Missing error boundaries in React component trees
- Event handlers that can throw without catching
- Stream/WebSocket connections without error handlers

### Race Conditions
- Concurrent state updates without synchronization
- TOCTOU (time-of-check-time-of-use) in file operations
- Stale closure issues in React useEffect
- Missing debounce/throttle on rapid user actions

### Edge Cases
- Empty array/object not handled
- Null/undefined not checked before access
- Division by zero possibilities
- Integer overflow in calculations
- Unicode/special characters in user input
- Timezone-related date handling issues

### Missing Validation
- API endpoints accepting any shape of data
- File uploads without size/type validation
- Missing pagination limits (unbounded queries)
- No rate limiting on public endpoints

---

## 5. Dependency Audit

### Commands to Run
```bash
# NPM/Node projects
npm audit
npm outdated
npx depcheck

# Python projects
pip-audit
pip list --outdated

# Check for duplicate packages
npm ls --all 2>/dev/null | grep -i "deduped" | wc -l
```

### Checks
- Known vulnerabilities (CVEs) in current versions
- Major version updates available (breaking changes)
- Deprecated packages still in use
- Packages with no maintenance (>2 years no update)
- License compatibility issues (GPL in MIT project)
- Unnecessarily large packages (check bundle impact)
- Native/binary dependencies that complicate deployment

---

## 6. Test Coverage Analysis

### Coverage Gaps
- Critical business logic without unit tests
- API endpoints without integration tests
- Error paths not tested (only happy path)
- Edge cases identified in Area 4 without tests
- Database operations without tests

### Test Quality
- Tests that always pass (no real assertions)
- Tests tightly coupled to implementation (mock everything)
- Missing cleanup/teardown (test pollution)
- Flaky tests (timing-dependent, order-dependent)
- Tests that test framework behavior instead of app logic

### Missing Test Types
- No unit tests at all
- No integration tests
- No E2E tests for critical user flows
- No snapshot tests for UI components (if applicable)
- No load/performance tests for APIs

---

## 7. Performance Profiling

### Database
- N+1 query patterns
- Missing indexes on frequently queried columns
- Large unbounded queries without pagination
- No connection pooling
- Queries inside loops

### Frontend
- Large bundle size (>500KB JS)
- Missing code splitting / lazy loading
- Unnecessary re-renders (missing memo/useMemo/useCallback)
- Large images not optimized
- No caching strategy (HTTP cache headers, service worker)

### API
- No response caching
- Synchronous operations that should be async/queued
- Missing compression (gzip/brotli)
- Large payloads without pagination
- No request deduplication

---

## 8. TypeScript Strictness

### Type Safety
- Usage of `any` type (count and list locations)
- Missing return types on exported functions
- Type assertions (`as`) that bypass safety
- Non-null assertions (`!`) without justification
- `@ts-ignore` / `@ts-expect-error` comments

### Configuration
- `strict: false` in tsconfig
- Disabled strict checks (noImplicitAny, strictNullChecks)
- Missing `exactOptionalPropertyTypes`
- Overly permissive `skipLibCheck`

---

## 9. API Contract Check

### REST APIs
- Missing request validation schemas
- Inconsistent response formats
- Missing error response schemas
- No API versioning strategy
- Undocumented endpoints
- Missing HTTP status codes (only 200/500)

### GraphQL APIs
- Missing input validation
- No query depth/complexity limits
- N+1 in resolvers (missing DataLoader)
- Exposed introspection in production
- Missing field-level authorization

---

## 10. Accessibility Audit

### HTML Semantics
- Missing `alt` text on images
- Non-semantic elements for interactive UI (`div` as button)
- Missing form labels
- Missing heading hierarchy (h1 > h2 > h3)
- Missing landmark regions (main, nav, aside)

### ARIA
- Missing `aria-label` on icon-only buttons
- Incorrect ARIA roles
- Missing live regions for dynamic content
- Focus management in modals/dialogs

### Keyboard
- Non-focusable interactive elements
- Missing keyboard event handlers alongside mouse events
- Focus traps in modals not implemented
- No visible focus indicators
