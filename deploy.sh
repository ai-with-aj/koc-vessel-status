#!/bin/bash
# Run once in Terminal to authenticate and deploy to Vercel.
# After this, every file change auto-commits and re-deploys via the Claude hook.

export PATH="$HOME/.node/bin:$PATH"
export VERCEL_TELEMETRY_DISABLED=1
cd "$(dirname "$0")"

echo ">>> Logging into Vercel (your browser will open)..."
npx vercel login

echo ""
echo ">>> Deploying koc-vessel-status to production..."
npx vercel --prod --yes

echo ""
echo "Done. Copy the URL above and share it. Future changes auto-deploy."
