# Wix HTML Embeds

## v2 Greenfield (Recommended for current direction)

- Folder: `wix_embeds/where-youll-see-ai-v2`
- Model: `4+1` modular embeds for the first section (`Where You'll See AI`):
  - 1 featured embed (`Auditing`)
  - 3 supporting embeds (`Financial Reporting`, `Tax & Compliance`, `Internal Controls`)
  - 1 separate context/takeaways embed
- Includes planning artifacts:
  - `SECTION_BLUEPRINT.md`
  - `WIREFRAMES.md`
  - `CONTENT_SKELETON.md`
  - `QUALITY_RUBRIC.md`

## Accounting - Where You'll See AI (Insight Board)

- File: `wix_embeds/accounting-where-youll-see-ai-embed.html`
- Purpose: High-depth, reusable section embed aligned to the Smeal visual language and `Inter` typography.

### Wix placement

1. Add an `Embed Code` / `HTML iframe` element directly under the `Where You'll See AI` heading section.
2. Paste the entire file contents from `accounting-where-youll-see-ai-embed.html`.
3. Set desktop embed height to `760px`.
4. Use a separate mobile embed instance and set mobile height to `1180px`.
5. Keep top page chips in Wix outside this embed and link them to the page section anchor.

### Information architecture (fixed order)

1. Section title + intro.
2. `Quick Context` panel (`In Class` / `In Practice`).
3. Four accordion cards.
4. `Myth vs Reality` panel.
5. `Student Takeaways` panel.

### Reuse for other majors or sections

Only edit the `sectionEmbedData` object inside the script:

- `sectionTitle`
- `sectionIntro`
- `uiLabels`
- `quickContext`
- `cards[]`
- `mythReality`
- `studentTakeaways`

Keep the layout/CSS and behavior logic unchanged for consistency.

### Behavior contract

- Default open card is controlled by `embedBehavior.defaultOpenCardId`.
- Single-open accordion behavior is controlled by `embedBehavior.singleOpen`.
- Re-clicking the open card keeps it open.
- Keyboard and screen-reader states are wired through button semantics, `aria-expanded`, and labeled panel regions.

### Validation checklist

- Content fidelity aligns with source major text.
- 2x2 cards on desktop, 1-column on tablet/mobile.
- No clipping or horizontal scroll at target breakpoints.
- Focus ring and contrast remain clearly visible.
- Embed appearance matches surrounding Smeal section style in Wix Preview and published site.
