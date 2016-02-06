setup() {
  docker history resnullius/alpine:3.3 >/dev/null 2>&1
}

@test "version is correct" {
  run docker run --rm resnullius/alpine:3.3 cat /etc/os-release
  [ $status -eq 0 ]
  [ "${lines[2]}" = "VERSION_ID=3.3.0" ]
}

@test "package installs cleanly" {
  run docker run --rm resnullius/alpine:3.3 apk add --update openssl
  [ $status -eq 0 ]
}

@test "timezone" {
  run docker run --rm resnullius/alpine:3.3 date +%Z
  [ $status -eq 0 ]
  [ "$output" = "UTC" ]
}

@test "apk-install script should be available" {
  run docker run --rm resnullius/alpine:3.3 which apk-install
  [ $status -eq 0 ]
}

@test "repository list is correct" {
  run docker run --rm resnullius/alpine:3.3 cat /etc/apk/repositories
  [ $status -eq 0 ]
  [ "${lines[0]}" = "http://nl.alpinelinux.org/alpine/v3.3/main" ]
  [ "${lines[1]}" = "http://nl.alpinelinux.org/alpine/v3.3/community" ]
  [ "${lines[2]}" = "" ]
}

@test "cache is empty" {
  run docker run --rm resnullius/alpine:3.3 sh -c "ls -1 /var/cache/apk | wc -l"
  [ $status -eq 0 ]
  [ "$output" = "0" ]
}
