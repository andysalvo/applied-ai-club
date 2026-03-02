---
name: repo-artifact-promoter
description: Promote material from session threads and context summaries into durable artifacts under docs/ideas, docs/specs, or docs/decisions with explicit rationale and scope clarity. Use manually when contributors ask to convert brainstorming into shareable outputs.
---

# Repo Artifact Promoter

Use this skill on demand to convert thread-level brainstorming into reusable repository artifacts.

## Inputs
- `FOR_AGENTS.md` (canonical rules and contribution model)
- `threads/*.md` session files
- Existing files in:
  - `docs/ideas/`
  - `docs/specs/`
  - `docs/decisions/`

## Destination Selection
Choose destination by intent:
- `docs/ideas/` for concept framing and exploration.
- `docs/specs/` for implementation-ready planning and acceptance criteria.
- `docs/decisions/` for committed choices, alternatives, and tradeoffs.

Always state why the selected destination is appropriate.

## Workflow
1. Restate the source intent from the thread.
2. Extract key points and remove redundant discussion fragments.
3. Determine destination folder based on artifact type.
4. Create or update the target file with clear, structured sections.
5. Add a brief rationale block:
   - Why promoted now.
   - Why this destination.
   - What remains unresolved.

## Quality Bar
- Preserve factual meaning from source threads.
- Keep language concise, plain, and shareable for student planning contexts.
- Include concrete next actions when useful.
- Avoid overengineering structure or adding unnecessary process overhead.

## Guardrails
- Do not present brainstorming as final decisions unless explicitly confirmed.
- Do not invent claims about institutional endorsement.
- Keep student-collaboration tone practical and actionable.
- Treat `FOR_AGENTS.md` as source of truth if other documents conflict.
