#!/bin/bash

format () {
  pat="$1"
  shift
  if git ls-files --error-unmatch "$pat"; then
    git ls-files "$pat" | xargs "$@"
  fi
}

format '*.py' python -m isort
format '*.py' python -m black -- -S -q
format '*.hs' ormolu
