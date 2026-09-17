---
name: design-md
description: Library of 73 real-brand DESIGN.md files (Apple, Airbnb, Stripe, Notion, Uber, Claude, and more) describing a site's visual language in plain markdown — colors, typography, spacing, tone. Use when the user wants a UI to look like a specific known brand/product, or asks to scaffold a page/component with a coherent, brand-consistent visual system instead of a generic one. Source: VoltAgent/awesome-design-md.
---

# design-md

Reference collection of DESIGN.md files extracted from real products. Each one is a plain-markdown description of a brand's visual system (colors, type, spacing, tone) that an AI agent can read directly to generate consistent UI — no Figma export or JSON schema needed.

## How to use

1. Look in `references/<brand>/DESIGN.md` for a brand matching what the user wants (e.g. `references/stripe/DESIGN.md`, `references/apple/DESIGN.md`, `references/notion/DESIGN.md`).
2. Read that file for the design tokens and rules.
3. Either copy it into the project root as `DESIGN.md` (for later reference across sessions) or apply its rules directly when generating the UI.
4. If no close match exists locally, brands can be requested at https://getdesign.md/request.

Run `ls references/` to see all available brands.
