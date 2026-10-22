# Graphite CLI Command Reference

> Complete reference for every command and flag in the Graphite (`gt`) CLI.
> Source: <https://graphite.com/docs/command-reference>

---

## Global Flags

| Flag | Description |
|---|---|
| `--help` | Show help for a command. |
| `--allCommands` | When passed to `gt --help --all`, prints the full list of command help. |
| `--cwd` | Working directory in which to perform operations. |
| `--debug` | Write debug output to the terminal. |
| `--interactive` | Enable interactive features (prompts, pagers, editors). Enabled by default. Disable with `--no-interactive`. |
| `--verify` | Enable git hooks. Enabled by default. Disable with `--no-verify`. |
| `--quiet` | Minimize output to the terminal. Implies `--no-interactive`. |

---

## Commands

### `gt abort`

Aborts the current Graphite command halted by a rebase conflict.

**Flags:**

| Flag | Description |
|---|---|
| `-f, --force` | Do not prompt for confirmation; abort immediately. |

---

### `gt absorb`

Amend staged changes to the relevant commits in the current stack. Relevance is calculated by checking changes in each commit downstack from the current commit and finding the first commit each staged hunk can be applied to deterministically. If there is no clear commit to absorb a hunk into, it will not be absorbed. Prompts for confirmation before amending commits, and restacks branches upstack of the current branch.

**Flags:**

| Flag | Description |
|---|---|
| `-a, --all` | Stage all unstaged changes before absorbing. Does not include untracked files. |
| `-d, --dry-run` | Print which commits the hunks would be absorbed into without applying. |
| `-f, --force` | Do not prompt for confirmation; apply hunks immediately. |
| `-p, --patch` | Pick hunks to stage before absorbing. |

---

### `gt add [args..]`

Git add passthrough.

**Arguments:**

| Argument | Description |
|---|---|
| `[args]` (optional) | git add arguments |

---

### `gt aliases`

Edit your command aliases.

**Flags:**

| Flag | Description |
|---|---|
| `--legacy` | Append legacy aliases to your configuration. |
| `--reset` | Reset your alias configuration. |

---

### `gt auth`

Add your auth token to enable the CLI to create and update PRs on GitHub.

**Flags:**

| Flag | Description |
|---|---|
| `-t, --token` | Auth token. Get it from: <https://app.graphite.com/activate> |

---

### `gt bottom`

Switch to the branch closest to trunk in the current stack.

---

### `gt changelog`

Show the Graphite CLI changelog.

---

### `gt checkout [branch]`

Switch to a branch. If no branch is provided, opens an interactive selector.

**Arguments:**

| Argument | Description |
|---|---|
| `[branch]` (optional) | The branch to checkout. |

**Flags:**

| Flag | Description |
|---|---|
| `-a, --all` | Show branches across all configured trunks in interactive selection. |
| `-u, --show-untracked` | Include untracked branches in interactive selection. |
| `-s, --stack` | Only show ancestors and descendants of the current branch. |
| `-t, --trunk` | Checkout the current trunk. |

---

### `gt cherry-pick [args..]`

Git cherry-pick passthrough.

**Arguments:**

| Argument | Description |
|---|---|
| `[args]` (optional) | git cherry-pick arguments |

---

### `gt children`

Show the children of the current branch.

---

### `gt completion`

Set up `bash` or `zsh` tab completion.

---

### `gt config`

Configure the Graphite CLI.

---

### `gt continue`

Continues the most recent Graphite command halted by a rebase conflict.

**Flags:**

| Flag | Description |
|---|---|
| `-a, --all` | Stage all changes before continuing. |

---

### `gt create [name]`

Create a new branch stacked on top of the current branch and commit staged changes. If no branch name is specified, generates a name from the commit message. If no changes exist, an empty branch is created. If unstaged changes exist, you will be asked whether to stage them.

**Arguments:**

| Argument | Description |
|---|---|
| `[name]` (optional) | The name of the new branch. |

**Flags:**

