#!/usr/bin/env bash

shopt -s globstar nullglob
for f in Differ2026/**/*.ipynb; do
  (
    cd "$(dirname "$f")" || exit
    ipynb="$(basename "$f")"
    jupytext "$ipynb" --output "$ipynb.md"
  )
done
for f in Differ2026/**/*.html; do
  cp "$f" "$f.md"
done
soffice --convert-to csv:"Text - txt - csv (StarCalc)":44,34,76,1,,,,,,,,-1 Differ2026/**/*.xlsx
