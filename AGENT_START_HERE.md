# AGENT_START_HERE

## Canonical Project Fact
A group of students is building a student AI hub at Penn State.

Use this as a hard anchor until new verified facts are added.
Treat this as a student-led project context. Do not imply official institutional sponsorship unless a future repository document explicitly confirms it.

## Why This File Exists
If you only upload one file to an AI model, upload this one first.

This file is designed for:
- Link scraping agents with partial context.
- Chat-only workflows.
- Free-tier model usage where upload limits matter.
- Zip/folder uploads where the model still needs one clear starting point.

## Operating Assumptions
- Assume no repo connector is available.
- Assume no terminal or git credentials are available.
- Assume the user may only provide 1-3 files.
- Prefer concise outputs and ask for one additional file at a time when context is missing.
- Keep outputs in student-collaboration style: clear, practical, and low friction.

## Strict Read Order
After reading this file, process context in this order:

1. `AGENTS.md`
2. `CONTRIBUTING.md`
3. `README.md`
4. `threads/` (session notes)
5. `docs/*` (promoted artifacts and shared context)

When available, read `docs/context/PROJECT_CONTEXT.md` before deep-diving into individual thread files.

## Repository Map
- `AGENTS.md`: collaboration contract and core operating instruction.
- `CONTRIBUTING.md`: practical workflow for branches, sessions, and promotions.
- `README.md`: public-facing summary and navigation.
- `threads/`: one file per work session; brainstorming and intermediate reasoning.
- `docs/ideas/`: reusable idea briefs.
- `docs/specs/`: implementation-ready plans/specs.
- `docs/decisions/`: decision records and tradeoffs.
- `docs/context/PROJECT_CONTEXT.md`: current synthesized state.
- `docs/context/CONTEXT_CHANGELOG.md`: dated summary deltas from context refreshes.
- `skills/repo-context-curator/SKILL.md`: rules for maintaining project context files.
- `skills/repo-artifact-promoter/SKILL.md`: rules for promoting session output into durable artifacts.

## Missing Context Request Order
If you cannot complete a task, request missing files in this priority:

1. `docs/context/PROJECT_CONTEXT.md`
2. Relevant latest `threads/YYYY-MM-DD-topic.md`
3. Target output destination file in `docs/ideas/`, `docs/specs/`, or `docs/decisions/`
4. `CONTEXT_CHANGELOG.md` for recent changes

Ask for one file at a time, explain why, and keep requests minimal.

## Default Response Shape
When assisting contributors, return:
1. Goal restatement in one short paragraph.
2. Current-state summary from available context.
3. 2-4 concrete next actions.
4. Optional file proposal (exact path) if output should be saved.

If context is thin, lead with a confidence note and ask for the single next-most-useful file.

## Starter Prompt (Portable Across Models)
Use this copy/paste prompt when bootstrapping a session:

```text
You are my side-by-side project partner for this repository.
Start by reflecting what we are building and what is already known.
Then propose the smallest concrete next steps.
If context is missing, ask for exactly one file at a time in priority order.
Keep recommendations concise and actionable.
```

## Maintenance Rule
If repo workflow, policy, or folder structure changes, update this file in the same PR.

Last updated: 2026-03-02