| Flag | Description |
|---|---|
| `--ai` | Auto AI-generate the branch name and commit message (if unset). |
| `-a, --all` | Stage all unstaged changes (including untracked files) before creating. |
| `-i, --insert` | Insert this branch between the current branch and its child. Prompts if multiple children. |
| `-m, --message` | Specify a commit message. |
| `--no-ai` | Do not auto AI-generate branch name/commit message. Takes precedence over `--ai`. |
| `-p, --patch` | Pick hunks to stage before committing. |
| `-u, --update` | Stage all updates to tracked files before creating. |
| `-v, --verbose` | Show unified diff at the bottom of the commit message template. Specify twice for unstaged changes diff. |

---

### `gt dash`

Opens your Graphite dashboard.

---

### `gt delete [name]`

Delete a branch and its Graphite metadata (local-only). Children are restacked onto the parent. Prompts for confirmation if the branch is not merged or closed. Does not perform any action on GitHub.

**Arguments:**

| Argument | Description |
|---|---|
| `[name]` (optional) | The branch to delete. If none provided, opens an interactive selector. |

**Flags:**

| Flag | Description |
|---|---|
| `-c, --close` | Close associated pull requests on GitHub. |
| `--downstack` | Also delete ancestors of the specified branch. |
| `-f, --force` | Delete even if the branch is not merged or closed. |
| `--upstack` | Also delete children of the specified branch. |

---

### `gt demo [demoName]`

Run interactive demos to learn the CLI. Options: `gt demo pull-request` or `gt demo stack`.

**Arguments:**

| Argument | Description |
|---|---|
| `[demoName]` (optional) | Demo to run. |

---

### `gt docs`

Show the Graphite CLI docs.

---

### `gt down [steps]`

Switch to the parent of the current branch.

**Flags:**

| Flag | Description |
|---|---|
| `-n, --steps` | The number of levels to traverse downstack. |

---

### `gt feedback [message]`

Post a message directly to the Graphite team's Slack.

**Arguments:**

| Argument | Description |
|---|---|
| `[message]` (optional) | Feedback for the Graphite team. |

**Flags:**

| Flag | Description |
|---|---|
| `-d, --with-debug-context` | Include logs from the past 24 hours in your feedback. |

---

### `gt fish`

Set up `fish` tab completion.

---

### `gt fold`

Fold a branch's changes into its parent, update dependencies of descendants, and restack. Does not perform any action on GitHub. If the branch has an open PR, you must manually close it.

**Flags:**

| Flag | Description |
|---|---|
| `-k, --keep` | Keep the current branch's name instead of using the parent's. |

---

### `gt freeze [branch]`

Freeze a branch and branches downstack. Freezing prevents local modifications and restacks. You can still sync remote changes or build PRs on top. Undo with `gt unfreeze`.

**Arguments:**

| Argument | Description |
|---|---|
| `[branch]` (optional) | The branch to freeze. Defaults to the current branch. |

---

### `gt get [branch]`

Sync branches from trunk to a given branch (or PR number) from remote, resolving conflicts. If the branch exists locally, upstack branches are also synced. Use `--downstack` to opt out. Remote-only upstack branches require `--remote-upstack`. If no branch is provided, syncs the current stack.

**Arguments:**

| Argument | Description |
|---|---|
| `[branch]` (optional) | Branch or PR number to get from remote. |

**Flags:**

| Flag | Description |
|---|---|
| `-d, --downstack` | Don't sync upstack branches when syncing a branch that already exists locally. |
| `-f, --force` | Overwrite all fetched branches with remote source of truth. |
| `--restack` | Restack branches that can be restacked without conflicts (default true; skip with `--no-restack`). |
| `-U, --unfrozen` | Checkout new branches as unfrozen (allow local edits). |
| `-u, --remote-upstack` | Include upstack PRs when fetching PR info from remote. |

---

### `gt guide [title]`

Read extended guides on how to use the `gt` program.

---

### `gt info [branch]`

Display information about the current (or specified) branch.

**Arguments:**

| Argument | Description |
|---|---|
| `[branch]` (optional) | The branch to show info for. Defaults to current. |

