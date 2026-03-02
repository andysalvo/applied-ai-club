# FOR_AGENTS

## Canonical Fact
A group of students is building a student AI hub at Penn State.

This is the canonical project anchor and must be treated as the highest-confidence context unless superseded by an explicit repository update. Keep wording student-led. Do not imply official institutional sponsorship, endorsement, or formal university governance unless a future repository document clearly states that status.

## Mission And Scope
This repository exists to make student collaboration with AI agents practical, aligned, and durable. The project itself is still being defined, so the core mission right now is infrastructure for collaboration:
- Capture ideas with low friction.
- Convert ideas into shareable artifacts.
- Maintain context continuity across sessions and contributors.
- Keep process lightweight so students can move quickly.

Current in-scope focus:
- Collaboration norms for humans and agents.
- Repo structure for brainstorming and artifact promotion.
- Contribution pathways usable in IDE, chat-only, and upload-first workflows.
- A recurring context refresh process so agents can self-orient quickly.

Current out-of-scope (for now):
- Final product architecture for the student AI hub.
- Official institutional representation documents.
- Heavy compliance or enterprise process layers.

## Collaboration Contract
This repository follows a side-by-side partner model. Agents should operate like a pragmatic project collaborator:
- Reflect what the user is building before expanding.
- Keep structure simple and shareable.
- Clarify only when uncertainty materially changes output quality.
- Suggest small next steps that preserve momentum.
- Favor concise, actionable language over abstract framing.

Core instruction to preserve:
"You are my side-by-side project partner.
Help organize, clarify, and prepare ideas so they’re clean and shareable.
Keep structure simple.
Clarify only when necessary.
Suggest small next steps when useful.
Reflect back what I’m building before expanding it."

## Student Workflow Model
Use a session-based model designed for real student work rhythms.

Session unit:
- One working session may include brainstorming, drafting, and promotion.
- Keep one thread note per session in `threads/`.

Session naming convention:
- Thread file: `threads/YYYY-MM-DD-topic.md`
- Branch (if available): `codex/session-YYYYMMDD-topic`

Session lifecycle:
1. Start with goal statement and one thread file.
2. Execute focused steps with the smallest viable output.
3. Promote durable outcomes to `docs/ideas/`, `docs/specs/`, or `docs/decisions/`.
4. Summarize next actions for the next contributor.

## Repository Map
Use this map to orient quickly:
- `FOR_AGENTS.md`: canonical source of truth for agent alignment and contribution behavior.
- `AGENTS.md`: concise public collaboration wrapper.
- `CONTRIBUTING.md`: concise human contributor wrapper and quick-start.
- `README.md`: top-level project summary and navigation.
- `threads/`: session notes and intermediate reasoning.
- `docs/ideas/`: reusable idea briefs.
- `docs/specs/`: implementation-ready specs and plans.
- `docs/decisions/`: decisions, alternatives, and tradeoffs.
- `skills/repo-context-curator/SKILL.md`: rules for maintaining embedded context sections in this file.
- `skills/repo-artifact-promoter/SKILL.md`: rules for manually promoting thread material into durable docs.
- `SECURITY.md`, `CODE_OF_CONDUCT.md`, `LICENSE`: public safety, conduct, and legal baseline.

## Contribution Operating Procedure
Default contribution flow:
1. Read this file first.
2. Confirm current goal and constraints from latest thread/doc context.
3. Create or continue a session note in `threads/`.
4. Produce the smallest concrete output that moves work forward.
5. Promote durable outputs to the correct `docs/` lane.
6. Record what changed and what is next.

When repository writes are available:
- Use a session branch.
- Keep commit messages intent-oriented.
- Prefer PR-based integration for shared work.

When repository writes are not available:
- Produce file-ready drafts with exact target paths.
- Ask for one missing file at a time.
- Keep output format copy-paste friendly.

## Disconnected Collaboration Mode
This workflow is first-class, not fallback.

Mode 1: `Maintainer-integrated mode`
- Maintainers can operate directly with repo-connected tooling and automations.
- Automations keep embedded context sections current.

Mode 2: `Collaborator-disconnected mode`
- Collaborators run ChatGPT sessions without direct write access to GitHub.
- End-of-session output is a paste-ready session file.
- The collaborator uploads that file to GitHub.
- Automations ingest uploaded session files and update embedded context sections.

## Free-Plan Upload-Only Path
This repository must work for students using free plans of popular AI tools.

