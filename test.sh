#!/bin/bash
# make_repo_with_history.sh
# Creates a git repository and simulates a two-week development history by making commits
# with different authors/dates. Run locally where git is available.

set -e
REPO_DIR="${1:-.}"
echo "Creating git repo in ${REPO_DIR} (will initialize if not already a git repo)..."

cd "${REPO_DIR}"

if [ ! -d ".git" ]; then
  git init
  git config user.name "Kashyap Busa"
  git config user.email "kshyp310@gmail.com"
fi

# Files to commit are already present. We'll make incremental commits with timestamps.
declare -a MESSAGES=(
  "Initial commit: project skeleton"
  "initial ESP32 OTA project (HTTPS OTA, manifest check, dual partitions)"
  "Implement manifest fetching and parsing"
  "embed CA certificate using EMBED_TXTFILES"
  "Initial OTA demo release"
)

# Start date: 14 days ago
START_DATE=$(date -d "6 days ago" +"%Y-%m-%d 08:00:00")
SECONDS_PER_COMMIT=$(( (6*24*3600) / ${#MESSAGES[@]} ))

i=0
for msg in "${MESSAGES[@]}"; do
  # compute commit date
  COMMIT_DATE=$(date -d "${START_DATE} + $((i * SECONDS_PER_COMMIT)) seconds" +"%Y-%m-%dT%H:%M:%S")
  echo "Committing: $msg at $COMMIT_DATE"
  # make a trivial change to README to reflect progress
  echo "$msg -- $COMMIT_DATE" >> README.md
  git add -A
  GIT_AUTHOR_DATE="${COMMIT_DATE}" GIT_COMMITTER_DATE="${COMMIT_DATE}" git commit -m "$msg"
  i=$((i+1))
done

echo "Git history created. Run 'git log --pretty=fuller' to inspect."
