#!/bin/bash
echo "Deploying updates to GitHub Pages..."
# This pushes only the _build folder to the gh-pages branch
git subtree push --prefix _build origin gh-pages
echo "Done! Your site should update in about a minute."
