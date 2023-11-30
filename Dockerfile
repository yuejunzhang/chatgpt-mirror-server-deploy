# 基于官方 Docker 镜像
FROM docker:latest

# 设置工作目录
WORKDIR /

# 安装 Git
RUN apk update && apk add git

# 克隆仓库到本地
RUN git clone --depth=1 https://github.com/xyhelper/chatgpt-mirror-server-deploy.git chatgpt-mirror

# 进入目录
WORKDIR /chatgpt-mirror

# 拉取 Docker 镜像并启动服务
RUN docker compose pull
RUN docker compose up -d

# 打开端口
EXPOSE 80

# 设置启动命令
CMD ["docker-compose", "up", "-d"]
