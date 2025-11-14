#!/bin/bash
# Simple helper to create a manifest.json for testing
FW_URL="$1"
VERSION="$2"
SHA=$(sha256sum $3 | awk '{print $1}')
cat > manifest.json <<EOF
{
  "version": "$VERSION",
  "url": "$FW_URL",
  "sha256": "$SHA"
}
EOF
echo "Wrote manifest.json"
