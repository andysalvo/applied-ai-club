# Implementation Notes — Wix Embed Stability + Pedagogy

## Architecture

Each section is a self-contained HTML document with:

- Inline CSS
- Inline JavaScript
- Inter font links only (no JS libraries)

All classes are namespaced with `aihub-` to avoid Wix style collisions.

## Fixed-Height Strategy (No Jumps)

To avoid iframe jump behavior in Wix:

- The root shell uses a fixed height per section.
- The stage region is fixed and split into left selection + right reading panel.
- Dynamic text is rendered into an internal scrolling area (`overflow: auto`).
- No expanding accordion pattern is used.
- Overlay panels (where used) are fixed-position and scroll internally.

This ensures clicks do not change document height.

## Interaction Model

Section interactions remain conceptually consistent:

- Section 1: conceptual map node selection
- Section 2: task selection list
- Section 3: misconception selection + reality framing + optional overlay note
- Section 4: guidance map selection

Every selection updates a reading panel with:

1. Context sentence
2. 2–4 explanation sentences
3. Boundary sentence on judgment/oversight/documentation

## Accessibility Choices

- Selectable items are semantic `<button>` elements.
- Active states use `aria-pressed`.
- Focus indicators are visible and high-contrast.
- Enter/Space triggers item selection.
- Overlay dialogs support:
  - `role="dialog"`
  - `aria-modal="true"`
  - Escape-to-close
  - basic focus trap

## Font Reliability

A runtime check confirms whether Inter is available.
If not, `aihub-no-inter` is added to `<html>` to adjust weight/spacing for fallback fonts.

## Optional postMessage Hook

An optional height hook remains in each file but is disabled by default:

- `const AIHUB_ENABLE_POSTMESSAGE = false;`

It can be enabled later if Wix/Velo parent listeners are added, but current UX does not depend on it.
