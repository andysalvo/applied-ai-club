# Contributing

## Who This Is For
This repo is designed for mixed collaboration:
- People using Codex with IDE tooling.
- People using chat-only workflows.
- People reviewing work directly on GitHub.

You do not need advanced git skills to contribute. The expected flow is to state intent clearly, then have the agent turn intent into concrete actions.

## Free-Plan / Upload-Only Workflow
Use this path when collaborators are on free plans or working without repo connectors.

1. Upload `AGENT_START_HERE.md` first.
2. Ask the model to summarize project goal, current state, and next recommended step.
3. Upload one additional file based on need:
   - `docs/context/PROJECT_CONTEXT.md` for latest project snapshot.
   - One `threads/YYYY-MM-DD-topic.md` file for active brainstorming.
   - One target artifact file in `docs/ideas/`, `docs/specs/`, or `docs/decisions/`.
4. Ask for output in a concrete form (new thread summary, promoted artifact draft, or edit plan).

This keeps token usage predictable and works across chat-only free-tier tools.

## Working With Codex As Your Project Partner
Use Codex as an operator and collaborator:
- Start with your goal in plain language.
- Ask Codex to reflect back what you are building before it expands.
- Have Codex propose small, concrete next steps.
- Keep collaboration concise and action-oriented.

Default behavior in this repo:
- Codex may create/switch branches, edit files, and make local commits during a work session.
- Codex should push branches and create PRs when requested.
- Direct pushes to `main` are allowed in this sandbox, but PR-based integration is preferred for shared work.

## Session Workflow (Feature-Branch Style)
Use one branch per work session.

1. Start session
- Ask Codex to create a session branch:
`codex/session-YYYYMMDD-topic`

2. Work the session
- Keep exploratory notes in one thread file:
`threads/YYYY-MM-DD-topic.md`
- Let Codex save progress with local WIP commits when useful.

3. End session
- Choose one:
  - Keep local only.
  - Push branch for backup/collaboration.
  - Open PR (draft or ready) for integration.

## Branch, Commit, Push, PR Rules
- Branch naming: `codex/session-YYYYMMDD-topic`
- Commit style: clear intent-oriented messages.
- Push and PR are request-driven actions.
- Preferred integration flow: branch -> PR -> merge to `main`.
- Technical safety baseline: protect `main` from force-push and deletion.

## Thread Notes and Artifact Promotion
Treat session notes as working material, then promote selected outputs.

- `threads/`: raw session notes and brainstorming.
- `docs/ideas/`: reusable idea briefs.
- `docs/specs/`: implementation-ready plans/specs.
- `docs/decisions/`: decision records with rationale.

Promote thread content when it is:
- Referenced across multiple sessions.
- Needed for implementation planning.
- A significant project decision.

## How To Ask Codex (Prompt Recipes)
These are optional examples, not strict templates.

- Start session:
`Start a new session branch for [topic], create today's thread note, and reflect back my goal before making changes.`

- Convert idea to plan:
`Read this thread and promote the best direction into docs/specs with success criteria and test scenarios.`

- Prepare integration:
`Summarize what changed in this session, clean up commit messages if needed, then prepare a PR draft.`

- Save key decision:
`Extract the decision we made and write a concise decision record with alternatives and tradeoffs.`

## Modes: IDE Codex vs Chat-Only
IDE + Codex:
- Codex can operate directly on branches/files and run checks.

Chat-only:
- Provide intent and ask for operator-style actions explicitly.
- Ask for command summaries and file references so you can track what changed.

GitHub-only readers:
- Review current direction in `README.md`, collaboration rules in `AGENTS.md`, workflow in this file, and promoted artifacts in `docs/`.

## Safety and Review Guardrails
- Never commit secrets/tokens.
- Prefer clear rationale in commits and PR descriptions.
- Keep thread notes factual and respectful.
- Do not force-push `main`.
- Use private reporting for vulnerabilities (see `SECURITY.md`).

## Sync Rule For Ingestion Context
- Any workflow or policy change in this repository must update `AGENT_START_HERE.md` in the same PR.
- If collaboration structure changes, update `docs/context/PROJECT_CONTEXT.md` and note it in `docs/context/CONTEXT_CHANGELOG.md`.

## Quick Start Checklist
1. Read `AGENT_START_HERE.md`.
2. Read `AGENTS.md`.
3. Start a session branch with Codex.
4. Create/update one `threads/` note for the session.
5. Promote important outputs to `docs/ideas`, `docs/specs`, or `docs/decisions`.
6. Decide whether to keep local, push branch, or open PR.
