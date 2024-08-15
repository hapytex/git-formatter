#!/bin/bash

format () {
  pat="$1"
  shift
  if git ls-files --error-unmatch "$pat"; then
    git ls-files "$pat" | xargs "$@"
  fi
}

format '*.hs' ormolu
format '*.sql' sqlformat -reindent -s -keywords upper -identifiers lower
format '*.py' python -m isort
format '*.py' python -m black -- -S -q
