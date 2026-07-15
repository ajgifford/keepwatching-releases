#!/bin/bash

#######################################
# Appends one row to deployment-log.md, optionally prepends a release-notes
# entry to releases/<app-key>.md, and commits/pushes both changes together.
#
# Called by the deploy.sh / rollback.sh scripts in each of the 4 app repos
# after a deploy or rollback has already succeeded. This script does not
# know about per-app columns (package versions etc.) — the caller builds
# the full markdown row; this script just finds the right section and
# inserts it as the last row of that section's table.
#
# Usage:
#   record-deployment.sh <app-key> "<markdown-row>" ["<release-notes-entry>"]
#
# <app-key> is one of: client | admin-dashboard | api-server | admin-server
#
# <release-notes-entry>, if given and non-empty, is a full markdown section
# (e.g. "## v1.4.0 — 2026-07-15\n- did a thing\n- did another thing") that
# gets prepended into releases/<app-key>.md right after its title line.
# Callers pass this only for genuinely new-version deploys — omit or pass
# an empty string for redeploys/rollbacks so no entry is added.
#
# A push failure is a warning, not an error — the app deploy already
# succeeded by the time this runs, so losing a log entry is recoverable;
# failing the caller over a logging hiccup is not acceptable.
#######################################

set -e

APP_KEY="$1"
ROW="$2"
NOTES="$3"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
LOG_FILE="$REPO_DIR/deployment/deployment-log.md"
RELEASE_FILE="$REPO_DIR/releases/$APP_KEY.md"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() { echo -e "${GREEN}[record-deployment]${NC} $1"; }
warn() { echo -e "${YELLOW}[record-deployment] WARNING:${NC} $1"; }
fail() { echo -e "${RED}[record-deployment] ERROR:${NC} $1" >&2; }

if [ -z "$APP_KEY" ] || [ -z "$ROW" ]; then
    fail "Usage: record-deployment.sh <app-key> \"<markdown-row>\" [\"<release-notes-entry>\"]"
    exit 1
fi

case "$APP_KEY" in
    client)           SECTION="## Client" ;;
    admin-dashboard)  SECTION="## Admin Dashboard" ;;
    api-server)       SECTION="## API Server" ;;
    admin-server)     SECTION="## Admin Server" ;;
    *)
        fail "Unknown app-key '$APP_KEY' (expected client, admin-dashboard, api-server, or admin-server)"
        exit 1
        ;;
esac

if [ ! -f "$LOG_FILE" ]; then
    fail "Log file not found: $LOG_FILE"
    exit 1
fi

awk -v section="$SECTION" -v newrow="$ROW" '
{ lines[NR] = $0 }
END {
    start = 0
    for (i = 1; i <= NR; i++) {
        if (lines[i] == section) { start = i; break }
    }
    if (start == 0) {
        print "ERROR: section \"" section "\" not found in log file" > "/dev/stderr"
        exit 1
    }

    nextsec = NR + 1
    for (i = start + 1; i <= NR; i++) {
        if (lines[i] ~ /^## /) { nextsec = i; break }
    }

    insert_after = start
    for (i = start + 1; i < nextsec; i++) {
        if (lines[i] != "") insert_after = i
    }

    for (i = 1; i <= NR; i++) {
        print lines[i]
        if (i == insert_after) print newrow
    }
}
' "$LOG_FILE" > "$LOG_FILE.tmp"

mv "$LOG_FILE.tmp" "$LOG_FILE"
log "Row added to $SECTION in deployment-log.md"

COMMIT_MSG="log: record $APP_KEY deployment"

if [ -n "$NOTES" ]; then
    if [ ! -f "$RELEASE_FILE" ]; then
        warn "Release notes file not found: $RELEASE_FILE — skipping release notes entry."
    else
        TITLE=$(head -n1 "$RELEASE_FILE")
        REST=$(tail -n +3 "$RELEASE_FILE")
        {
            echo "$TITLE"
            echo ""
            echo "$NOTES"
            if [ -n "$REST" ]; then
                echo ""
                echo "$REST"
            fi
        } > "$RELEASE_FILE.tmp"
        mv "$RELEASE_FILE.tmp" "$RELEASE_FILE"
        log "Release notes entry added to releases/$APP_KEY.md"
        COMMIT_MSG="log: record $APP_KEY deployment + release notes"
    fi
fi

cd "$REPO_DIR" || exit 1
git add deployment/deployment-log.md
if [ -n "$NOTES" ] && [ -f "$RELEASE_FILE" ]; then
    git add "releases/$APP_KEY.md"
fi
git commit -m "$COMMIT_MSG" --quiet

if git push --quiet; then
    log "Deployment log pushed."
else
    warn "Could not push deployment log update. The commit was made locally"
    warn "in $REPO_DIR — push it manually next time you're able to."
fi
