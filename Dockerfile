FROM busybox:1.36

ENV CPD_API_USER=admin
ENV CPD_API_KEY=api-key
ENV CPD_PROFILE_URL=
ENV CPD_PROFILE=cpd-profile

COPY ./rootfs /home
RUN cd /home && \
    wget https://github.com/IBM/cpd-cli/releases/download/v12.0.6/cpd-cli-linux-SE-12.0.6.tgz && \
    tar zxvf /home/cpd-cli-linux-SE-12.0.6.tgz && rm -rf /home/cpd-cli-linux-SE-12.0.6.tgz && \
    mv /home/cpd-cli-linux-SE-12.0.6-63 /home/bin && \
    chmod +x /home/entrypoint.sh

WORKDIR /home/bin

ENTRYPOINT ["/home/entrypoint.sh"]
CMD ["cpd-cli"]