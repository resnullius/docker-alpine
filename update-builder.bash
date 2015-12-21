#!/usr/bin/env bash

declare help="
Update script for Alpine's docker builder.

Usage:
  update-builder.bash run
  update-builder.bash --version
  update-builder.bash -h | --help
"

declare version="
Version: 1.0.0.
Licensed under the BSD terms.
"

declare BUILDER_BASE="${BUILDER_BASE:-builder-base}"
declare BUILDER_CHILDS="${BUILDER_CHILDS:-builder-armv7l builder-x86_64}"

run_updater() {
  for builder in $BUILDER_CHILDS; do
    echo "Copying scripts from $BUILDER_BASE to $builder"
    cp -r $BUILDER_BASE/scripts $builder/
  done
}

version() {
  echo "$version"
}

help() {
  echo "$help"
}

main() {
  set -eo pipefail; [[ "$TRACE" ]] && set -x
  declare cmd="$1"
  case "$cmd" in
    run)          shift; run_updater "$@";;
    -h|--help)    shift; help "$@";;
    --version)    shift; version;;
    *)            help "$@";;
  esac
}

main "$@"
