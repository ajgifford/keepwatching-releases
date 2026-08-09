# Client Release Notes

## v1.5.0 — 2026-08-09
- v1.5.0 (30f48c5)
- Update to incorporate an onboarding checklist for new accounts (9132ba4)

## v1.4.1 — 2026-08-06
- Update build settings to ignore screenshot assets (c26067c)
- Update the landing page to include trending content and screenshots (f6f2554)
- Add the google signup/login button to the register page (30a6392)

## v1.4.0 — 2026-08-04
- Update the Discover page to include a personalized recommendations tab 'For You' showing content based on the profiles own favorited and starred content (42d21c8)

## v1.3.2 — 2026-08-03
- Correct the sizing of the recap dialog for small screens (a9bd403)

## v1.3.1 — 2026-07-31
- Update the statistics controls to allow passing custom dates for rewatch and watch list stats (3ca1f54)

## v1.3.0 — 2026-07-30
- Add UI to allow users to log notes about seasons and episodes (bb32ff2)

## v1.2.1 — 2026-07-29
- Update how accounts and profiles deletions are handled in the client, ensuring admin actions are handled (dc30f09)

## v1.2.0 — 2026-07-28
- Update how marking random episodes of a show is handled, useful for watching something like a game show out of order (ec9686d)
- Remove the hard-coded services constants and instead retrieve them from the service layer (a0071b9)

## v1.1.1 — 2026-07-26
- Update the conditions under which the catch up card is displayed so that it doesn't display for a show that hasn't been watched (68d0e6f)
- Update the profiles keepwatching content after transferring content (7599d50)
- Handle additional test case condition in suppressing console messages (443f716)

## v1.1.0 — 2026-07-26
- v1.1.0 (d99bd05)
- Switch from react-router-dom to react-router and update testing infrastructure (6df6589)
- Add UI to support duplicating a profile an copying show watch history between profiles (c8b6461)

## v1.0.4 — 2026-07-24
- Correct project configuration to be able to read version from the package.json (2323c5c)
- Update dependencies for security vulnerabilities (5705f7f)
- Add the current version to the footer (1ff7131)

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
