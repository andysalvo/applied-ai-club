#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FOR_AGENTS_FILE="${ROOT_DIR}/FOR_AGENTS.md"
AGENTS_FILE="${ROOT_DIR}/AGENTS.md"
CONTRIBUTING_FILE="${ROOT_DIR}/CONTRIBUTING.md"
README_FILE="${ROOT_DIR}/README.md"
TEMPLATE_EXTERNAL_FILE="${ROOT_DIR}/threads/TEMPLATE.external.md"

fail() {
  echo "ERROR: $*" >&2
  exit 1
}

for required_file in "${FOR_AGENTS_FILE}" "${AGENTS_FILE}" "${CONTRIBUTING_FILE}" "${README_FILE}"; do
  [[ -f "${required_file}" ]] || fail "Missing required file: ${required_file}"
done

[[ -f "${TEMPLATE_EXTERNAL_FILE}" ]] || fail "Missing required external session template: ${TEMPLATE_EXTERNAL_FILE}"

required_sections=(
  "## Disconnected Collaboration Mode"
  "## External Handoff File Contract"
  "## ChatGPT End-Of-Session Output Contract"
  "## Automation Contract"
  "### Context Integrity Rules"
  "## Embedded Context Snapshot"
  "## Embedded Context Changelog"
  "## Sync Rule"
)

for section in "${required_sections[@]}"; do
  grep -Fxq "${section}" "${FOR_AGENTS_FILE}" || fail "Missing required section in FOR_AGENTS.md: ${section}"
done

grep -Fq 'threads/YYYY-MM-DD-topic.external.md' "${FOR_AGENTS_FILE}" || fail "FOR_AGENTS.md must define external session filename convention."
grep -Fq 'This workflow is first-class, not fallback.' "${FOR_AGENTS_FILE}" || fail "FOR_AGENTS.md must state disconnected mode as first-class."

required_contract_metadata=(
  '`contributor`'
  '`model`'
  '`session_datetime_et`'
  '`objective`'
  '`confidence`'
  '`repo_context_version`'
)

for key in "${required_contract_metadata[@]}"; do
  grep -Fq "${key}" "${FOR_AGENTS_FILE}" || fail "FOR_AGENTS.md contract is missing required metadata key mention: ${key}"
done

required_contract_sections=(
  '`## What Was Done`'
  '`## Novel Insights`'
  '`## Decisions Proposed`'
  '`## Open Questions`'
  '`## Proposed Next Actions`'
  '`## Promotion Suggestions`'
  '`## Paste-Ready Blocks`'
)

for contract_section in "${required_contract_sections[@]}"; do
  grep -Fq "${contract_section}" "${FOR_AGENTS_FILE}" || fail "FOR_AGENTS.md contract is missing required section mention: ${contract_section}"
done

snapshot_start_count="$(grep -c '^<!-- CONTEXT_SNAPSHOT_START -->$' "${FOR_AGENTS_FILE}")"
snapshot_end_count="$(grep -c '^<!-- CONTEXT_SNAPSHOT_END -->$' "${FOR_AGENTS_FILE}")"
changelog_start_count="$(grep -c '^<!-- CONTEXT_CHANGELOG_START -->$' "${FOR_AGENTS_FILE}")"
changelog_end_count="$(grep -c '^<!-- CONTEXT_CHANGELOG_END -->$' "${FOR_AGENTS_FILE}")"

[[ "${snapshot_start_count}" -eq 1 ]] || fail "Expected exactly one CONTEXT_SNAPSHOT_START marker."
[[ "${snapshot_end_count}" -eq 1 ]] || fail "Expected exactly one CONTEXT_SNAPSHOT_END marker."
[[ "${changelog_start_count}" -eq 1 ]] || fail "Expected exactly one CONTEXT_CHANGELOG_START marker."
[[ "${changelog_end_count}" -eq 1 ]] || fail "Expected exactly one CONTEXT_CHANGELOG_END marker."

snapshot_start_line="$(grep -n '^<!-- CONTEXT_SNAPSHOT_START -->$' "${FOR_AGENTS_FILE}" | cut -d: -f1)"
snapshot_end_line="$(grep -n '^<!-- CONTEXT_SNAPSHOT_END -->$' "${FOR_AGENTS_FILE}" | cut -d: -f1)"
changelog_start_line="$(grep -n '^<!-- CONTEXT_CHANGELOG_START -->$' "${FOR_AGENTS_FILE}" | cut -d: -f1)"
changelog_end_line="$(grep -n '^<!-- CONTEXT_CHANGELOG_END -->$' "${FOR_AGENTS_FILE}" | cut -d: -f1)"

(( snapshot_start_line < snapshot_end_line )) || fail "Snapshot markers are out of order."
(( changelog_start_line < changelog_end_line )) || fail "Changelog markers are out of order."

snapshot_labels=(
  "Current State:"
  "Active Threads:"
  "Decisions:"
  "Open Questions:"
  "Next Actions:"
)

for label in "${snapshot_labels[@]}"; do
  grep -Fxq "${label}" "${FOR_AGENTS_FILE}" || fail "Missing required snapshot label: ${label}"
done

pointer_regex='\\[src: [^]|]+ \\| key: "[^"]+"\\]'

section_has_pointer() {
  local label="$1"
  awk -v label="${label}" -v re="${pointer_regex}" '
    $0 == label {in_section=1; next}
    in_section && $0 ~ /^[A-Za-z][A-Za-z ]+:/ {exit(found ? 0 : 1)}
    in_section && $0 ~ re {found=1}
    END {
      if (!in_section) exit 1
      exit(found ? 0 : 1)
    }
  ' "${FOR_AGENTS_FILE}"
}

