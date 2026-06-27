# Codex Local Workflows

This repository stores portable Codex workflows for this MacBook first. Other PCs can use the same workflows only when their own Codex harness installs them locally.

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

## Current MacBook

This MacBook already has the `loop-engineering` skill installed in the local Codex home:

```text
~/.codex/skills/loop-engineering
```

## Installing On Another PC Manually

On another PC, clone this repository:

```sh
git clone https://github.com/susia101/Codex.git
```

Then copy the skill into the local Codex home:

```sh
mkdir -p ~/.codex/skills
cp -R Codex/.codex/skills/loop-engineering ~/.codex/skills/
```

After restarting Codex on that PC, the `loop-engineering` skill is available locally.

## Sync Model

Codex skills are local files. GitHub stores the workflow for backup and manual distribution, but it does not force account-wide activation. Each PC keeps its own Codex harness and decides when to install or update the skill.
