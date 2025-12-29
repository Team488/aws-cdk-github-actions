FROM alpine:3.17

RUN apk --update --no-cache add nodejs~20 npm python3 py3-pip jq curl bash git docker zip && \
	ln -sf /usr/bin/python3 /usr/bin/python

COPY --from=golang:alpine /usr/local/go/ /usr/local/go/
ENV PATH="/usr/local/go/bin:${PATH}"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
