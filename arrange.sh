#!/bin/bash
# files/ 안 파일들을 첫 글자(대/소문자 무시) 기준으로 a~z 폴더로 이동

for path in files/*; do
  [ -f "$path" ] || continue             # 파일만 처리
  base=$(basename "$path")
  first=$(printf "%s" "$base" | cut -c1 | tr '[:upper:]' '[:lower:]')

  # a~z 이외 문자는 건너뛴다 (옵션)
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
