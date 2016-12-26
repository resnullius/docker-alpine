FROM resnullius/alpine-armv7l:3.5
COPY scripts/mkimage-alpine.bash scripts/apk-install /
RUN /apk-install bash tzdata
ENTRYPOINT ["/mkimage-alpine.bash"]
