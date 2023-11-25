# build stage for minecraft 1.12.2
FROM alpine as build-1.12.2
ENV version=1.12.2

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=0.0.1

RUN mkdir /app
WORKDIR /app
COPY script/download.sh /app

# 同意eula
RUN echo "eula=true" > eula.txt

# 授权脚本
RUN chmod a+x /app/download.sh
RUN chmod a+r /app/eula.txt

# 下载服务器
RUN /app/download.sh --minecraft=$version

# run stage for minecraft 1.12.2
FROM azul/zulu-openjdk-alpine:8-jre-headless-latest AS run-1.12.2
ENV version=1.12.2

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=0.0.1

RUN mkdir /app
WORKDIR /app
COPY --from=mohist-docker:build-1.12.2 /app/server.jar /app/server.jar
COPY --from=mohist-docker:build-1.12.2 /app/eula.txt /app/eula.txt
COPY script/init.sh /app

EXPOSE 25565

RUN chmod a+x /app/init.sh
RUN /app/init.sh
ENTRYPOINT [ "/usr/bin/java -jar" ]

CMD [ "server.jar", "@memorysize.txt", "@userjvmargs.txt"]
# build stage for minecraft 1.16.5

FROM alpine as build-1.16.5
ENV version=1.16.5

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=0.0.1

RUN mkdir /app
WORKDIR /app

# 拷贝脚本
COPY script/download.sh /app
RUN echo "eula=true" > eula.txt

# 授权脚本
RUN chmod a+x /app/download.sh
RUN chmod a+r /app/eula.txt

RUN /app/download.sh --minecraft=$version
# run stage for minecraft 1.16.5
FROM azul/zulu-openjdk-alpine:11-jre-headless-latest AS run-1.16.5
ENV version=1.16.5

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=0.0.1

RUN mkdir /app
WORKDIR /app

COPY --from=mohist-docker:build-1.16.5 /app/server.jar /app/server.jar
COPY --from=mohist-docker:build-1.16.5 /app/eula.txt /app/eula.txt
COPY script/init.sh /app

RUN chmod a+x /app/init.sh
RUN /app/init.sh

ENTRYPOINT [ "/usr/bin/java" ]

CMD [ "@memorysize.txt","server.jar", "@userjvmargs.txt"]

# build stage for minecraft 1.18.2

FROM alpine as build-1.18.2
ENV version=1.18.2

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=0.0.1

RUN mkdir /app
WORKDIR /app

COPY script/download.sh /app

RUN echo "eula=true" > eula.txt
RUN chmod a+x /app/download.sh
RUN chmod a+r /app/eula.txt
RUN /app/download.sh --minecraft=$version

# run stage for minecraft 1.18.2

FROM azul/zulu-openjdk-alpine:17-jre-headless-latest AS run-1.18.2

ENV version=1.18.2

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=0.0.1

RUN mkdir /app
WORKDIR /app

COPY --from=mohist-docker:build-1.18.2 /app/server.jar /app/server.jar

COPY --from=mohist-docker:build-1.18.2 /app/eula.txt /app/eula.txt
COPY script/init.sh /app

RUN chmod a+x /app/init.sh
RUN /app/init.sh

ENTRYPOINT [ "/usr/bin/java" ]

CMD [ "@memorysize.txt","server.jar", "@userjvmargs.txt"]

# build stage for minecraft 1.19.2

FROM alpine as build-1.19.2

ENV version=1.19.2

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=0.0.1

RUN mkdir /app
WORKDIR /app

COPY script/download.sh /app

RUN echo "eula=true" > eula.txt
RUN chmod a+x /app/download.sh
RUN chmod a+r /app/eula.txt
RUN /app/download.sh --minecraft=$version

# run stage for minecraft 1.19.2

FROM azul/zulu-openjdk-alpine:17-jre-headless-latest AS run-1.19.2

ENV version=1.19.2

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=0.0.1

RUN mkdir /app
WORKDIR /app

COPY --from=mohist-docker:build-1.19.2 /app/server.jar /app/server.jar
COPY --from=mohist-docker:build-1.19.2 /app/eula.txt /app/eula.txt
COPY script/init.sh /app

RUN chmod a+x /app/init.sh
RUN /app/init.sh

ENTRYPOINT [ "/usr/bin/java" ]

CMD [ "@memorysize.txt","server.jar", "@userjvmargs.txt"]

# build stage for minecraft 1.20.1

FROM alpine as build-1.20.1

ENV version=1.20.1

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=0.0.1

RUN mkdir /app
WORKDIR /app

COPY script/download.sh /app

RUN echo "eula=true" > eula.txt
RUN chmod a+x /app/download.sh
RUN chmod a+r /app/eula.txt
RUN /app/download.sh --minecraft=$version
    
# run stage for minecraft 1.20.1

FROM azul/zulu-openjdk-alpine:20-jre-headless-latest AS run-1.20.1

ENV version=1.20.1

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=0.0.1

RUN mkdir /app
WORKDIR /app

COPY --from=mohist-docker:build-1.20.1 /app/server.jar /app/server.jar
COPY --from=mohist-docker:build-1.20.1 /app/eula.txt /app/eula.txt
COPY script/init.sh /app

RUN chmod a+x /app/init.sh
RUN /app/init.sh

ENTRYPOINT [ "/usr/bin/java" ]

CMD [ "@memorysize.txt","server.jar", "@userjvmargs.txt"]

# build stage for minecraft 1.20.2

FROM alpine AS build-1.20.2

ENV version=1.20.2

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=0.0.1

RUN mkdir /app
WORKDIR /app

COPY script/download.sh /app

RUN echo "eula=true" > eula.txt
RUN chmod a+x /app/download.sh
RUN chmod a+r /app/eula.txt
RUN /app/download.sh --minecraft=$version

# run stage for minecraft 1.20.2
FROM azul/zulu-openjdk-alpine:20-jre-headless-latest AS run-1.20.2
ENV version=1.20.2

LABEL maintaner="敖律风"
LABEL vcs-url="https://github.com/WHF-Studio/mohist-docker"
LABEL version=0.0.1

RUN mkdir /app
WORKDIR /app
COPY --from=mohist-docker:build-1.20.2 /app/server.jar /app/server.jar
COPY --from=mohist-docker:build-1.20.2 /app/eula.txt /app/eula.txt
COPY script/init.sh /app
RUN chmod a+x /app/init.sh
RUN /app/init.sh
ENTRYPOINT [ "/usr/bin/java" ]
CMD [ "@memorysize.txt","server.jar", "@userjvmargs.txt"]