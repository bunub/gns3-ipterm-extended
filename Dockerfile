FROM gns3/ipterm:latest
# Metadata params
ARG BUILD_DATE
ARG VERSION
ARG VCS_URL
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.vcs-url=$VCS_URL \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.version=$VERSION \
    org.label-schema.name='IP terminal for GNS3' \
    org.label-schema.schema-version='1.0' \
    org.label-schema.docker.debug='docker logs $CONTAINER'
#    MAINTAINER="Francois Buntschu <francois.buntschu@hefr.ch>"
ENV DEBIAN_FRONTEND noninteractive
RUN set -x \
    && apt -yqq update \
    && apt -y install --no-install-recommends isc-dhcp-client dnsutils \
    && rm -rf /var/lib/apt/lists/* 
CMD ["bash"]