# Claude sprint skill

A one-command set-up that makes Claude Code work to a brief and a sprint plan on a new computer, in every project you choose.


## What you get

When a Claude Code session starts in a project, Claude looks for a brief and a sprint plan. If the project has none, it asks once whether you want to work with a brief and sprints or treat it as a quick job. It makes the standard documents either way and writes your answer into the brief, so it never asks again.

## Install

    git clone https://github.com/4nker/claude-sprint-skill
    bash claude-sprint-skill/install.sh

It puts files in `~/.claude`, merges its hooks into `~/.claude/settings.json` (existing settings are kept) and adds the working rules to `~/.claude/CLAUDE.md`. Run it again at any time to update. It needs bash and python3.

## What it creates in a project

| File | Purpose |
|---|---|
| `docs/BRIEF.md` | What is being built. Its `Working mode:` line says `sprint` or `light`. |
| `docs/SPRINT_PLAN.md` | The sprints, with tick boxes. Ticked only with evidence. |
| `docs/UPDATES.md` | Dated log of discoveries made along the way. |
| `docs/DECISIONS.md` | Every decision the owner makes, and why. |

In sprint mode Claude insists on an approved brief, drafts the plan for approval. It works one sprint and one task at a time and stops for your review at the end of a sprint. 

See `JOURNEYS.md` for what happens in each kind of project.

## Layout

- `install.sh`: the installer
- `SKILL.md`, `templates/`: the sprint skill and its document templates
- `plain-reply/`: Danny's reply-style skill, installed alongside
- `settings-snippet.json`, `CLAUDE-snippet.md`: what gets merged into `~/.claude`

## Licence

MIT. You can use, copy, change and share this, including in paid work, as long as you keep the copyright line "Copyright (c) 2026 Danny Austin" and the licence text with it. See `LICENSE`.
