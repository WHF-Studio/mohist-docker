# build stage for minecraft 1.12.2
FROM alpine as build-1.12.2
ENV version=1.12.2

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=1.2.0

RUN mkdir /app
WORKDIR /app
COPY script/download.sh /app

# 同意eula

# 授权脚本
RUN chmod a+x /app/download.sh

# 下载服务器
RUN /app/download.sh --minecraft $version

# run stage for minecraft 1.12.2
FROM azul/zulu-openjdk-alpine:8-jre-latest AS run-1.12.2
ENV version=1.12.2

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=1.2.1

RUN mkdir /app /script
WORKDIR /app

COPY --from=mohist-docker:build-1.12.2 /app/server.jar /jbin/server.jar
COPY script/*.sh /script/

RUN chmod a+x /script/*.sh
RUN /script/init.sh


ENTRYPOINT [ "/script/launch.sh" ]

# build stage for minecraft 1.16.5

FROM alpine as build-1.16.5
ENV version=1.16.5

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=1.2.0

RUN mkdir /app
WORKDIR /app

# 拷贝脚本
COPY script/download.sh /app

# 授权脚本
RUN chmod a+x /app/download.sh

RUN /app/download.sh --minecraft $version
# run stage for minecraft 1.16.5
FROM azul/zulu-openjdk-alpine:11-jre-headless-latest AS run-1.16.5
ENV version=1.16.5

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=1.2.1

RUN mkdir /app /script
WORKDIR /app

COPY --from=mohist-docker:build-1.16.5 /app/server.jar /jbin/server.jar
COPY script/*.sh /script/

RUN chmod a+x /script/*.sh
RUN /script/init.sh

ENTRYPOINT [ "/script/launch.sh" ]

# build stage for minecraft 1.18.2

FROM alpine as build-1.18.2
ENV version=1.18.2

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=1.2.0

RUN mkdir /app
WORKDIR /app

COPY script/download.sh /app

RUN chmod a+x /app/download.sh
RUN /app/download.sh --minecraft $version

# run stage for minecraft 1.18.2

FROM azul/zulu-openjdk-alpine:17-jre-headless-latest AS run-1.18.2
ENV version=1.18.2

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=1.2.1

RUN mkdir /app /script
WORKDIR /app

COPY --from=mohist-docker:build-1.18.2 /app/server.jar /jbin/server.jar
COPY script/*.sh /script/

RUN chmod a+x /script/*.sh
RUN /script/init.sh

ENTRYPOINT [ "/script/launch.sh" ]

# build stage for minecraft 1.19.2

FROM alpine as build-1.19.2

ENV version=1.19.2

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=1.2.0

RUN mkdir /app
WORKDIR /app

COPY script/download.sh /app

RUN chmod a+x /app/download.sh \
	&& /app/download.sh --minecraft $version

# run stage for minecraft 1.19.2
FROM azul/zulu-openjdk-alpine:17-jre-headless-latest AS run-1.19.2
ENV version=1.19.2

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=1.2.1

RUN mkdir /app /script
WORKDIR /app

COPY --from=mohist-docker:build-1.19.2 /app/server.jar /jbin/server.jar
COPY script/*.sh /script/

RUN chmod a+x /script/*.sh
RUN /script/init.sh

ENTRYPOINT [ "/script/launch.sh" ]

# build stage for minecraft 1.20
FROM alpine AS build-1.20

ENV version=1.20

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=1.2.0

RUN mkdir /app
WORKDIR /app

COPY script/download.sh /app

RUN chmod a+x /app/download.sh
RUN /app/download.sh --minecraft $version

# run stage for minecraft 1.20
FROM azul/zulu-openjdk-alpine:17-jre-headless-latest AS run-1.20

ENV version=1.20

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=1.2.1

RUN mkdir /app /script
WORKDIR /app

COPY --from=mohist-docker:build-1.20 /app/server.jar /jbin/server.jar
COPY script/*.sh /script/

RUN chmod a+x /script/*.sh
RUN /script/init.sh

ENTRYPOINT [ "/script/launch.sh" ]

# build stage for minecraft 1.20.1

FROM alpine as build-1.20.1

ENV version=1.20.1

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=1.2.0

RUN mkdir /app
WORKDIR /app

COPY script/download.sh /app

RUN chmod a+x /app/download.sh
RUN /app/download.sh --minecraft $version
    
# run stage for minecraft 1.20.1

FROM azul/zulu-openjdk-alpine:17-jre-headless-latest AS run-1.20.1
ENV version=1.20.1

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=1.2.1

RUN mkdir /app /script
WORKDIR /app

COPY --from=mohist-docker:build-1.20.1 /app/server.jar /jbin/server.jar
COPY script/*.sh /script/

RUN chmod a+x /script/*.sh
RUN /script/init.sh

ENTRYPOINT [ "/script/launch.sh" ]

# build stage for minecraft 1.20.2

FROM alpine AS build-1.20.2

ENV version=1.20.2

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=1.2.0

RUN mkdir /app
WORKDIR /app

COPY script/download.sh /app

RUN chmod a+x /app/download.sh
RUN /app/download.sh --minecraft $version

# run stage for minecraft 1.20.2
FROM azul/zulu-openjdk-alpine:17-jre-headless-latest AS run-1.20.2
ENV version=1.20.2

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=1.2.1

RUN mkdir /app /script
WORKDIR /app

COPY --from=mohist-docker:build-1.20.2 /app/server.jar /jbin/server.jar
COPY script/*.sh /script/

RUN chmod a+x /script/*.sh
RUN /script/init.sh

ENTRYPOINT [ "/script/launch.sh" ]
# build stage for minecraft 1.20.3

FROM alpine AS build-1.20.3

ENV version=1.20.3

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=1.2.0

RUN mkdir /app
WORKDIR /app

COPY script/download.sh /app

RUN chmod a+x /app/download.sh
RUN /app/download.sh --minecraft $version

# run stage for minecraft 1.20.3
FROM azul/zulu-openjdk-alpine:17-jre-headless-latest AS run-1.20.3
ENV version=1.20.3

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=1.2.1

RUN mkdir /app /script
WORKDIR /app

COPY --from=mohist-docker:build-1.20.3 /app/server.jar /jbin/server.jar
COPY script/*.sh /script/

RUN chmod a+x /script/*.sh
RUN /script/init.sh

ENTRYPOINT [ "/script/launch.sh" ]

# build stage for minecraft 1.20.4

FROM alpine AS build-1.20.4

ENV version=1.20.4

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=1.2.0

RUN mkdir /app
WORKDIR /app

COPY script/download.sh /app

RUN chmod a+x /app/download.sh
RUN /app/download.sh --minecraft $version

# run stage for minecraft 1.20.4
FROM azul/zulu-openjdk-alpine:17-jre-headless-latest AS run-1.20.4
ENV version=1.20.4

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=1.2.1

RUN mkdir /app /script
WORKDIR /app

COPY --from=mohist-docker:build-1.20.4 /app/server.jar /jbin/server.jar
COPY script/*.sh /script/

RUN chmod a+x /script/*.sh
RUN /script/init.sh

ENTRYPOINT [ "/script/launch.sh" ]
