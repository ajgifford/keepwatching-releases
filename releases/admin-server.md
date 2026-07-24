# Admin Server Release Notes

## v1.2.0 — 2026-07-23
- Update package version for release (a27fdca)
- Add routes and controller to allow editing of watch date/time for content by an admin (83c8f55)

## v1.1.0 — 2026-07-16
- Update the package version for release (8809534)
- Update email routes and controller for enhanced support for email templates (c907ab5)
- Resolve a critical security vulnerability with websocket-driver (ee45437)
- Correct formatting (868ebf5)
- Update the deploy and rollback scripts to add release notes and set the deployer; rename the deploy script to match the other repos (81fac56)

## v1.0.0 — 2026-07-15

- REST API backing the admin dashboard for accounts, profiles, shows, movies, and people
- Show/movie/people content management including bulk update-all and duplicate detection (episodes, seasons, credits) with cleanup endpoints
- Notification management with filtering, sorting, and typed/dated notifications
- Enhanced statistics endpoints: profile/account analytics, velocity, activity, monthly performance, profile comparison
- Log aggregation and parsing across nginx/console/app sources with real-time streaming and timezone-correct rotation handling
- DB health, query history, and Redis/job monitoring endpoints
- Site status monitoring and service-restart endpoints, plus a cert-expiry monitoring script
- Profile transfer request handling
- Firebase-authenticated routes with captcha verification middleware
- HTTPS-only in production
- Full unit test suite
- CI/CD via GitHub Actions (Tailscale-tunneled deploys) with versioned, tagged, rollback-capable deploy scripts
