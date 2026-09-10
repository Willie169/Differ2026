#!/usr/bin/env bash

shopt -s globstar nullglob
for f in Differ2026/**/*.ipynb; do
  test -f "$f" || continue
  (
    cd "$(dirname "$f")" || exit
    ipynb="$(basename "$f")"
    jupytext "$ipynb" --output "$ipynb.md"
  )
done
