# 使用基础镜像
FROM ubuntu:latest

# 设置工作目录
WORKDIR /app

# 安装 curl 和其他必要的工具
RUN apt-get update && apt-get install -y curl

# 复制 quick-install.sh 到容器中
COPY quick-install.sh /app

# 执行脚本并赋予执行权限
RUN chmod +x quick-install.sh && ./quick-install.sh

# 如果你想要在构建镜像时就执行脚本，可以使用以下方式（不建议在 Dockerfile 中直接使用 curl | bash，因为安全性问题）
# RUN curl -sSfL https://raw.githubusercontent.com/xyhelper/chatgpt-mirror-server-deploy/master/quick-install.sh | bash

# 定义容器启动时执行的命令（可选）
CMD ["bash"]
