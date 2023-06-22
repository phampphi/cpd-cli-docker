FROM busybox:1.36

ENV CPD_API_USER=admin
ENV CPD_API_KEY=api-key
ENV CPD_PROFILE_URL=
ENV CPD_PROFILE=cpd-profile

ENV VERSION=cpd-cli-linux-SE-12.0.6
ENV SUB_VERSION=cpd-cli-linux-SE-12.0.6-63

COPY ./rootfs /home
RUN cd /home && \
    wget https://github.com/IBM/cpd-cli/releases/download/v12.0.6/$VERSION.tgz && \
    tar zxvf /home/$VERSION.tgz && rm -rf /home/$VERSION.tgz && \
    mv /home/$SUB_VERSION /home/bin && \
    chmod +x /home/entrypoint.sh

WORKDIR /home/bin

ENTRYPOINT ["/home/entrypoint.sh"]
CMD ["cpd-cli"]