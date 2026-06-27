# Codex Local Workflows

This repository stores portable Codex workflows for this MacBook first. Other PCs can use the same workflows only when their own Codex harness installs them locally.

## Loop Engineering

Loop Engineering is a bounded, externally grounded prompt-and-verify pipeline for Codex:

1. Define concrete acceptance criteria.
2. Draft the next working prompt or plan.
3. Execute the smallest useful step.
4. Verify with external signals where available.
5. Check service readiness: correctness, security, maintainability, and operational risk.
6. Critique failures, missing evidence, and process waste.
7. Rewrite the next prompt or plan.
8. Repeat until the criteria pass or the loop budget is reached.

The important constraint is that Codex should not be the only prompt author and the only judge. Verification should be grounded in user criteria, repository state, tests, logs, rendered artifacts, primary documentation, or other external evidence. If no external signal exists, the loop is treated as hypothesis generation rather than proof.

This workflow borrows only the useful part of the Ralph pattern: do not stop at explanation when a safe, concrete, verifiable next step remains. Persistence is always subordinate to correctness, maintainability, and safety. "It runs" is not success unless the relevant behavior is verified.

The top priority is honest code: no fake success, no validation weakening, no hidden failures, and no insecure workaround just to make a task appear complete. A service is not ready if it creates avoidable company, user, data, or operational risk. Each loop should also preserve the useful lesson from its success or failure so the next similar task is faster, safer, and better verified.

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