**Flags:**

| Flag | Description |
|---|---|
| `-b, --body` | Show the PR body, if it exists. |
| `-d, --diff` | Show the diff between this branch and its parent. Takes precedence over `--patch`. |
| `-p, --patch` | Show the changes made by each commit. |
| `-s, --stat` | Show a diffstat. Modifies `--patch` or `--diff`. If neither is passed, implies `--diff`. |

---

### `gt init`

Initialize Graphite in a repository by selecting a trunk branch. Also used to change the trunk branch.

**Flags:**

| Flag | Description |
|---|---|
| `--reset` | Untrack all branches. |
| `--trunk` | The name of your trunk branch. Prompts interactively if not provided. |

---

### `gt log [command]`

Log your stacks. Three forms:

- `gt log` — displays tracked branches with info about each.
- `gt log short` — displays tracked branches and their dependency relationships.
- `gt log long` — displays a graph of the commit ancestry of all branches (ignores all options).

**Aliases:** `gt ls` → `gt log short`, `gt ll` → `gt log long`.

**Arguments:**

| Argument | Description |
|---|---|
| `[command]` (optional) | The format to use (`short` or `long`). Defaults to `gt log`. |

**Flags:**

| Flag | Description |
|---|---|
| `-a, --all` | Show branches across all configured trunks. |
| `--classic` | Use the old short logging style. Other options won't work in classic mode. |
| `-r, --reverse` | Print the log upside down. |
| `-u, --show-untracked` | Include untracked branches. |
| `-s, --stack` | Only show ancestors and descendants of the current branch. |
| `-n, --steps` | Only show this many levels upstack and downstack. Implies `--stack`. |

---

### `gt merge`

Merge the PRs for all branches from trunk to the current branch via Graphite.

**Flags:**

| Flag | Description |
|---|---|
| `-c, --confirm` | Ask for confirmation before merging. Always prompts if local differs from remote. |
| `--dry-run` | Report which PRs would be merged without actually merging. |

---

### `gt modify`

Modify the current branch by amending its commit or creating a new commit. Automatically restacks descendants.

**Flags:**

| Flag | Description |
|---|---|
| `-a, --all` | Stage all changes before committing. |
| `-c, --commit` | Create a new commit instead of amending. |
| `-e, --edit` | Open an editor to edit the commit message. |
| `--interactive-rebase` | Ignore all other flags; start a git interactive rebase on this branch's commits. |
| `--into` | Amend staged changes to a specified downstack branch (prompts if not provided). |
| `-m, --message` | The message for the new or amended commit. |
| `-p, --patch` | Pick hunks to stage before committing. |
| `--reset-author` | Set the author of the commit to the current user if amending. |
| `-u, --update` | Stage all updates to tracked files before committing. |
| `-v, --verbose` | Show unified diff at the bottom of the commit message template. Specify twice for unstaged changes. |

---

### `gt move`

Rebase the current branch onto a target branch and restack descendants. Opens an interactive selector if no branch is passed.

**Flags:**

| Flag | Description |
|---|---|
| `-a, --all` | Show branches across all configured trunks in interactive selection. |
| `-o, --onto` | Branch to move the current branch onto. |
| `--source` | Branch to move (defaults to current branch). |

---

### `gt parent`

Show the parent of the current branch.

---

### `gt pop`

Delete the current branch but retain the state of files in the working tree.

---

### `gt pr [branch]`

Opens the pull request page for a branch or PR number. Defaults to the current branch's PR.

**Arguments:**

| Argument | Description |
|---|---|
| `[branch]` (optional) | A branch name or PR number to open. |

**Flags:**

| Flag | Description |
|---|---|
| `--stack` | Open the stack page. |

---

### `gt rebase [args..]`

Git rebase passthrough.

**Arguments:**

| Argument | Description |
|---|---|
| `[args]` (optional) | git rebase arguments |

---

### `gt rename [name]`

Rename a branch and update metadata. Removes any PR association (GitHub PR branch names are immutable).

**Arguments:**

