# AI in Accounting — Wix Embed Package

This package contains four fixed-height, classroom-style embeds for the Accounting page.

## Embed Files and Placement Order

Place these in Wix from top to bottom:

1. `dist/section1-where-ai-appears.html`
2. `dist/section2-what-ai-helps-with.html`
3. `dist/section3-where-ai-falls-short.html`
4. `dist/section4-what-to-keep-in-mind.html`

Each file is standalone (inline CSS + inline JS, no external JS libraries).

## Recommended Starting Heights

### Desktop

- Section 1: `860px`
- Section 2: `860px`
- Section 3: `900px`
- Section 4: `900px`

### Mobile (420px target)

- Section 1: `1020px`
- Section 2: `1020px`
- Section 3: `1080px`
- Section 4: `1080px`

These embeds are designed to keep height stable during interaction.

## Wix Setup Notes

- Set embed width to fill your content rail (typically 100% of the section width).
- Keep section spacing generous above and below each embed (24–48px).
- If clipping appears on a specific breakpoint, adjust only that embed height in 20–40px increments.

## Quick Copy Customization

Each embed has a local data object in JavaScript.

To update copy safely:

1. Edit only the data fields (labels, context lines, explanation arrays, boundary lines).
2. Keep item IDs unchanged unless you also update button bindings.
3. Keep sentence style short and source-faithful.

## Color Customization

Base palette should remain unchanged:

- `#01458F`
- `#0C5BBF`
- `#FFFFFF`
- `#F7F9FC`
- `#E3E8F0`
- `#0B1F3B`
- `#4B5D73`

Per-section accent variables can be tuned without changing core palette:

- `--aihub-accent`
- `--aihub-accent-soft`
- `--aihub-accent-border`

## Inter Font Fallback Behavior

Each file performs a runtime check for Inter.
If Inter is unavailable, it adds `aihub-no-inter` on `<html>` and applies fallback weight/spacing adjustments.

## Optional postMessage Auto-Resize (Off by Default)

Each embed includes an optional postMessage helper:

- `const AIHUB_ENABLE_POSTMESSAGE = false;`

Current UX does not require auto-resize.
If needed later, set to `true` and add a parent listener in Wix/Velo for `AIHUB_EMBED_HEIGHT`.

## Content Source

All factual content is derived from:

- `/Users/andysalvo_1/Documents/GitHub/ai_hub_brain/AIaccounting.txt`

Copy is rewritten for clarity, pedagogy, and readability without adding unsupported claims.
