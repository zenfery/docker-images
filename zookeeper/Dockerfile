FROM zookeeper:3.5.7

# 安装基础工具
ENV DEBIAN_FRONTEND noninteractive
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
COPY ./apt-sources.list /etc/apt/sources.list
RUN apt update \
    && apt install apt-utils -y \
    && apt install inetutils-ping -y \
    && apt install iproute2 -y \
    && apt install curl -y \
    && apt install vim -y \
    && apt install procps -y \
    && apt install telnet -y \
    && apt install gettext-base -y 

## 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./run.sh /
RUN chmod +x /run.sh

WORKDIR /

ENTRYPOINT ["bash", "-c", "/run.sh && exec /docker-entrypoint.sh zkServer.sh start-foreground"]