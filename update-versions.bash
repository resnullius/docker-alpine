#!/usr/bin/env bash
# vim: ft=sh

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

declare VERSIONS_BASE="${VERSIONS_BASE:-versions/base}"
declare VERSIONS_CHILDS="${VERSIONS_CHILDS:-versions/armv7l versions/x86_64}"

create_tag() {
  local OPTIONS="${OPTIONS:-$1/**/options}"
  for file in $OPTIONS; do
    echo "$file should be updated"
    sed -i '' -e 's/alpine:/alpine-armv7l:/g' "$file"
  done
}

run_updater() {
  for ver in $VERSIONS_CHILDS; do
    echo "Copying scripts from $VERSIONS_BASE to $ver"
    cp -R "$VERSIONS_BASE/" "$ver"
    [[ "$ver" = "versions/armv7l" ]] && create_tag "$ver"
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
