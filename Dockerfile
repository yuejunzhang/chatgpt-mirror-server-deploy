# 使用基础镜像
FROM ubuntu:latest

# 更新软件包列表并安装 git 和 docker
RUN apt-get update && \\
    apt-get install -y git docker.io

# 克隆仓库到本地
RUN git clone --depth=1 https://github.com/xyhelper/chatgpt-mirror-server-deploy.git chatgpt-mirror

# 进入目录
WORKDIR /chatgpt-mirror

# 下载并安装 docker-compose
RUN curl -L https://github.com/docker/compose/releases/download/<VERSION>/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \\
    chmod +x /usr/local/bin/docker-compose

# 使用 docker-compose 拉取镜像并启动容器
RUN docker-compose pull
RUN docker-compose up -d
