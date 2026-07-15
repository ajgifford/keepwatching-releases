# KeepWatching Releases

Deployment history and release tracking across the KeepWatching application family:
- `keepwatching-types`
- `keepwatching-ui`
- `keepwatching-common-server`
- `keepwatching-client`
- `keepwatching-admin-dashboard`
- `keepwatching-api-server`
- `keepwatching-admin-server`

## Release Notes

Human-readable, per-app changelogs — one entry per new version actually deployed:

- [Client](./releases/client.md)
- [Admin Dashboard](./releases/admin-dashboard.md)
- [API Server](./releases/api-server.md)
- [Admin Server](./releases/admin-server.md)


## Deployments

- [Deployment Log](./deployment/deployment-log.md) — Auto-generated, combined deploy/rollback history for all 4 apps, one table per app. Written to by `deployment/scripts/record-deployment.sh`; don't hand-edit except for historical backfills.
- [Versioning & Deployment Log](./deployment/versioning-and-deployment-log.md) — How semver bumps, deploy-time git tagging, and the combined deployment log work across all 4 apps.