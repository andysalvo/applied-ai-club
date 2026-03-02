---
name: repo-context-curator
description: Refresh project context for this repository by scanning FOR_AGENTS.md, AGENTS.md, CONTRIBUTING.md, README.md, docs/*, and threads/*, then updating only the marker-bounded Embedded Context Snapshot and Embedded Context Changelog sections in FOR_AGENTS.md when high-confidence material changes exist.
---

# Repo Context Curator

Use this skill when you need to maintain current repository context while preserving a strict single-source model.

## Inputs
- `FOR_AGENTS.md`
- `AGENTS.md`
- `CONTRIBUTING.md`
- `README.md`
- `threads/*.md`
- `docs/ideas/*.md`
- `docs/specs/*.md`
- `docs/decisions/*.md`

## Required Outputs
- Update only `FOR_AGENTS.md` sections:
  - `## Embedded Context Snapshot`
  - `## Embedded Context Changelog`
- Respect marker bounds:
  - `<!-- CONTEXT_SNAPSHOT_START -->` ... `<!-- CONTEXT_SNAPSHOT_END -->`
  - `<!-- CONTEXT_CHANGELOG_START -->` ... `<!-- CONTEXT_CHANGELOG_END -->`
- Keep all other sections unchanged unless explicitly requested by a human maintainer.

## Workflow
1. Read source documents and thread/artifact files.
2. Run deterministic quality gates in order:
   - `gate_1`: source completeness check
   - `gate_2`: contradiction check
   - `gate_3`: evidence pointer coverage check
   - `gate_4`: bounded-edit check
3. If any gate fails:
   - Return fail-safe `no write` result.
   - Open inbox escalation with: conflict summary, conflicting sources, and exact human decision needed.
4. If all gates pass, identify material deltas since the last context snapshot.
5. If no material deltas:
   - Do not rewrite `FOR_AGENTS.md`.
   - Return a clear "no material change" status summary.
6. If material deltas exist:
   - Rewrite only the two embedded context sections.
   - Use compact source pointers per high-impact claim:
     - `[src: <path> | key: "<short quote key>"]`
   - Keep context language plain and planning-friendly for student chat workflows.
   - Keep statements factual and avoid speculation.
   - Keep text concise for upload-first workflows.
   - Append one dated changelog entry inside `## Embedded Context Changelog` with:
     - date/time (ET)
     - what changed
     - why it changed
     - top source pointers used

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
- Do not create or update separate context files outside `FOR_AGENTS.md`.
- Avoid large rewrites that erase historical continuity.
- Do not write context sections when unresolved contradiction or uncertainty exists.
