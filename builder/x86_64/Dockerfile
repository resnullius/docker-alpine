FROM resnullius/alpine:3.5
COPY scripts/* /bin/
RUN /bin/apk-install bash tzdata
ENTRYPOINT ["/bin/mkimage-alpine.bash"]
