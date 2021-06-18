FROM alpine:3.13

RUN \
 echo "**** install packages ****" && \
 apk add --no-cache bash git curl automake autoconf libtool pkgconf gcc g++ popt-dev libidn-dev make file

CMD ["/bin/bash"]

COPY SRC/ /build/

WORKDIR /build/

RUN \
 echo "**** build echoping ****" && \
 ./recreate-autofiles && \
 CFLAGS="-fcommon" ./configure --enable-static && \
 make install
