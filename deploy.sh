#!/bin/bash
# One-time Vercel setup & deploy for KOC Vessel Status
# Run this once from Terminal: bash ~/Desktop/vessel\ status/deploy.sh

export PATH="$HOME/bin:$PATH"
cd "$(dirname "$0")"

if ! command -v node &>/dev/null; then
  echo "Node not found at ~/bin/node. Re-downloading..."
  curl -fsSL -o /tmp/node.tar.gz https://nodejs.org/dist/v22.13.0/node-v22.13.0-darwin-arm64.tar.gz
  tar -xzf /tmp/node.tar.gz -C /tmp/
  cp /tmp/node-v22.13.0-darwin-arm64/bin/node ~/bin/node
fi

VERCEL_TELEMETRY_DISABLED=1

echo ""
echo "=== Step 1: Login to Vercel (browser will open) ==="
node "$(dirname "$(node -e "require.resolve('vercel/package.json')" 2>/dev/null || echo /tmp/vercel)")" 2>/dev/null || \
  npx --yes vercel login

echo ""
echo "=== Step 2: Deploy to production ==="
npx vercel --prod --yes

echo ""
echo "Done! Copy the URL above and share it with your team."
