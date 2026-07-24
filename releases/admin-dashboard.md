# Admin Dashboard Release Notes

## v1.2.1 — 2026-07-24
- Correct project configuration to be able to read version from the package.json (2cb5d81)
- Add the current version to the bottom of the navigation panel (4fd3bb8)
- Set the component type for the accordion to avoid wrapping a button inside a button (9f63601)
- Add a unique identifier to the key for email dialogs to avoid conflicts with one another (d1dc8b8)
- Resolve test issue where state changes were not wrapped in an act(...) call (42080a0)

## v1.2.0 — 2026-07-24
- Correct dependency resolution for brace-expansion (f31541a)
- Add UI to support a workflow allowing the admin to edit the watch date/time of content for a profile (654e69a)
- Update dependencies to address security vulnerabilities (8359847)

## v1.1.0 — 2026-07-16
- Update the package version for release (deb8e98)
- Update the email management UI to better support templates; includes headers, footers and an email preview (af70eac)
- Resolve a critical security vulnerability with websocket-driver (89a9f5f)
- Update the deploy and rollback scripts to add release notes and set the deployer (b927e71)

## v1.0.0 — 2026-07-15

- Account and profile management, including statistics dashboards, profile comparison, and email verification
- Show/movie catalog management with detail pages, bulk update-all actions, and content filtering
- People/cast browsing with duplicate-detection audit tools for credits, seasons, and episodes
- Notification authoring and management, including digest emails and filtering/sorting
- Real-time and historical log viewing across app/nginx/console sources, plus DB health, query history, and job monitoring
- Site status monitoring with one-click service restarts
- Milestone and rating/recommendation management
- Profile transfer management between accounts
- Protected by Firebase authentication with reCAPTCHA on login
- Responsive UI on Material UI, with PWA support for mobile install
- Full automated test suite across pages, components, and hooks
- CI/CD via GitHub Actions with versioned, tagged deploys and automatic rollback
