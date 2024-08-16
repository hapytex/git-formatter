#!/bin/bash

format () {
  pat="$1"
  shift
  if git ls-files --error-unmatch "$pat" 2>/dev/null; then
    git ls-files "$pat" | xargs -- "$@" --
  fi
}
formatp () {
  opar="$1"
  shift
  pat="$1"
  shift
  for f in `git ls-files --error-unmatch "$pat" 2>/dev/null`; do
    "$@" "$opar" "$f" -- "$f"
  done
}


format '*.hs' ormolu
format '*.py' python3 -m isort --
format '*.py' python3 -m black -- -S -q
formatp -o '*.sql' sqlformat --reindent -s --keywords upper --identifiers lower
format '*.yaml' yamlfmt -w
format '*.yml' yamlfmt -w
