# Admin Server Release Notes

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
