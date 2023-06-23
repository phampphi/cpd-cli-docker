FROM busybox:1.36

ENV CPD_API_USER=admin
ENV CPD_API_KEY=api-key
ENV CPD_PROFILE_URL=
ENV CPD_PROFILE=cpd-profile

ENV VERSION=cpd-cli-linux-SE-12.0.6
ENV SUB_VERSION=cpd-cli-linux-SE-12.0.6-63

COPY ./rootfs /
RUN cd /usr/bin && \
    wget https://github.com/IBM/cpd-cli/releases/download/v12.0.6/$VERSION.tgz && \
    tar zxvf /usr/bin/$VERSION.tgz && rm -rf /usr/bin/$VERSION.tgz && \
    mv /usr/bin/$SUB_VERSION /usr/bin/cpd-cli && \
    chmod +x /entrypoint.sh

WORKDIR /usr/bin/cpd-cli

ENTRYPOINT ["/entrypoint.sh"]