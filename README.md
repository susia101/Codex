# Codex Account Workflows

This repository stores portable Codex workflows that can be synced across the PCs that use this GitHub account.

## Loop Engineering

Loop Engineering is a bounded prompt-and-verify pipeline for Codex:

1. Define concrete acceptance criteria.
2. Draft the next working prompt or plan.
3. Execute the smallest useful step.
4. Verify with available tools.
5. Critique failures and missing evidence.
6. Rewrite the next prompt or plan.
7. Repeat until the criteria pass or the loop budget is reached.

The Codex skill lives at:

```text
.codex/skills/loop-engineering/SKILL.md
```

## Installing On Another PC

Clone this repository:

```sh
git clone https://github.com/susia101/Codex.git
```

Then copy the skill into the local Codex home:

```sh
mkdir -p ~/.codex/skills
cp -R Codex/.codex/skills/loop-engineering ~/.codex/skills/
```

After restarting Codex, the `loop-engineering` skill is available locally.

## Sync Model

Codex skills are local files. GitHub sync makes the workflow portable, but each PC still needs to pull this repo and install or link the skill into its local Codex home.
