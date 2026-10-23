# Claude working style

A one-command set-up that gives Claude Code two habits on a new computer, in every project.

## What you get

- **Plain reply.** Claude answers in short, plain sentences. It is always on and never needs calling.
- **Sprint.** Claude looks for a brief and a sprint plan when a session starts. If the project has none, it asks once whether you want to work with a brief and sprints or treat it as a quick job. It makes the standard documents either way and writes your answer into the brief, so it never asks again.

## Install

    git clone <this repo> claude-working-style
    bash claude-working-style/install.sh

It puts files in `~/.claude`, merges two hooks into `~/.claude/settings.json` (existing settings are kept) and adds the working rules to `~/.claude/CLAUDE.md`. Run it again at any time to update. It needs bash and python3.

## What it creates in a project

| File | Purpose |
|---|---|
| `docs/BRIEF.md` | What is being built. Its `Working mode:` line says `sprint` or `light`. |
| `docs/SPRINT_PLAN.md` | The sprints, with tick boxes. Ticked only with evidence. |
| `docs/UPDATES.md` | Dated log of discoveries made along the way. |
| `docs/DECISIONS.md` | Every decision the owner makes, and why. |

In sprint mode Claude insists on an approved brief, drafts the plan for approval, works one sprint at a time and stops for your review. In light mode it does the job and still logs discoveries and decisions.

See `JOURNEYS.md` for what happens in each kind of project.

## Layout

- `install.sh`: the installer
- `SKILL.md`, `templates/`: the sprint skill and its document templates
- `plain-reply/`: the plain reply skill and its hook
- `settings-snippet.json`, `CLAUDE-snippet.md`: what gets merged into `~/.claude`
