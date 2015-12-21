#!/usr/bin/env bash

declare help="
Update script for Alpine's docker versions.

Usage:
  update-versions.bash run
  update-versions.bash --version
  update-versions.bash -h | --help

Options:
  -h --help           Show this screen.
  --version           Show versions.
"

declare version="
Version: 1.0.0.
Licensed under the BSD terms.
"

declare ARCH="$(uname -m)"
declare VERSIONS_BASE="${VERSIONS_BASE:-versions-base}"
declare VERSIONS_CHILDS="${VERSIONS_CHILDS:-versions-armv7l versions-x86_64}"

run_updater() {
  for ver in $VERSIONS_CHILDS; do
    echo "Copying scripts from $BUILDER_BASE to $builder"
    cp -r $VERSIONS_BASE/* $ver
    create_tag "$ver"
    [[ "$ARCH" -eq "x86_64" ]]
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
