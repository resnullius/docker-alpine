FROM resnullius/alpine:3.4
COPY scripts/* /bin/
RUN /bin/apk-install bash tzdata
ENTRYPOINT ["/bin/mkimage-alpine.bash"]
