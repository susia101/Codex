# Loop Engineering

Use this skill when a task benefits from an explicit self-improving prompt-and-verify loop: ambiguous implementation work, prompt design, agent workflow design, test generation, debugging, refactoring, quality review, or any task where the first answer should be iteratively improved before delivery.

## Core Rule

Run a bounded loop before finalizing work:

1. Frame the target outcome in concrete acceptance criteria.
2. Draft the working prompt or implementation plan.
3. Execute the smallest useful step.
4. Verify the result against the criteria with available tools.
5. Critique failures, ambiguity, and missing evidence.
6. Rewrite the next prompt or plan based on that critique.
7. Repeat until the criteria pass or the loop budget is reached.

## Default Loop Budget

- Use up to 3 iterations for ordinary tasks.
- Use up to 5 iterations for high-risk changes, user-visible behavior, tests, CI, release work, or multi-file edits.
- Stop early when verification is strong and no material gaps remain.
- Do not loop for trivial questions where a direct answer is sufficient.

## Prompt Template

For each iteration, maintain this internal structure:

```text
Goal:
- What must be true when this is done?

Constraints:
- User instructions
- Repo conventions
- Safety or compatibility limits

Attempt:
- The next concrete action

Verification:
- Command, inspection, test, or reasoning check

Critique:
- What failed, what is uncertain, what is missing?

Next Prompt:
- Revised instruction for the next iteration
```

## Verification Standards

- Prefer executable checks over reasoning-only checks.
- Start with the narrowest relevant test, then broaden only when risk justifies it.
- If tools cannot run, state the limitation and use static inspection.
- Do not invent successful verification. Report failures plainly.
- Do not modify unrelated code just to make the loop pass.

## Output Standard

When reporting results to the user:

- Summarize the final state, not every internal iteration.
- Mention the verification actually performed.
- Mention unresolved risks or blocked checks.
- Keep the final answer concise unless the user asks for the loop trace.

## Safety Boundaries

- Never use the loop to bypass approval, sandbox, or user constraints.
- Never make destructive changes unless explicitly requested.
- Preserve user edits and existing worktree state.
- Keep each iteration scoped to the user's actual goal.
