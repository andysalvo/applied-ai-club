# Design Tokens — AI in Accounting Embeds

These tokens are locked for all four Wix embed files in `AI in accounting/dist/`.

## Color Tokens (Exact)

- `--aihub-primary: #01458F`
- `--aihub-hover: #0C5BBF`
- `--aihub-white: #FFFFFF`
- `--aihub-light-bg: #F7F9FC`
- `--aihub-border: #E3E8F0`
- `--aihub-text-primary: #0B1F3B`
- `--aihub-text-secondary: #4B5D73`

Section accents (subtle use only):

- `--aihub-accent-s1: #2E78D2`
- `--aihub-accent-s2: #138A7E`
- `--aihub-accent-s3: #B37512`
- `--aihub-accent-s4: #6F56C6`

Accent usage is limited to small pills, thin rules, selected states, and line highlights.

## Typography

- Font: `Inter`
- Fallback: `"Inter", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif`
- Title: `40–44px`, `700`, line-height `1.18–1.22`
- Subtitle: `18px`, `400/500`, line-height `1.5–1.6`
- Body: `15–16px`, `400`, line-height `1.55–1.65`
- Small labels and hints: `12–13px`, `500`

## Spacing Rhythm

Use only this rhythm for layout and internal spacing:

- `12`
- `16`
- `24`
- `32`
- `48`
- `64`

## Surface and Hierarchy Rules

- Prefer one editorial stage surface per section.
- Reading panel background: `#FBFCFF` or `rgba(1,69,143,0.03)`.
- Borders are quiet: `1px solid #E3E8F0`.
- Shadows are sparse and soft, used only to separate key planes.
- Avoid repeated heavy card chrome.

## Motion

- Duration: `150–200ms`
- Easing: `ease`
- Use only for:
  - selected state transitions
  - subtle hover/focus feedback
  - content fade/slide inside fixed panels

No motion pattern may change document height.

## Stable Height Contract

- `aihub-shell` uses fixed height.
- Stage area remains fixed (`min-height: 0`).
- Dynamic text renders into internally scrolling panel (`overflow: auto`).
- Overlay panels (when present) are fixed-position and scroll internally.