| Argument | Description |
|---|---|
| `[name]` (optional) | The new name for the current branch. |

**Flags:**

| Flag | Description |
|---|---|
| `-f, --force` | Allow renaming a branch already associated with an open PR. |

---

### `gt reorder`

Reorder branches between trunk and the current branch. Opens an editor where you can reorder by moving lines corresponding to each branch.

---

### `gt reset [args..]`

Git reset passthrough.

**Arguments:**

| Argument | Description |
|---|---|
| `[args]` (optional) | git reset arguments |

---

### `gt restack`

Ensure each branch in the current stack has its parent in its Git commit history, rebasing if necessary.

**Flags:**

| Flag | Description |
|---|---|
| `--branch` | Which branch to run from. Defaults to current. |
| `--downstack` | Only restack this branch and its ancestors. |
| `--only` | Only restack this branch. |
| `--upstack` | Only restack this branch and its descendants. |

---

### `gt restore [args..]`

Git restore passthrough.

**Arguments:**

| Argument | Description |
|---|---|
| `[args]` (optional) | git restore arguments |

---

### `gt revert [sha]`

Create a branch that reverts a commit on the trunk branch. (Experimental.)

**Arguments:**

| Argument | Description |
|---|---|
| `[sha]` | The commit to revert. |

**Flags:**

| Flag | Description |
|---|---|
| `-e, --edit` | Edit the commit message. |

---

### `gt split`

Split the current branch into multiple branches. Three forms:

- `gt split --by-commit` — slice up the commit history; select split points between existing commits.
- `gt split --by-hunk` — interactively stage changes to create new single-commit branches.
- `gt split --by-file <pathspec>` — extract files matching a pathspec into a new parent branch. Repeat for multiple patterns (e.g., `gt split -f "*.json" -f "*.yaml"`).

Without options, prompts for a splitting strategy.

**Alias:** `gt sp`

**Flags:**

| Flag | Description |
|---|---|
| `-c, --commit, --by-commit` | Split by commit. |
| `-f, --file, --by-file` | Split by file (takes a pathspec). Repeat for multiple patterns. |
| `-h, --hunk, --by-hunk` | Split by hunk into new single-commit branches. |

---

### `gt squash`

Squash all commits in the current branch into a single commit and restack upstack branches.

**Flags:**

| Flag | Description |
|---|---|
| `--edit` | Modify the existing commit message. |
| `-m, --message` | The updated message for the commit. |
| `-n, --no-edit` | Don't modify the existing commit message. Takes precedence over `--edit`. |

---

### `gt submit`

Idempotently force push all branches in the current stack from trunk to the current branch to GitHub, creating or updating distinct PRs for each. Validates branches are properly restacked before submitting. Blocks force pushes that would overwrite remotely changed branches.

**Alias:** `gt ss` → `gt submit --stack`

**Flags:**