Assume constraints:
- Limited file uploads.
- No connectors.
- No terminal.
- Inconsistent context persistence.

Upload-first protocol:
1. Upload `FOR_AGENTS.md` first.
2. Ask the model to summarize mission, current state, and next step.
3. Upload one additional file only when needed:
   - A thread file for live session work.
   - A target artifact file for edits.
4. Iterate in small chunks and request exact output paths.

Zip/folder protocol:
- If user uploads a folder/zip, still treat `FOR_AGENTS.md` as entrypoint.
- Read this file first, then only load relevant files for the requested task.
- Avoid broad file loading if one or two files are sufficient.

## External Handoff File Contract
Use this contract for collaborator sessions completed outside GitHub write access.

Filename convention:
- `threads/YYYY-MM-DD-topic.external.md`

Required metadata block at top of file (YAML frontmatter):
- `contributor`
- `model`
- `session_datetime_et`
- `objective`
- `confidence` (`low`, `medium`, or `high`)
- `repo_context_version` (from `FOR_AGENTS.md` `Last Updated` value)

Required sections in body:
- `## What Was Done`
- `## Novel Insights`
- `## Decisions Proposed`
- `## Open Questions`
- `## Proposed Next Actions`
- `## Promotion Suggestions`
- `## Paste-Ready Blocks`

Promotion suggestion values:
- `docs/ideas`
- `docs/specs`
- `docs/decisions`

Long files are acceptable when insight is genuinely novel, but structure must remain parseable.

## ChatGPT End-Of-Session Output Contract
When operating in collaborator-disconnected mode, ChatGPT MUST output one complete `.external.md` file body ready for paste/upload.

Output requirements:
- Must include required metadata keys.
- Must include every required section from the external handoff contract.
- Must clearly distinguish:
  - Work completed in chat
  - Proposed repository updates
  - Unresolved decisions requiring human follow-up
- Must not claim that git/PR/push actions were executed unless explicitly confirmed by a maintainer.

## Agent Behavior Rules
Operating rules for any agent collaborating in this repo:
- Start from this file.
- Re-anchor on canonical fact when context drifts.
- Be explicit about confidence when information is partial.
- Ask for missing context minimally, one file at a time.
- Prefer practical, deliverable-oriented responses.
- Avoid overengineering process language.
- Distinguish facts, assumptions, and proposed next steps.

Alignment rules:
- If repository files conflict, treat this file as source of truth and call out discrepancies.
- Preserve student-led framing unless explicitly changed.
- Do not invent non-existent project decisions.

## Branch And PR Rules
Default git posture:
- Session branch pattern: `codex/session-YYYYMMDD-topic`.
- Keep changes scoped to session objective.
- Use clear commit messages.
- Push and PR actions should be explicit, not implied.
- In disconnected collaborator mode, produce `.external.md` session files instead of simulating direct git actions.

Automation-specific branch rule:
- Automation commits go to `codex/automation-context`.
- Never auto-push directly to `main`.
- Use one rolling draft PR for context refreshes:
  - Title: `chore(context): automated context refresh`

Main branch safety baseline:
- No force-push.
- No deletion.
- Prefer merge visibility over hidden history rewrites.

## Artifact Promotion Rules
Promotion destination rules:
- `docs/ideas/`:
  - Concept framing, opportunity exploration, early synthesis.
- `docs/specs/`:
  - Implementation-ready plan with goals, scope, acceptance criteria.
- `docs/decisions/`:
  - Chosen direction with alternatives and tradeoffs.

Promotion criteria:
- Repeatedly referenced across sessions.
- Needed by multiple contributors.
- Required for implementation or coordination.
- Represents a clear decision or stable framework.

Promotion quality requirements:
- Preserve original intent and meaning.
- Remove redundant brainstorm noise.
- Include unresolved items when relevant.
- Add concrete next actions when useful.

## Security And Conduct Constraints
Always comply with:
- `SECURITY.md` for vulnerability reporting behavior.
- `CODE_OF_CONDUCT.md` for collaboration standards.

Minimum safety behaviors:
- Never commit or expose secrets/tokens.
- Do not publish exploit details in public issues.
- Keep communication respectful and factual.
- Escalate harmful behavior via maintainer contact routes.

Institutional claim constraints:
- Student-led wording is allowed.
- Official Penn State sponsorship claims are disallowed unless explicitly documented in repository source files.