for label in "${snapshot_labels[@]}"; do
  section_has_pointer "${label}" || fail "Section '${label}' must include at least one source pointer."
done

if rg -n 'AGENT_START_HERE\.md|docs/context/PROJECT_CONTEXT\.md|docs/context/CONTEXT_CHANGELOG\.md' \
  "${FOR_AGENTS_FILE}" \
  "${AGENTS_FILE}" \
  "${CONTRIBUTING_FILE}" \
  "${README_FILE}" \
  "${ROOT_DIR}/skills/repo-context-curator/SKILL.md" \
  "${ROOT_DIR}/skills/repo-artifact-promoter/SKILL.md" \
  >/tmp/context_integrity_deprecated_refs.txt; then
  echo "Deprecated references detected:"
  cat /tmp/context_integrity_deprecated_refs.txt
  fail "Remove references to deprecated split-context files."
fi

grep -Fq "FOR_AGENTS.md" "${AGENTS_FILE}" || fail "AGENTS.md must point to FOR_AGENTS.md."
grep -Fq "FOR_AGENTS.md" "${CONTRIBUTING_FILE}" || fail "CONTRIBUTING.md must point to FOR_AGENTS.md."
grep -Fq "FOR_AGENTS.md" "${README_FILE}" || fail "README.md must include FOR_AGENTS.md in Start Here guidance."

external_files=()
while IFS= read -r file_path; do
  external_files+=("${file_path}")
done < <(find "${ROOT_DIR}/threads" -maxdepth 1 -type f -name '*.external.md' | sort)

required_external_metadata_keys=(
  "contributor"
  "model"
  "session_datetime_et"
  "objective"
  "confidence"
  "repo_context_version"
)

required_external_sections=(
  "## What Was Done"
  "## Novel Insights"
  "## Decisions Proposed"
  "## Open Questions"
  "## Proposed Next Actions"
  "## Promotion Suggestions"
  "## Paste-Ready Blocks"
)

validate_external_file() {
  local file_path="$1"

  [[ "$(head -n 1 "${file_path}")" == "---" ]] || fail "External file must begin with YAML frontmatter: ${file_path}"
  local frontmatter_end_line
  frontmatter_end_line="$(awk 'NR > 1 && $0 == "---" { print NR; exit }' "${file_path}")"
  [[ -n "${frontmatter_end_line}" ]] || fail "External file frontmatter must have closing '---': ${file_path}"

  local frontmatter
  frontmatter="$(sed -n "1,${frontmatter_end_line}p" "${file_path}")"

  for metadata_key in "${required_external_metadata_keys[@]}"; do
    echo "${frontmatter}" | rg -q "^${metadata_key}:" || fail "Missing metadata key '${metadata_key}' in external file: ${file_path}"
  done

  echo "${frontmatter}" | rg -q '^confidence:\s*"?((low|medium|high))"?\s*$' || fail "Invalid confidence value in external file: ${file_path}"

  for required_section in "${required_external_sections[@]}"; do
    grep -Fxq "${required_section}" "${file_path}" || fail "Missing required section '${required_section}' in external file: ${file_path}"
  done
}

for external_file in "${external_files[@]}"; do
  validate_external_file "${external_file}"
done

strip_mutable_blocks() {
  awk '
    /^<!-- CONTEXT_SNAPSHOT_START -->$/ {print; in_snapshot=1; next}
    /^<!-- CONTEXT_SNAPSHOT_END -->$/ {in_snapshot=0; print; next}
    /^<!-- CONTEXT_CHANGELOG_START -->$/ {print; in_changelog=1; next}
    /^<!-- CONTEXT_CHANGELOG_END -->$/ {in_changelog=0; print; next}
    in_snapshot || in_changelog {next}
    {print}
  ' "$1"
}

if git -C "${ROOT_DIR}" rev-parse --verify HEAD >/dev/null 2>&1 && git -C "${ROOT_DIR}" rev-parse --verify HEAD~1 >/dev/null 2>&1; then
  latest_subject="$(git -C "${ROOT_DIR}" log -1 --pretty=%s)"
  if [[ "${latest_subject}" == "chore(context): refresh project context" ]]; then
    changed_files=()
    while IFS= read -r changed_file; do
      changed_files+=("${changed_file}")
    done < <(git -C "${ROOT_DIR}" diff --name-only HEAD~1 HEAD)
    [[ "${#changed_files[@]}" -gt 0 ]] || fail "Automation-tagged commit has no file changes."
    for changed_file in "${changed_files[@]}"; do
      [[ "${changed_file}" == "FOR_AGENTS.md" ]] || fail "Automation-tagged commit modified non-context file: ${changed_file}"
    done

    old_file="$(mktemp)"
    new_file="$(mktemp)"
    old_stripped="$(mktemp)"
    new_stripped="$(mktemp)"
    trap 'rm -f "${old_file}" "${new_file}" "${old_stripped}" "${new_stripped}"' EXIT

    git -C "${ROOT_DIR}" show HEAD~1:FOR_AGENTS.md > "${old_file}"
    git -C "${ROOT_DIR}" show HEAD:FOR_AGENTS.md > "${new_file}"
    strip_mutable_blocks "${old_file}" > "${old_stripped}"
    strip_mutable_blocks "${new_file}" > "${new_stripped}"

    cmp -s "${old_stripped}" "${new_stripped}" || fail "Automation-tagged commit changed content outside marker-bounded context sections."
  fi
fi

echo "Context integrity checks passed."
