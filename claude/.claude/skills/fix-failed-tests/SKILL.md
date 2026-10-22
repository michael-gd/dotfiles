---
name: fix-failed-tests
description: Run the backend unit test suite and fix any failing tests.
disable-model-invocation: true
allowed-tools: Read, Edit, Grep, Glob, Bash
---

# Fix Failed Tests

Run from `backend/`:

```
uv run pytest -n auto -m "not integration and not integration_docker" --lf
```

If it exits 0 with no tests collected (nothing was previously failing), report that and stop.

For each failure, read the traceback and find the root cause: decide whether the **test** or the **source code under test** is wrong, then fix that one. Do not:
- delete, skip, or loosen an assertion just to make a test pass
- mock away a real bug
- change code unrelated to the failure

Apply this repo's conventions (`docs/coding-principles.md`, `backend/CLAUDE.md`) to any fix.

If a failure's cause is ambiguous — the test's intended behavior isn't clear, or the fix requires a design decision — stop and ask the user rather than guessing.

Re-run the same `--lf` command after each fix. Once it exits 0, run once more **without** `--lf`:

```
uv run pytest -n auto -m "not integration and not integration_docker"
```

`--lf` only reruns tests that were already failing, so this final full pass catches any regression a fix introduced elsewhere. Done means this full run exits 0.

Summarize what failed and what changed to fix it.