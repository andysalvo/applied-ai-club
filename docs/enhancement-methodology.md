# Enhancement Methodology: AI by Smeal Major v2

## What the v1 content was

The original "AI by Smeal Major" content was created through a student-led authorship process developed by Applied AI, a club at Penn State's Smeal College of Business.

**Process:**
1. Students selected one of 10 Smeal majors and pulled the official curriculum description from the Smeal undergraduate website
2. They provided this context to ChatGPT along with an empty template (4-section structure with section prompts) and a completed example (Accounting, Actuarial Science, or Corporate Innovation) as a style reference
3. They primed with tone rules: describe how the field discusses AI, not advice, not predictions
4. The AI generated a draft; students reviewed, edited, and submitted

**Known contributors:** Andy Salvo (programming lead, authored the example pages), Michael Tedesco (Finance), and other Applied AI club members.

**Result:** 10 canonical content files, one per Smeal major. Each ~650-960 words. Correct structure. Institutional tone. But generic -- no named companies, no specific tools, no citations, no research depth. About 78% read as template-driven AI output.

The v1 files are preserved untouched in `content/*.txt`.

## What the v2 enhancement did

We applied the same research rigor that the Student AI Hub's foundation sections used -- structured source identification, inline citations, and specificity -- to the major-specific content.

**Research phase:**
- For each of the 10 majors, we identified 10-15 credible sources: industry vendors (the companies actually building and deploying AI tools in each field), professional associations (AICPA, SOA, CFA Institute, RIMS, etc.), consulting research (McKinsey, Deloitte, Gartner), academic publications (HBR, MIT Sloan), and regulatory bodies (Federal Reserve, SEC, NAIC, etc.)
- Sources were selected for specificity: we looked for named tools, named companies, concrete applications, and documented outcomes
- All sources are logged in `content/v2/SOURCE_REGISTRY.md`

**Content enhancement:**
- Each v2 file preserves the 4-section structure from v1, with renamed section headers:
  - Where AI Appears
  - What AI Helps With
  - Where AI Falls Short
  - What to Keep in Mind
- Each section contains 4-5 concepts, each following the panel template: context line (bolded) + explanation (2-3 sentences) + boundary
- Every concept includes at least one inline source reference in `[Source: Name]` format
- Named companies, tools, and platforms are included where sources support them
- All mentions are descriptive, not recommendations

**Quality constraints applied:**
- Style rules from `STYLE_RULES.md`: institutional tone, no signposting, no comma chains, no prescriptive language
- Witness rules from `WITNESS_RULES.md`: pressure-before-technology pattern, field-native limits, section independence
- No tool/vendor recommendations (descriptive framing only)
- Every source in the content appears in the source registry

## How AI assisted vs. what humans did

**AI did:**
- Web research to identify relevant sources for each major (10 parallel research agents)
- Draft generation for v2 content, incorporating sources, style rules, and v1 structure
- Source registry compilation

**Humans did:**
- Defined the enhancement methodology and quality criteria
- Selected which sources to pursue (industry reports, professional associations, academic)
- Authored the original v1 content through the student-led process
- Set and enforced the style rules, witness rules, and authorship gates
- Final review and approval of all v2 content

**The authorship model:** Students wrote the originals. The enhancement pass added research depth and specificity while preserving the structure and voice they established. The student-authored v1 files remain in the repo as the baseline. V2 builds on that foundation with source-backed detail.

## Audit trail

- **v1 content**: `content/*.txt` (preserved, unchanged)
- **v2 content**: `content/v2/*.md` (enhanced versions)
- **Source registry**: `content/v2/SOURCE_REGISTRY.md` (~120 sources across 10 majors)
- **Style rules**: `student_ai_hub/ai_by_smeal_major_system/STYLE_RULES.md`
- **Witness rules**: `student_ai_hub/ai_by_smeal_major_system/WITNESS_RULES.md`
- **Authorship gates**: `student_ai_hub/ai_by_smeal_major_system/AUTHORSHIP_GATES.md`
- **This document**: `docs/enhancement-methodology.md`

## Numbers

| Metric | v1 | v2 |
|--------|----|----|
| Average word count per major | ~840 | ~1,150 |
| Named companies/tools per major | 0 | 15-25 |
| Inline source citations per major | 0 | 20-30 |
| Unique sources in registry | 0 | ~120 |
| Sections per major | 4 | 4 |
| Concepts per section | 3-4 | 4-5 |

---

*Compiled March 2026 as part of the Student AI Hub v2 enhancement pass.*
