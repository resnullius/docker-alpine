setup() {
  docker history resnullius/alpine:edge >/dev/null 2>&1
}

@test "arch is correct" {
  run docker run --rm resnullius/alpine:edge cat /etc/apk/arch
  [ $status -eq 0 ]
  [ "${lines[0]}" = "x86_64" ]
}

@test "package installs cleanly" {
  run docker run --rm resnullius/alpine:edge apk add --update openssl
  [ $status -eq 0 ]
}

@test "timezone" {
  run docker run --rm resnullius/alpine:edge date +%Z
  [ $status -eq 0 ]
  [ "$output" = "UTC" ]
}

@test "apk-install script should be available" {
  run docker run --rm resnullius/alpine:edge which apk-install
  [ $status -eq 0 ]
}

@test "repository list is correct" {
  run docker run --rm resnullius/alpine:edge cat /etc/apk/repositories
  [ $status -eq 0 ]
  [ "${lines[0]}" = "http://nl.alpinelinux.org/alpine/edge/main" ]
  [ "${lines[1]}" = "http://nl.alpinelinux.org/alpine/edge/community" ]
  [ "${lines[2]}" = "" ]
}

@test "cache is empty" {
  run docker run --rm resnullius/alpine:edge sh -c "ls -1 /var/cache/apk | wc -l"
  [ $status -eq 0 ]
  [ "$output" = "0" ]
}