## Missing Context Request Order
When context is incomplete, request files in this priority:
1. Relevant `threads/YYYY-MM-DD-topic.md`.
2. Target artifact file in `docs/ideas/`, `docs/specs/`, or `docs/decisions/`.
3. `README.md` for top-level orientation (if absent from current context).
4. `AGENTS.md` or `CONTRIBUTING.md` only if human wrapper details are required.

Request policy:
- Ask for one file at a time.
- Explain exactly why that file is needed.
- Continue with best-effort output if user cannot provide it.

## Default Response Shape
Default output structure:
1. One-paragraph restatement of user goal.
2. Brief current-state summary grounded in available files.
3. 2 to 4 concrete next actions.
4. Optional file proposal with exact path.
5. If needed, one minimal missing-file request.

Tone and style:
- Clear, direct, practical.
- No filler.
- No fabricated certainty.

## Starter Prompts
Prompt 1: Session start
```text
Use FOR_AGENTS.md as the source of truth.
Reflect what we are building and the current state in one short paragraph.
Then propose the smallest concrete next steps for this session.
```

Prompt 2: Promote thread to artifact
```text
Read this thread and promote the durable output into the correct docs folder.
Explain why you chose docs/ideas, docs/specs, or docs/decisions.
Include unresolved questions and the next action.
```

Prompt 3: Upload-only support
```text
I can only upload a few files.
Use FOR_AGENTS.md first, then tell me exactly one next file to upload and why.
```

Prompt 4: Repo alignment check
```text
Check this proposed change against FOR_AGENTS.md.
List any policy or workflow conflicts and suggest the minimal fix.
```

## Automation Contract
This repository uses two automation lanes to keep context fresh while preserving correctness.

Lane 1: `Hourly Context Sentinel`
- Schedule: `FREQ=HOURLY;INTERVAL=1;BYDAY=MO,TU,WE,TH,FR,SA,SU`
- Purpose: detect material changes and conflicts quickly, including new/changed `threads/*.external.md` files.
- Write policy: no write by default; write only when high-confidence material deltas exist.
- Notification policy: inbox on conflict/error/material change; silent no-op otherwise.
- Validation policy: fail-safe no-write when external session metadata/required sections are missing.
- Ignore policy: do not ingest `threads/TEMPLATE.external.md` as session evidence.

Lane 2: `Daily Repo Context Curator`
- Schedule: `FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR,SA,SU;BYHOUR=18;BYMINUTE=0`
- Time zone: `America/New_York`
- Purpose: full synthesis refresh and changelog discipline.
- Write policy: update only `Embedded Context Snapshot` and `Embedded Context Changelog`.
- Output policy: always inbox summary with `updated` or `no material change`.
- Ingestion policy: synthesize validated external session files into bounded context sections with compact source pointers.

Working directory:
- `/Users/andysalvo_1/Documents/GitHub/ai_hub_brain`

### Context Integrity Rules
- If conflict or uncertainty exists, automation MUST NOT write context sections.
- If required external-session metadata is missing, automation MUST NOT write context sections.
- Context updates MUST prioritize alignment-first natural-language planning, not execution logs.
- Context language SHOULD stay plain, concise, and planning-friendly.
- Automation MUST only edit inside marker-bounded context zones.
- Every high-impact context claim MUST include a source pointer using this format:
  - `[src: <path> | key: "<short quote key>"]`

Conflict examples requiring fail-safe no-write:
- Contradictory decisions in different artifacts.
- Unclear status of action items that materially changes next steps.
- Ambiguous ownership or authority claims.

Conflict handling behavior:
1. Do not mutate snapshot or changelog.
2. Open inbox report with:
   - Conflict summary
   - Conflicting source pointers
   - Exact human decision needed
3. Resume automated writes only after conflict resolution appears in source docs.

Required behavior when no conflict exists:
1. Run `repo-context-curator` logic.
2. Update only these sections when material changes exist:
   - `Embedded Context Snapshot`
   - `Embedded Context Changelog`
3. If no material change:
   - Do not rewrite this file.
   - Do not commit or push.
   - Open inbox summary: `no material change`.
4. If material changes exist:
   - Commit with message: `chore(context): refresh project context`
   - Push only to `codex/automation-context`
   - Open/update draft PR: `chore(context): automated context refresh`
   - Open inbox summary with changed section list.

Forbidden automation behavior:
- No writes to other context files.
- No direct push to `main`.
- No broad rewrite of unrelated sections.

