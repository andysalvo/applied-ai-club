---
name: repo-context-curator
description: Refresh project context for this repository by scanning AGENT_START_HERE.md, AGENTS.md, CONTRIBUTING.md, README.md, docs/*, and threads/*, then updating docs/context/PROJECT_CONTEXT.md and docs/context/CONTEXT_CHANGELOG.md only when material changes exist.
---

# Repo Context Curator

Use this skill when you need to maintain a current, concise project context snapshot that is upload-friendly for free-tier AI tools.

## Inputs
- `AGENT_START_HERE.md`
- `AGENTS.md`
- `CONTRIBUTING.md`
- `README.md`
- `threads/*.md`
- `docs/ideas/*.md`
- `docs/specs/*.md`
- `docs/decisions/*.md`
- Existing `docs/context/PROJECT_CONTEXT.md`
- Existing `docs/context/CONTEXT_CHANGELOG.md`

## Required Outputs
- Update `docs/context/PROJECT_CONTEXT.md` sections:
  - Goal
  - Current State
  - Active Threads
  - Decisions
  - Open Questions
  - Next Actions
  - Contribution Entry
- Append a dated delta block to `docs/context/CONTEXT_CHANGELOG.md` when material changes are detected.

## Workflow
1. Read source documents and thread/artifact files.
2. Identify material deltas since the last context snapshot.
3. If no material deltas:
   - Do not rewrite `PROJECT_CONTEXT.md`.
   - Do not append changelog entries.
   - Return a clear "no material change" status summary.
4. If material deltas exist:
   - Rewrite only sections affected by new information.
   - Keep statements factual and avoid speculation.
   - Keep text concise for upload-first workflows.
   - Append one dated changelog entry describing meaningful changes.

## Material Change Rules
Treat the following as material:
- New project facts, decisions, constraints, or workflow rules.
- New promoted artifacts in `docs/ideas`, `docs/specs`, or `docs/decisions`.
- New active thread directions that affect next actions.

Treat the following as non-material:
- Wording-only edits that do not change meaning.
- Cosmetic formatting changes.
- Reordering equivalent bullets with unchanged content.

## Guardrails
- Preserve the canonical project fact unless explicitly superseded by repository updates.
- Do not imply official Penn State sponsorship unless a source file states it.
- Never include secrets or sensitive data.
- Avoid large rewrites that erase historical continuity.
