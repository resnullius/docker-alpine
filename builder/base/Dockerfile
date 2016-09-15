FROM resnullius/alpine-armv7l:3.4
COPY scripts/mkimage-alpine.bash scripts/apk-install /
RUN /bin/apk-install bash tzdata
ENTRYPOINT ["/bin/mkimage-alpine.bash"]
