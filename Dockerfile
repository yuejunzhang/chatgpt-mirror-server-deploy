# 使用基础镜像
FROM docker.io/library/ubuntu:latest

# 设置工作目录
WORKDIR /app

# 安装 git 和 docker-compose
RUN apt-get update && apt-get install -y docker-compose

# 克隆仓库到本地
RUN git clone --depth=1 https://github.com/xyhelper/chatgpt-mirror-server-deploy.git chatgpt-mirror

# 进入目录
WORKDIR /app/chatgpt-mirror

# 使用 Docker Compose 拉取镜像并启动容器
RUN docker-compose pull
RUN docker-compose up -d
