# claude-work-efficient

A complete, self-contained bundle of [Claude Code](https://claude.com/claude-code) skills implementing an end-to-end "idea → deployed site" workflow: brainstorm → plan → design → build → verify/secure → publish to GitHub → deploy to Vercel, one phase at a time with approval gates in between.

Drop it into `~/.claude/skills/` on any machine and it works exactly the same as on the machine it was built on — no separate downloads needed, every dependency skill is vendored in this repo.

## What's inside

| Skill | Role in the workflow | Original source |
|---|---|---|
| **work-efficient** | The orchestrator. Ties every skill below into the 7 phases (0–6). This is the one you actually invoke. | Written for this bundle |
| **grill-me** | Phase 0 — interviews you one question at a time to extract the full idea before any code is written | [gusinov/grill-me](https://github.com/gusinov/grill-me) |
| **design-md** | Phase 2 — 73 real-brand DESIGN.md references (Apple, Stripe, Notion, Airbnb, Claude…) for design inspiration | [VoltAgent/awesome-design-md](https://github.com/VoltAgent/awesome-design-md) |
| **ui-ux-pro-max** | Phase 2 — searchable database of UI styles, palettes, font pairings, UX guidelines, chart types | [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) |
| **emil-design-eng** | Phase 2 — Emil Kowalski's design-engineering philosophy (animation, polish, invisible details) | [emilkowalski/skills](https://github.com/emilkowalski/skills) |
| **taste-skill** | Phase 2 — anti-generic-slop pass on the visual direction | [Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) |
| **agent-reach** | Phase 3 — web research (docs, APIs, reference material) across 15+ platforms | [Panniantong/Agent-Reach](https://github.com/Panniantong/Agent-Reach) |
| **coderabbit-code-review** | Phase 4 — runs CodeRabbit CLI reviews | [coderabbitai/skills](https://github.com/coderabbitai/skills) (renamed from `code-review` to avoid clashing with Claude Code's built-in review skill) |
| **coderabbit-autofix** | Phase 4 — applies CodeRabbit-suggested fixes with per-change approval | [coderabbitai/skills](https://github.com/coderabbitai/skills) |
| **i-have-adhd** | Phase 4 — terse, numbered, next-action-first status updates | [ayghri/i-have-adhd](https://github.com/ayghri/i-have-adhd) |

All 8 upstream skills are MIT-licensed. Full license texts and copyright notices for each are in [THIRD_PARTY_LICENSES.md](./THIRD_PARTY_LICENSES.md), as required by the MIT license.

### Not bundled — install separately if you want it

**21st.dev** (React/Tailwind/shadcn component catalog) is used in Phase 2 but ships as a **Claude Code plugin + remote MCP server**, not a portable skill folder, so it can't be vendored the same way. Install it yourself with:

```
claude plugin marketplace add 21st-dev/claude-code-plugin
claude plugin install 21st@21st
```

Everything else in the workflow works without it.

## Install

### Option A — script (recommended)

macOS/Linux/Git Bash:
```bash
git clone https://github.com/Antonio0721/claude-work-efficient.git
cd claude-work-efficient
./install.sh
```

Windows PowerShell:
```powershell
git clone https://github.com/Antonio0721/claude-work-efficient.git
cd claude-work-efficient
./install.ps1
```

The script copies every folder under `skills/` into `~/.claude/skills/` (global — works in every project), skipping any skill name that's already installed rather than overwriting it.

### Option B — manual

Copy the contents of `skills/` into `~/.claude/skills/` yourself:
```bash
cp -r skills/* ~/.claude/skills/
```

## Use it

Once installed, start a new project and say:

> usa work-efficient

or just start describing a brand-new project idea from scratch — the description on `work-efficient` is written to trigger automatically in that case too.

It will walk through Phases 0 → 6 in order, stopping for your approval between each one. See `skills/work-efficient/SKILL.md` for the full phase breakdown.

## Requirements

- [Claude Code](https://claude.com/claude-code)
- For `agent-reach`: see its own SKILL.md for per-platform setup (`agent-reach doctor --json` shows what's zero-config vs. what needs a key)
- For the video/API-heavy parts of Phase 3–4: whatever CLIs the individual skills call out (CodeRabbit CLI needs its own auth — run `coderabbit auth login` once)
- A GitHub account + `gh` CLI authenticated, for Phase 5
- A Vercel account + `vercel` CLI (or the Vercel GitHub integration), for Phase 6

## License

The `work-efficient` orchestrator skill in this repo is MIT-licensed (see [LICENSE](./LICENSE)). Every vendored skill under `skills/` keeps its own original MIT license — see [THIRD_PARTY_LICENSES.md](./THIRD_PARTY_LICENSES.md).
