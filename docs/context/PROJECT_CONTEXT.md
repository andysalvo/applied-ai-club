# PROJECT_CONTEXT

Last Updated: 2026-03-02

## Goal
A group of students is building a student AI hub at Penn State.
Current repository focus is collaboration infrastructure that helps students and agents turn brainstorming into organized, shareable project artifacts.

## Current State
- Repository-level public docs are in place: `README.md`, `AGENTS.md`, `CONTRIBUTING.md`, `LICENSE`, `CODE_OF_CONDUCT.md`, and `SECURITY.md`.
- Ingestion-first entrypoint is now `AGENT_START_HERE.md`.
- Artifact lanes exist for session notes and promoted outputs.
- Automation design is defined but requires creation in Codex Automations UI/directive flow.

## Active Threads
- Collaboration system bootstrapping for a student-led Penn State AI hub.
- Free-plan AI model compatibility (ChatGPT, Claude, Gemini) with upload-first workflow.
- Agentic context maintenance via repo context curation and artifact promotion patterns.

## Decisions
- Canonical project fact is fixed until superseded by explicit repo updates.
- Upload-only and partial-context workflows are first-class and documented.
- Context synthesis should live in `docs/context/` and remain concise.
- Promotion destinations are explicit: `docs/ideas/`, `docs/specs/`, `docs/decisions/`.

## Open Questions
- Final project scope and concrete product outcomes for the student AI hub.
- Governance model as contributor count grows.
- What cadence and thresholds should trigger artifact promotion at scale.

## Next Actions
1. Create and enable the daily context automation in Codex.
2. Generate the first real session note in `threads/`.
3. Promote one artifact to `docs/specs/` as an end-to-end workflow proof.
4. Configure GitHub branch protections to block force-push and deletion on `main`.

## Contribution Entry
- Read `AGENT_START_HERE.md` first.
- For full workflow, read `AGENTS.md` then `CONTRIBUTING.md`.
- Start work in a session branch and keep one thread note per session.
- Promote meaningful outcomes into `docs/ideas/`, `docs/specs/`, or `docs/decisions/`.
