FROM alpine:latest

# install openssh-client and bash
RUN apk add --no-cache openssh-client bash

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
