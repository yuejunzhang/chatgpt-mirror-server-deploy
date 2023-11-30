# 使用基础镜像
FROM ubuntu:latest

# 将工作目录设置为 /app
WORKDIR /app

# 复制 quick-install.sh 脚本到容器中
COPY quick-install.sh .

# 放权 quick-install.sh 并执行
RUN chmod +x quick-install.sh && ./quick-install.sh
