FROM alpine:edge
RUN apk update && apk add --update ca-certificates openssl
RUN update-ca-certificates
RUN wget https://gitlab.com/ConorIA/alpine-pandoc/raw/master/conor@conr.ca-584aeee5.rsa.pub -O /etc/apk/keys/conor@conr.ca-584aeee5.rsa.pub
RUN echo https://conoria.gitlab.io/alpine-pandoc/ >> /etc/apk/repositories
RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update
RUN apk add curl pandoc cmark@testing
RUN adduser --help
RUN adduser -h /home/mdcurl -D -S mdcurl
COPY local/bin/mdcurl bin
COPY local/bin/mdcurl-wrapper bin
WORKDIR /home/mdcurl
CMD [ "mdcurl", "https://eyedeekay.github.io/apt-now/index.html" ]
