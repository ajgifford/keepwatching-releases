# API Server Release Notes

## Pre-release — 2026-07-15

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
