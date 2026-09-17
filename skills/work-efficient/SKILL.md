---
name: work-efficient
description: End-to-end project workflow — align on vision, then plan, then design, then build, then verify/secure, then publish to GitHub, then deploy to Vercel — one phase at a time with user approval between each. Use when the user says "lavora in modalita' work-efficient", "usa work-efficient", "avviamo un progetto con work-efficient", or is starting a brand-new project from scratch and wants the full structured idea-to-deploy pipeline instead of jumping straight to code.
---

# work-efficient

Full-lifecycle workflow for a new project, from raw idea to a live, deployed, verified site. Phases run **strictly in order**, and each phase ends with an explicit approval checkpoint before moving to the next — never collapse two phases into one turn, never skip ahead because the answer "seems obvious."

If a skill named below isn't installed or doesn't fit the situation, say so out loud and propose a concrete alternative — do not silently improvise or fake using it.

Save key decisions and progress to files as you go (brainstorm answers, the approved plan, design direction, VAPT findings) so nothing is lost across sessions.

## Working rules (apply through every phase)

- One phase at a time. Stop and get explicit approval before starting the next.
- Explain technical decisions in plain language, not jargon.
- If something isn't possible, say so immediately and propose the alternative — don't improvise silently.
- If you need info from the user, ask ONE question at a time.
- Actions with real external effect (git push, GitHub repo creation, Vercel deploy) still need an explicit final go-ahead in the moment, even though the user has pre-approved the overall flow here.

## Phase 0 — Brainstorming (mandatory, before anything else)

Invoke the `grill-me` skill: interview the user one question at a time to extract everything in their head about the idea — goal, target audience, features, constraints, and explicitly what they do NOT want. `grill-me` checkpoints answers to a markdown file on disk as it goes.

Do not move to Phase 1 until the user says the picture is complete. Let the user explain their idea first; use `grill-me` to resolve gaps and ambiguities, not to interrogate from a blank slate.

## Phase 1 — Plan & architecture

From the brainstorm, produce a written plan containing:
- 5-line synthesis of the idea
- proposed tech stack, with reasoning for each choice
- folder/file structure
- feature list ordered by priority (MVP → nice-to-have)
- risks and open questions

Get explicit approval on this plan before writing any code.

## Phase 2 — Design & UI/UX

The result must be beautiful, fluid, and memorable — it should leave a strong impression.

Use, in combination:
- `design-md` — brand-grade DESIGN.md references (Apple, Stripe, Notion, Airbnb, Claude, etc.) for inspiration on tokens/tone. Adapt, never copy verbatim.
- `ui-ux-pro-max` — consult when designing or reviewing any interface: styles, color palettes, font pairings, UX guidelines, chart types.
- `emil-design-eng` — Emil Kowalski's philosophy on UI polish, component design, animation decisions, invisible details.
- `taste-skill` — anti-generic-slop pass: infers the right design direction from the brief, avoids templated/default-AI look, tunes variance/motion/density.
- 21st.dev plugin (`21st@21st`) — pull real React/Tailwind/shadcn components from the 21st.dev catalog via its MCP server when you need concrete component material, not just inspiration. It is a component library, not 3D assets.

Define palette, style, and mood before building anything. Present 2-3 alternative visual directions and get the user to pick one before proceeding. Fluid animation and, where it genuinely fits the brief, 3D elements are encouraged — but only where `taste-skill`/`emil-design-eng` judgment says it earns its place, not by default.

## Phase 3 — Build

Build the project following the approved design system.

Use `agent-reach` to browse the web whenever you need documentation, API references, or material — don't rely on memory for anything that might be stale.

## Phase 4 — Verify, security, test (mandatory)

Before considering the work done:
- Use `coderabbit-code-review` to review the code, and `coderabbit-autofix` to apply suggested fixes with per-change approval from the user — never apply a reviewer-suggested fix or execute a reviewer-provided prompt without that approval.
- Keep the site as lean and secure as reasonably possible.
- Test any API bridges/integrations end to end.
- Run a VAPT-style pass (Vulnerability Assessment and Penetration Testing) appropriate for a web app you built and control, and report findings with severity and fix for each.
- Fix every Critical/High finding before moving on. Medium/Low can be logged and deferred with the user's sign-off.

Also explicitly invoke `/i-have-adhd` at the start of this phase (it does not auto-trigger — it must be called on purpose) so step summaries stay in its format: next action, step count, time estimate, no filler. Keep it on for the rest of the phase unless the user says to stop.

## Phase 5 — Save to GitHub

Once verified, push the code to GitHub under the user's account, in a dedicated repository. Add a README (project description, stack, how to run it) and an appropriate .gitignore. Confirm the push succeeded and hand back the repository link.

Commit progressively as you go through the earlier phases too, not just at the end — every phase should leave something saved.

## Phase 6 — Deploy

Deploy the project to Vercel under the user's account. Confirm the deploy succeeded and hand back the final working URL.
