#!/bin/bash

for path in files/*; do
  [ -f "$path" ] || continue          
  base=$(basename "$path")
  first=$(printf "%s" "$base" | cut -c1 | tr '[:upper:]' '[:lower:]')

  if ! [[ "$first" =~ [a-z] ]]; then
    echo "skip: $base (not a-z)"
    continue
  fi

  if [ -d "$first" ]; then
    mv "$path" "$first"/
  else
    echo "warn: folder '$first' not found"
  fi
done
