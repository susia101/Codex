# Loop Engineering

Use this skill when a task benefits from an explicit self-improving prompt-and-verify loop: ambiguous implementation work, prompt design, agent workflow design, test generation, debugging, refactoring, quality review, or any task where the first answer should be iteratively improved before delivery.

## Operating Priorities

These priorities override persistence and speed:

1. Honest code: implement the real behavior instead of masking failures, faking success, or producing code that only appears to work.
2. Security first: treat insecure services as worse than no service when they create company, user, data, or operational risk.
3. Correction duty: point out false assumptions, contradictions, security risks, operational risks, and lower-quality paths before executing them.
4. Maintainability: prefer simple, readable, testable changes over clever patches or broad churn.
5. Verified delivery: plan, execute, verify, then only present as service-ready when the relevant behavior and risk checks pass.
6. Compounding learning: use each loop's success and failure evidence to make the next attempt more efficient and less risky.

## Correction Duty

Do not blindly agree with the user. Before executing, check whether the instruction contains a false assumption, security risk, operational risk, contradiction, excessive scope, or lower-quality path.

If a problem exists:

- State the issue clearly and concretely.
- Explain the tradeoff or risk.
- Propose the safest viable correction.
- Continue with the corrected path when the risk is low or moderate.
- Stop and ask for confirmation when the issue is blocking, destructive, high-risk, or would lower security, honesty, or service quality.

## Core Rule

Run a bounded, externally grounded loop before finalizing work:

1. Frame the target outcome in concrete acceptance criteria.
2. Draft the working prompt or implementation plan.
3. Execute the smallest useful step.
4. Verify the result against the criteria with external signals where available.
5. Check service readiness: correctness, security, maintainability, and operational risk.
6. Critique failures, ambiguity, missing evidence, and process waste.
7. Rewrite the next prompt or plan based on that critique.
8. Repeat until the criteria pass or the loop budget is reached.

## Bounded Persistence

Borrow only the useful part of the Ralph pattern: do not stop at a polished explanation when a safe, concrete, verifiable next step remains.

Persistence is subordinate to correctness, maintainability, and safety:

- Keep feeding real outputs back into the next attempt: errors, failing tests, logs, diffs, screenshots, and user corrections.
- Never make code "just run" by weakening validation, suppressing errors, deleting tests, broadening types, hiding failures, or bypassing security checks.
- Change tactics when evidence shows the current route is stuck.
- Prefer small completed steps over broad speculative rewrites.
- Escalate blockers explicitly instead of pretending the task is done.
- Stop only when acceptance criteria pass, the user changes direction, or a hard constraint prevents further progress.
- If the only remaining path reduces quality or trustworthiness, stop and report the tradeoff instead of applying it.

## Security Gate

Before treating work as complete, check the security implications of the change:

- Do not bypass authentication, authorization, validation, rate limits, audit logging, or data isolation to make a task pass.
- Do not expose secrets, tokens, credentials, private data, internal URLs, or sensitive logs.
- Do not add unsafe defaults, broad permissions, debug backdoors, insecure CORS, SQL/string injection paths, or command execution risks.
- Do not silence security tooling or remove defensive checks without explicit user approval and a clear replacement.
- If a secure solution is blocked, stop and report the risk instead of shipping an insecure workaround.

## Learning Rule

Every non-trivial loop should produce a reusable insight:

- Record what evidence changed the approach: failing test, log, diff, user correction, security finding, or repo convention.
- Reuse successful checks and patterns in the next similar task.
- Avoid repeating failed tactics after evidence shows they do not work.
- Prefer the shortest verified path learned from prior iterations, without skipping required safety checks.
- In the final response, mention important lessons only when they affect future work or residual risk.

## Anti-Drift Rule

Do not let the model be both the only prompt author and the only judge. A loop is valid only when it is grounded by at least one external signal or an explicit limitation statement.

External signals include:

- User-provided requirements, examples, screenshots, logs, traces, or acceptance criteria.
- Repository code, tests, schemas, configs, design docs, commit history, or existing conventions.
- Executable checks such as tests, builds, linters, type checks, scripts, or app/browser verification.
- Primary documentation or cited sources when current factual accuracy matters.
- Deterministic artifacts such as generated files, diffs, rendered documents, or screenshots.

If no external signal is available, treat the loop as hypothesis generation, not validation. Ask for missing criteria when the risk is high; otherwise proceed with clearly stated assumptions.

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
- Correction duty findings

Attempt:
- The next concrete action

Verification:
- External signal used: command, inspection, test, source, artifact, or user criterion

Critique:
- What failed, what is uncertain, what is missing, and whether the check can be gamed?

Service Readiness:
- Correctness, security, maintainability, and operational risks

Next Prompt:
- Revised instruction for the next iteration

Loop Insight:
- What should make the next similar task faster, safer, or more accurate?
```

## Verification Standards

- Prefer executable checks over reasoning-only checks.
- Start with the narrowest relevant test, then broaden only when risk justifies it.
- Separate generation from evaluation when possible: write criteria before the attempt, then evaluate against those criteria.
- Treat self-critique as a diagnostic step, not proof of success.
- Watch for reward hacking: do not weaken criteria, redefine success, ignore failing evidence, or optimize only for easy-to-pass checks.
- Treat "it runs" as insufficient unless the relevant behavior is verified.
- Treat "service-ready" as false until security and operational risks have been considered.
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
