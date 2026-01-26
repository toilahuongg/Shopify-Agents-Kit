# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.1.2] - 2026-01-26

### Changed
- **bin/sync.js**: Complete rewrite with new features:
  - Fixed directory from `.agent` to `.claude`
  - Added `--force` flag for overwrite
  - Added `--agents-only` and `--skills-only` options
  - Added `--dry-run` mode
  - Better output with agent/skill counts
  - Quick start guide after sync

## [1.1.1] - 2026-01-26

### Added
- **changelog**: New skill for generating changelogs following Keep a Changelog format

### Changed
- Updated README.md with improved documentation, tables, and installation instructions

## [1.1.0] - 2026-01-26

### Added
- **zustand-state**: New skill for state management with Zustand, including TypeScript patterns, persistence, and Shopify-specific stores
- **form-validation**: New skill for form validation with Zod schemas and Conform library for Remix applications
- **security-hardening**: New skill covering OWASP Top 10, authentication, webhook HMAC verification, data encryption, and secure coding patterns
- **changelog**: New skill for generating and maintaining changelogs

### Changed
- Updated `shopify-developer` agent with new skills (zustand-state, form-validation, security-hardening)
- Updated `tech-lead` agent with security-hardening skill
- Renamed agent directory from `.agent` to `.claude`
- Migrated commands to skills format
- Consolidated workflows structure

## [1.0.4] - 2026-01-26

### Added
- Initial npm release with 64 skills
- 11 specialized agents (3d-developer, brainstorm, end-user-writer, growth-hacker, media-specialist, product-designer, project-manager, qa-specialist, shopify-developer, tech-lead, technical-writer)
- Complete Shopify ecosystem coverage (13 skills)
- Three.js suite (10 skills)
- Frontend & design skills
- Git workflow skills
- Meta-skills for agent/skill/workflow creation

### Changed
- Refactored from `.scrum` system to `.claude` directory structure

## [1.0.0] - 2025-11-11

### Added
- Initial project structure
- Scrum Agile System implementation
- Project manager agent
- Shopify app development workflows
- User guide documentation

[Unreleased]: https://github.com/user/repo/compare/v1.1.2...HEAD
[1.1.2]: https://github.com/user/repo/compare/v1.1.1...v1.1.2
[1.1.1]: https://github.com/user/repo/compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com/user/repo/compare/v1.0.4...v1.1.0
[1.0.4]: https://github.com/user/repo/compare/v1.0.0...v1.0.4
[1.0.0]: https://github.com/user/repo/releases/tag/v1.0.0
