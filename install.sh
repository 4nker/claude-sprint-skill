#!/bin/bash
# Install Danny's working style on a new computer, for every project:  bash install.sh
#   - plain-reply: straight talk, always on, never called
#   - sprint: starts by itself in every project; asks once whether the project wants a brief and sprints
# Puts files in ~/.claude, merges the two hooks into ~/.claude/settings.json (keeping what is there)
# and adds the working rules to ~/.claude/CLAUDE.md. Safe to run again; it updates its own files.
set -euo pipefail
KIT=$(cd "$(dirname "$0")" && pwd)
C=$HOME/.claude
mkdir -p "$C/skills/plain-reply" "$C/skills/sprint/templates"
cp "$KIT"/plain-reply/SKILL.md "$KIT"/plain-reply/remind.sh "$C/skills/plain-reply/"
chmod +x "$C/skills/plain-reply/remind.sh"
cp "$KIT/SKILL.md" "$C/skills/sprint/SKILL.md"
cp "$KIT"/templates/* "$C/skills/sprint/templates/"

python3 - "$C/settings.json" "$KIT/settings-snippet.json" <<'P'
import json, os, sys
path, snippet = sys.argv[1], sys.argv[2]
cur = json.load(open(path)) if os.path.exists(path) else {}
new = json.load(open(snippet))
hooks = cur.setdefault("hooks", {})
for event, entries in new["hooks"].items():
    have = hooks.setdefault(event, [])
    for entry in entries:
        cmds = {h["command"] for e in have for h in e.get("hooks", [])}
        if not any(h["command"] in cmds for h in entry["hooks"]):
            have.append(entry)
json.dump(cur, open(path, "w"), indent=2)
P

M=$C/CLAUDE.md
touch "$M"
python3 - "$M" "$KIT/CLAUDE-snippet.md" <<'P'
import re, sys
path, snippet = sys.argv[1:]
text, new = open(path).read(), open(snippet).read().strip() + "\n"
pat = re.compile(r"<!-- sprint-kit:start -->.*?<!-- sprint-kit:end -->\n?", re.S)
text = pat.sub(new, text) if pat.search(text) else (text.rstrip() + "\n\n" if text.strip() else "") + new
open(path, "w").write(text)
P
echo "Installed. Open Claude Code in any project: replies are plain, and the sprint skill starts by itself."
