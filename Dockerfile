FROM alpine:3.17

ENV SB_HOME=/opt/woongzz0110/sysbench

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
RUN mkdir -p ${SB_HOME}/lua
RUN mkdir -p ${SB_HOME}/src/run
RUN mkdir -p ${SB_HOME}/log
RUN chown -R 1001 ${SB_HOME}/log

WORKDIR ${SB_HOME}
RUN cp -rf /clone/sysbench/src/lua/*.lua ${SB_HOME}/lua
RUN rm -rf /clone

ADD ./src/run ${SB_HOME}/src/run
RUN chmod +x -R ${SB_HOME}/src/run
########################

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x -R /entrypoint.sh

USER 1001
VOLUME ["${SB_HOME}"]
entrypoint ["/entrypoint.sh"]