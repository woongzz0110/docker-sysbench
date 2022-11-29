FROM alpine:latest

RUN apk update
RUN apk --no-cache add bash git autoconf build-base \
    make automake libtool pkgconfig libaio-dev \
    mariadb-dev openssl-dev \
    postgresql-dev postgresql-client

# install sysbench
RUN git clone -b 1.0.20 https://github.com/akopytov/sysbench.git /clone/sysbench
WORKDIR /clone/sysbench
RUN ./autogen.sh
RUN ./configure --with-pgsql
RUN make -j
RUN make install
########################

# make workdir
RUN mkdir -p /opt/woongzz0110/sysbench/lua
RUN mkdir -p /opt/woongzz0110/sysbench/src/run
RUN mkdir -p /opt/woongzz0110/sysbench/log
RUN chown -R 1001 /opt/woongzz0110/sysbench/log
WORKDIR /opt/woongzz0110/sysbench

RUN cp -rf /clone/sysbench/src/lua/*.lua /opt/woongzz0110/sysbench/lua
RUN rm -rf /clone

ADD ./src/run /opt/woongzz0110/sysbench/src/run
RUN chmod +x -R /opt/woongzz0110/sysbench/src/run

VOLUME [ "/opt/woongzz0110/sysbench" ]
########################

ADD ./src/entrypoint.sh /entrypoint.sh
RUN chmod +x -R /entrypoint.sh

USER 1001
CMD [ "/entrypoint.sh" ]