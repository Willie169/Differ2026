#!/usr/bin/env bash

shopt -s globstar nullglob
for f in Differ2026/**/*.ipynb; do
  (
    cd "$(dirname "$f")" || exit
    file="$(basename "$f")"
    jupytext "$file" --output "$file.md"
  )
done
for f in Differ2026/**/*.html; do
  cp "$f" "$f.md"
done
for f in Differ2026/**/*.ipynb; do
  (
    cd "$(dirname "$f")" || exit
    file="$(basename "$f")"
    soffice --convert-to csv:"Text - txt - csv (StarCalc)":44,34,76,1,,,,,,,,-1 "$file"
  )
done
