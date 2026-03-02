# Contributing

## Who This Is For
This repository supports mixed collaboration:
- Students using Codex in IDE workflows.
- Students using chat-only workflows on free plans.
- Contributors and reviewers working directly on GitHub.

Canonical operational and agent alignment guidance is centralized in `FOR_AGENTS.md`.

## Contribution Quick Flow
1. Read `FOR_AGENTS.md` first.
2. Open or continue one session note in `threads/`.
3. Produce a concrete output.
4. Promote durable outputs into `docs/ideas/`, `docs/specs/`, or `docs/decisions/`.
5. Summarize next actions for the next contributor.

## Matt Workflow (Disconnected ChatGPT -> GitHub)
1. Upload `FOR_AGENTS.md` to ChatGPT.
2. Run a session and think through the problem in chat.
3. Receive one final paste-ready `.external.md` file body from ChatGPT.
4. Paste/upload it to `threads/YYYY-MM-DD-topic.external.md` in GitHub.
5. Optionally request promotion from that thread into `docs/ideas`, `docs/specs`, or `docs/decisions`.

## Upload-Only Friendly Path
If you only have chat access:
1. Upload `FOR_AGENTS.md`.
2. Ask for a goal restatement and smallest next actions.
3. Ask ChatGPT for a complete `.external.md` file output at session end.
4. Upload one additional repository file only when requested.
5. Keep outputs concise, path-specific, and parseable.

## Safety Baseline
- Never expose secrets/tokens.
- Follow `SECURITY.md` for vulnerability reporting.
- Follow `CODE_OF_CONDUCT.md` for collaboration behavior.

## Source Of Truth
- `FOR_AGENTS.md` is authoritative for workflow and agent behavior.
- If any guidance conflicts across docs, follow `FOR_AGENTS.md`.
- Any PR that changes workflow/policy must update `FOR_AGENTS.md` in the same PR.
