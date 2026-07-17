# Client Release Notes

## v1.0.3 — 2026-07-17
- Update manage account layout to correctly position components for all screen sizes (149f394)

## v1.0.2 — 2026-07-16
- Resolve an issue where dates were incorrectly displaying the next day (2d3cb68)

## v1.0.1 — 2026-07-16
- Resolve a critical security vulnerability with websocket-driver (f99ea7a)
- Update the spacing on the navigation banner for small format screens (8d97304)

## v1.0.0 — 2026-07-15

- Multi-profile accounts with profile pictures, accent colors, and PWA install support
- Show/movie tracking with a show → season → episode watch-status hierarchy, bulk mark-watched, rewatch tracking, skip handling, and prior-watch date correction for content watched before account creation
- Discovery by streaming service, trending content, and search across shows, movies, and people (with person detail/filmography pages)
- Home dashboard with keep-watching, recent/upcoming episodes and movies, and a by-service view
- Real-time notifications via WebSocket, a notification center, digest email preferences, and read/unread management
- Content calendar with agenda and calendar views, date-range selection, and ICS export
- Paginated watch history with filters and rewatch management
- A prioritized watchlist with a "Help Me Decide" wizard
- Enhanced statistics dashboards (velocity, timeline, binge patterns, streaks, milestones, content depth/discovery, abandonment risk, profile comparisons)
- An achievements/badges page with toast and navigation-badge notifications
- Shareable monthly/yearly recap cards
- Profile transfer between accounts and full profile data export
- Firebase authentication (email/password and Google OAuth) with reCAPTCHA
- Dark/light theming and a responsive layout across Material UI v6 through v9
- Real-time cross-device sync driven by WebSocket events
- Full Jest test suite, GitHub Actions CI, and versioned/tagged/rollback-capable deploys
- Build tooling migrated from Create React App to Vite
