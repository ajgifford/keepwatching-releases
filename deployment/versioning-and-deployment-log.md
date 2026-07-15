# Versioning & Deployment Log

How the 4 KeepWatching apps (client, admin-dashboard, api-server, admin-server)
are versioned, tagged, and tracked across deploys.

---

## Versioning scheme

Each app's `package.json` `version` field follows semver (`MAJOR.MINOR.PATCH`).
Bumps are manual and deliberate — there is no auto patch-bump on every deploy.

To bump a version, run from the app's repo:

```bash
yarn bump-version patch   # or minor / major
```

This is a `package.json` script alias for `npm version --no-git-tag-version`. It
updates the `version` field in `package.json` only — no git commit, no git tag.
Review and commit the change yourself:

```bash
git add package.json
git commit -m "chore: bump version to vX.Y.Z"
git push
```

No git tag is created at bump time — tagging happens at deploy time (see below),
so the tag always points at the exact commit that's actually live in
production, not the commit where the version happened to be bumped.

Bump before merging/deploying a release. If you deploy without bumping, the
deploy script will only complain if the current version's tag already points
at a _different_ commit (see next section) — redeploying the same version at
the same commit is fine and expected (e.g. re-running a deploy after a config
change).

## Deploy-time tagging

Each app's deploy script (`deploy.sh`, same name in all 4 app repos) tags the
deployed commit as `vX.Y.Z` (read from `package.json`) and pushes the tag to
GitHub, as its last step after a successful deploy:

- If `vX.Y.Z` doesn't exist yet → create and push it.
- If `vX.Y.Z` already exists and points at this same commit → skip (redeploy).
- If `vX.Y.Z` already exists but points at a **different** commit → the deploy
  script **aborts before publishing**, with an error telling you to bump the
  version first. This is the guard against silently shipping new code under a
  version number that already means something else.

Tags live in each app's own repo (`keepwatching-client`, `keepwatching-admin-dashboard`,
`keepwatching-api-server`, `keepwatching-admin-server`) — there's no cross-repo
tag namespacing needed since they're separate GitHub repos.

## Shared package versions

`@ajgifford/keepwatching-types`, `@ajgifford/keepwatching-common-server`, and
`@ajgifford/keepwatching-ui` are versioned and tagged independently — those repos
already have a mature `publish.yml` GitHub Action that fires on `v*.*.*` tag
pushes, builds, publishes to GitHub Package Registry, and cuts a GitHub Release.

Each of those workflows generates its own release-notes body — a flat bullet
list from `git log --no-merges` between the previous tag and the new one
(same style as the deploy scripts below), with the version-bump commit itself
filtered out. That custom body is prepended to GitHub's own auto-generated
notes (`generate_release_notes: true`), so the Release page shows the bullet
list followed by GitHub's "Full Changelog: vX...vY" compare link. Unlike the
4 apps, these release notes live on each package's own GitHub Releases page,
not in this repo — see the [Packages section of the README](../README.md#packages)
for links. This repo has no push access to those 3 package repos and doesn't
need any — the whole thing runs inside each package's own Actions job.

What deploy-time logging adds is traceability from the consumer side: each app's
row in `deployment-log.md` records which version of `types` (and `ui` or
`common-server`, whichever it depends on) was actually resolved in `yarn.lock`
at deploy time — so if a bug shows up in production, you can tell at a glance
whether it correlates with a shared-package bump.

## Deployment log

`deployment-log.md` in this directory is the combined, automated record of
every deploy and rollback across all 4 apps — replacing the old manually kept
tracking document. It's one file with one section (and one markdown table) per
app, so history is easy to scan per project; rows are appended chronologically.

Each deploy/rollback script calls the shared `scripts/record-deployment.sh`
as its last step (only after a deploy has actually succeeded, so failed deploys
never get logged as if they landed), which appends a row to the right app's
table and commits + pushes the change from this repo.

Rows dated before **2026-07-08** are backfilled from the previous manual
document and predate this versioning scheme — their Version/Tag and
shared-package columns are marked `—` because no version existed at deploy
time yet.

## Release notes

Each app also has a running changelog at [`releases/<app>.md`](../releases/)
(`client.md`, `admin-dashboard.md`, `api-server.md`, `admin-server.md`). Unlike
the deployment log, this isn't a raw automation record — it's meant to be
readable on its own as "what changed in this app, release by release."

An entry is only added when a deploy actually creates a **new** version tag —
redeploys of an already-tagged commit and rollbacks don't get one, since
nothing new shipped. When a new tag is created, the deploy script:

1. Finds the previous tag reachable from the deploy commit
   (`git describe --tags --abbrev=0`).
2. Builds a bullet list from `git log --no-merges` between that previous tag
   and the new commit (one bullet per commit subject). If there's no previous
   tag (the app's first-ever tagged release), the entry just says
   "Initial tagged release" instead of dumping the app's entire pre-versioning
   history.
3. Passes the resulting `## vX.Y.Z — YYYY-MM-DD` section as a third argument
   to `record-deployment.sh`, which prepends it to `releases/<app>.md` (right
   after the file's title line) and commits it alongside that deploy's
   `deployment-log.md` row, in the same push.

Because commit messages in these repos are plain descriptive sentences (no
conventional-commit prefixes), entries are a flat bullet list rather than
grouped Features/Fixes sections.

### One-time Pi setup

The deploy scripts need this repo cloned on the Pi (it isn't required for
running the apps themselves, only for logging):

```bash
git clone <repo-url> ~/git/keepwatching-releases
```

Push credentials must be configured the same way they already are for the app
repos, since `record-deployment.sh` pushes commits here just like the deploy
scripts already push tags to their own repos.
