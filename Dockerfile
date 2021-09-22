FROM codenarc/codenarc:2.2.0-groovy3.0.8

RUN DEBIAN_FRONTEND=noninteractive \
apt-get update && \
apt-get install --no-install-recommends -y wget git && \
apt-get clean && rm -rf /var/lib/apt/lists/* 

ENV REVIEWDOG_VERSION=v0.13.0

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]