FROM java:8-alpine

RUN apk add --no-cache wget

RUN wget -qO- -O owasp.zip http://dl.bintray.com/jeremy-long/owasp/dependency-check-1.4.3-release.zip && \
    unzip owasp.zip && \
    rm owasp.zip

RUN /dependency-check/bin/dependency-check.sh --updateonly

ENTRYPOINT ["/dependency-check/bin/dependency-check.sh"]