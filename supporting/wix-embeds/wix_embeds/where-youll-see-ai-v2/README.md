# Where You'll See AI v2 (Modular 4+1)

This package is the greenfield redesign for the first section only.

## Files

- `01-featured-auditing.html`
- `02-support-financial-reporting.html`
- `03-support-tax-compliance.html`
- `04-support-internal-controls.html`
- `05-context-takeaways.html`
- `layout-preview.html` (optional local composition preview)
- `SECTION_BLUEPRINT.md`
- `WIREFRAMES.md`
- `CONTENT_SKELETON.md`
- `QUALITY_RUBRIC.md`

## Wix layout implementation (asymmetric 1+3 + context)

1. Keep the existing top chips outside embeds.
2. Add a container area for `Where You'll See AI in Accounting`.
3. Place `01-featured-auditing.html` in the featured slot.
4. Place `02`, `03`, `04` as the three supporting embeds.
5. Place `05-context-takeaways.html` full width below the first row.

## Desktop sizing guidance

- Featured embed: width `58-62%` of row, height `410px`.
- Support embeds: each height `330px`.
- Context embed: full width, height `380px`.
- Gap between embeds: `16-20px`.

## Mobile sizing guidance

- Stack order: `01`, `02`, `03`, `04`, `05`.
- Featured embed height: `470px`.
- Support embed heights: `380px` each.
- Context embed height: `500px`.
- Vertical gap: `12-16px`.

## Interaction rules

- One reveal per embed only (`Read more`).
- No complex motion, no nested interaction patterns.
- Keyboard focus and `aria-expanded` are required.

## Visual rules

- Inter-only typography.
- Calm white/light-blue surfaces.
- Subtle border and restrained accent usage.
- No glossy gradients or icon-heavy UI chrome.
