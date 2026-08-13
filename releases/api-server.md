# API Server Release Notes

## v1.7.0 — 2026-08-13
- Update dependencies to incorporate streaming service preferences (5cee3c8)

## v1.6.0 — 2026-08-09
- Add controller and routes for onboarding tasks (09d2164)

## v1.5.2 — 2026-08-06
- Add a router to serve up trending content for the landing page (70d5c98)

## v1.5.1 — 2026-08-05
- Update version of common-server to correct a bug with profile creation auditing (148bf86)

## v1.5.0 — 2026-08-03
- Add new routes and a controller for the personalized recommendations for a profile endpoint (ca75b19)

## v1.4.1 — 2026-07-31
- Update stats controllers to handle custom date ranges for rewatch and watch list stats (23bf08e)

## v1.4.0 — 2026-07-30
- Add routes and controllers for managing user notes for seasons and episodes (2059b50)

## v1.3.0 — 2026-07-29
- Update to support sending account and profile data for auditing (580356b)

## v1.2.0 — 2026-07-28
- Update dependencies to support new preference type for watch tracking (99f1764)
- Add routes and controller for retrieving streaming service information (a9beb3f)

## v1.1.1 — 2026-07-26
- Update the show and movie controllers to return keepwatching content when transferring content to another profile (3ed8b25)

## v1.1.0 — 2026-07-26
- Update dependencies for security vulnerabilities (29c89c5)
- Update routes and controllers for content to allow watch history copying and moving and profile copying (cae45e0)

## v1.0.0 — 2026-07-15

- REST API for accounts, profiles, shows, movies, seasons, and episodes, with cascading watch-status updates (show → season → episode) backed by MySQL
- Layered architecture refactored over time into routes → controllers → services → DB-access modules, now built on the shared `keepwatching-common-server` package
- TMDB-backed discovery, search, and trending endpoints with a caching layer
- Scheduled (later pub/sub-driven) change detection that applies upstream TMDB updates to shows and movies
- System notifications with dismiss, mark-read/unread, and read workflows
- Enhanced statistics endpoints: velocity, binge/streak, milestones, content depth/discovery, abandonment risk, profile comparisons, and rewatch stats
- Prior-watch and rewatch-aware endpoints across shows, seasons, episodes, and movies
- Watchlist and calendar-content endpoints
- Person search, person details, and cast endpoints
- Cross-account profile transfer endpoints
- Firebase authentication (replacing password-based auth), rate limiting, suspicious-request blocking, and reCAPTCHA verification middleware
- Account/profile image upload, storage, and deletion
- Real-time push updates over WebSocket for favorites and status changes
- Extensive unit test suite across models, services, and controllers
- Redis-backed caching and pub/sub
- GitHub Actions CI and versioned/tagged/rollback-capable deploy scripts
