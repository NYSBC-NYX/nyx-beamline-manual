#!/bin/bash

### Immediately below is old code
###
#echo "Deploying updates to GitHub Pages..."
## This pushes only the _build folder to the gh-pages branch
#git subtree push --prefix _build origin gh-pages
#echo "Done! Your site should update in about a minute."

### Below is new code on 20260128

#!/bin/bash

# 1. Stop if any command fails
set -e

echo "🔨 Running Sphinx build..."
# This generates the HTML and puts it into the /docs folder
# Using -b html ensures it's a standard web build
sphinx-build -b html . docs

# 2. Ensure GitHub doesn't try to use Jekyll
touch docs/.nojekyll

echo "📦 Adding changes to Git..."
git add .

# 3. Use a generic message or allow a custom one
MESSAGE="Update manual: $(date +'%Y-%m-%d %H:%M:%S')"
if [ -n "$1" ]; then
    MESSAGE="$1"
fi

echo "💾 Committing with message: '$MESSAGE'..."
git commit -m "$MESSAGE"

echo "🚀 Pushing to GitHub main branch..."
git push origin main

echo "✅ Done! Your site should update at the URL in about a minute."


