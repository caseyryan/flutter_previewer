#!/bin/bash

set -e

REPO_NAME="flutter_previewer"
BUILD_DIR="build/web"
DEPLOY_DIR="docs"

echo "▶️ Building Flutter Web..."
fvm flutter build web --base-href="/$REPO_NAME/"

echo "🚮 Cleaning previous docs..."
rm -rf $DEPLOY_DIR
mkdir $DEPLOY_DIR

echo "📁 Copying build to docs/..."
cp -r $BUILD_DIR/* $DEPLOY_DIR/

echo "✅ Done. You can now commit and push:"
echo "    git add docs && git commit -m 'Deploy web build' && git push"
