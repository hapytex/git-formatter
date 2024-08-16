#!/bin/bash

format () {
  pat="$1"
  shift
  if git ls-files --error-unmatch "$pat" 2>/dev/null; then
    git ls-files "$pat" | xargs -- "$@" --
  fi
}

format '*.hs' ormolu
format '*.py' python3 -m isort --
format '*.py' python3 -m black -- -S -q
format '*.sql' sqlformat --reindent -s --keywords upper --identifiers lower
format '*.yaml' yamlfmt -w
format '*.yml' yamlfmt -w
