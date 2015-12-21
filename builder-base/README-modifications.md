# How to make modifications on the builder

If you change anything inside the `scripts/` directory, run `./update-builder.sh run`; the content of `builder-base/scripts` will be copied over to `builder-$ARCH/scripts` and overwrite whatever is inside those folders and it exists on `builder-base/scripts`.

The `Dockerfile` is per builder, so there's no base to copy over.