| Flag | Description |
|---|---|
| `--ai` | Auto AI-generate title and description for new PRs. If `--edit`, use generated metadata as starting points. |
| `--always` | Always push updates, even if the branch has not changed. |
| `--branch` | Which branch to run from. Defaults to current. |
| `--cli` | Edit PR metadata via the CLI instead of on web. |
| `--comment` | Add a comment on the PR with the given message. |
| `-c, --confirm` | Report PRs that would be submitted and ask for confirmation before pushing. |
| `-d, --draft` | Create all new PRs in draft mode. |
| `--dry-run` | Report PRs that would be submitted and terminate. No changes are pushed. |
| `-e, --edit` | Input metadata for all PRs interactively. Default only prompts for new PRs. |
| `--edit-description` | Input PR description interactively. Takes precedence over `--no-edit`. |
| `--edit-title` | Input PR title interactively. Takes precedence over `--no-edit`. |
| `-f, --force` | Force push (overwrites remote). Otherwise defaults to `--force-with-lease`. |
| `--ignore-out-of-sync-trunk` | Submit even if trunk is out of sync with upstream. |
| `-m, --merge-when-ready` | Mark all submitted PRs as merge when ready. |
| `--no-ai` | Don't use AI for any PR fields. Takes precedence over `--ai`. |
| `-n, --no-edit` | Don't edit any PR fields inline. Takes precedence over `--edit`. |
| `--no-edit-description` | Don't prompt for PR description. Takes precedence over `--edit-description` and `--edit`. |
| `--no-edit-title` | Don't prompt for PR title. Takes precedence over `--edit-title` and `--edit`. |
| `-p, --publish` | Publish all submitted PRs. |
| `--rerequest-review` | Rerequest review from current reviewers. |
| `--restack` | Restack branches before submitting. Outputs branches that can't be restacked if conflicts. |
| `-r, --reviewers` | Set reviewers. Without argument, prompts manually. Accepts comma-separated string. |
| `-s, --stack` | Also submit descendants of the current branch. |
| `--target-trunk` | Which trunk to open PRs against on remote. |
| `-t, --team-reviewers` | Comma-separated list of team slugs. Enables `--reviewers` prompt if set without arguments. |
| `-u, --update-only` | Only push branches and update PRs for branches that already have PRs open. |
| `-v, --view` | Open the PR in your browser after submitting. |
| `-w, --web` | Open a web browser to edit PR metadata, even if no new PRs or if configured for CLI. |

---

### `gt sync`

Sync all branches with remote, prompting to delete branches for merged/closed PRs. Restacks all branches that can be restacked without conflicts. Overwrites trunk with the remote version if it cannot be fast-forwarded.

**Flags:**

| Flag | Description |
|---|---|
| `-a, --all` | Sync branches across all configured trunks. |
| `-f, --force` | Don't prompt for confirmation before overwriting or deleting a branch. |
| `--restack` | Restack branches that can be restacked without conflicts (default true; skip with `--no-restack`). |

---

### `gt top`

Switch to the tip branch of the current stack. Prompts if ambiguous.

---

### `gt track [branch]`

Start tracking the current (or provided) branch with Graphite by selecting its parent. Can recursively track a stack of branches.

**Arguments:**

| Argument | Description |
|---|---|
| `[branch]` (optional) | Branch to begin tracking. Defaults to current. |

**Flags:**

| Flag | Description |
|---|---|
| `-f, --force` | Set parent to the most recent tracked ancestor to skip prompts. Takes precedence over `--parent`. |
| `-p, --parent` | The tracked branch's parent. Must be a tracked branch. |

---

### `gt trunk`

Show the trunk of the current branch.

**Flags:**

| Flag | Description |
|---|---|
| `--add` | Add an additional trunk. |
| `-a, --all` | Show all configured trunks. |

---

### `gt undo`

Undo the most recent Graphite mutations.

**Flags:**

| Flag | Description |
|---|---|
| `-f, --force` | Do not prompt for confirmation; undo immediately. |

---

### `gt unfreeze [branch]`

Unfreeze a branch and branches upstack of it, re-enabling local modifications. See `gt freeze` for more.

**Arguments:**

| Argument | Description |
|---|---|
| `[branch]` (optional) | The branch to unfreeze. Defaults to current. |

---

### `gt unlink [branch]`

Unlink the PR currently associated with the branch.

**Arguments:**

| Argument | Description |
|---|---|
| `[branch]` (optional) | The branch to unlink. |

---

### `gt untrack [branch]`

Stop tracking a branch with Graphite. If the branch has children, they will also be untracked.

**Arguments:**

| Argument | Description |
|---|---|
| `[branch]` (optional) | Branch to stop tracking. Defaults to current. |

**Flags:**

| Flag | Description |
|---|---|
| `-f, --force` | Do not prompt for confirmation before untracking a branch with children. |

---

### `gt up [steps]`

Switch to the child of the current branch. Prompts if ambiguous.

**Flags:**

| Flag | Description |
|---|---|
| `-n, --steps` | The number of levels to traverse upstack. |
| `--to` | Target branch to navigate towards. Selects the path leading to this branch when multiple children exist. |

---

### `gt upgrade`

Update your CLI to the latest stable version.