## Embedded Context Snapshot
<!-- CONTEXT_SNAPSHOT_START -->
Last Updated: 2026-03-02

Goal:
- Build a student-led AI hub at Penn State with collaboration infrastructure that works for mixed agent/human workflows.

Current State:
- Public repo governance docs are in place. [src: README.md | key: "Start Here"]
- Single-source agent alignment is consolidated in `FOR_AGENTS.md`. [src: AGENTS.md | key: "canonical guidance lives in `FOR_AGENTS.md`"]
- Skills exist for context curation and artifact promotion. [src: skills/repo-context-curator/SKILL.md | key: "Update only `FOR_AGENTS.md` sections"]
- Project scope is still evolving. [src: README.md | key: "Project scope is still being defined"]
- Disconnected collaborator handoff is standardized through `.external.md` session files. [src: FOR_AGENTS.md | key: "External Handoff File Contract"]
- Automation is expected to ingest uploaded external sessions for context updates. [src: FOR_AGENTS.md | key: "Lane 1: `Hourly Context Sentinel`"]

Active Threads:
- Defining lightweight but strong collaboration systems for students. [src: FOR_AGENTS.md | key: "Student Workflow Model"]
- Ensuring free-plan usability for upload-first AI workflows. [src: FOR_AGENTS.md | key: "Free-Plan Upload-Only Path"]
- Maintaining context continuity with automation. [src: FOR_AGENTS.md | key: "Automation Contract"]

Decisions:
- `FOR_AGENTS.md` is the canonical source of truth for agent alignment. [src: CONTRIBUTING.md | key: "`FOR_AGENTS.md` is authoritative"]
- Student-led wording is required; no implied official sponsorship. [src: FOR_AGENTS.md | key: "Canonical Fact"]
- Promotion lanes are fixed to `docs/ideas`, `docs/specs`, `docs/decisions`. [src: FOR_AGENTS.md | key: "Artifact Promotion Rules"]

Open Questions:
- Final scope and concrete deliverables of the student AI hub. [src: README.md | key: "Project scope is still being defined"]
- Growth model for contributor governance and review rigor. [src: FOR_AGENTS.md | key: "Open Questions"]

Next Actions:
1. Start generating real session threads. [src: threads/README.md | key: "Use one file per session"]
2. Promote first durable spec in `docs/specs/`. [src: docs/specs/README.md | key: "implementation-ready specifications"]
3. Start collecting collaborator uploads using `threads/*.external.md`. [src: FOR_AGENTS.md | key: "Filename convention"]
4. Keep automation aligned to external-session validation and ingestion rules. [src: FOR_AGENTS.md | key: "Validation policy"]
5. Apply GitHub main-branch protection against force-push/deletion. [src: FOR_AGENTS.md | key: "Main branch safety baseline"]

Contribution Entry:
- Read this file.
- Use a session thread.
- Promote durable outputs to docs lanes.
- Keep changes concise and auditable.
<!-- CONTEXT_SNAPSHOT_END -->

## Embedded Context Changelog
<!-- CONTEXT_CHANGELOG_START -->
2026-03-02 14:20 ET | disconnected-handoff-hardening
- What changed: Added disconnected collaboration mode, external handoff contract, and ChatGPT end-of-session output requirements.
- Why changed: Most collaborators work without direct GitHub write access and need a reliable paste/upload workflow.
- Top source pointers: [src: FOR_AGENTS.md | key: "Disconnected Collaboration Mode"], [src: FOR_AGENTS.md | key: "External Handoff File Contract"]

2026-03-02 13:30 ET | migration
- What changed: Consolidated context governance into `FOR_AGENTS.md` with marker-bounded snapshot/changelog sections.
- Why changed: Reduce drift and support single-file upload alignment for student planning workflows.
- Top source pointers: [src: AGENTS.md | key: "canonical guidance lives in `FOR_AGENTS.md`"], [src: CONTRIBUTING.md | key: "`FOR_AGENTS.md` is authoritative"]
<!-- CONTEXT_CHANGELOG_END -->

## Sync Rule
Any PR that changes workflow, policy, repository map, or agent behavior must update `FOR_AGENTS.md` in the same PR.

Conflict rule:
- If `AGENTS.md`, `CONTRIBUTING.md`, or other guidance conflicts with this file, `FOR_AGENTS.md` is authoritative.

## Last Updated
2026-03-02
