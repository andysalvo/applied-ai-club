# threads

Session-level working notes live here.

Use one file per session:
- `YYYY-MM-DD-topic.md`
- `YYYY-MM-DD-topic.external.md` for disconnected ChatGPT collaborator handoffs.

Purpose:
- Capture brainstorming and intermediate thinking.
- Keep a trace of what was explored before promotion.

External handoff requirement (`*.external.md`):
- Must include YAML frontmatter metadata:
  - `contributor`
  - `model`
  - `session_datetime_et`
  - `objective`
  - `confidence`
  - `repo_context_version`
- Must include sections:
  - `## What Was Done`
  - `## Novel Insights`
  - `## Decisions Proposed`
  - `## Open Questions`
  - `## Proposed Next Actions`
  - `## Promotion Suggestions`
  - `## Paste-Ready Blocks`

Example filename:
- `2026-03-02-student-hub-kickoff.external.md`
- Starter template: `TEMPLATE.external.md`

Example header:
```yaml
---
contributor: "Matt"
model: "ChatGPT"
session_datetime_et: "2026-03-02 14:20"
objective: "Clarify scope for the student AI hub"
confidence: "medium"
repo_context_version: "2026-03-02"
---
```

Promotion rule:
- Move important outcomes into `docs/ideas/`, `docs/specs/`, or `docs/decisions/` when they become reusable or implementation-relevant.
