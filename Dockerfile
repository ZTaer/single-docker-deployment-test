######Node.js######

# 基础环境，选择带有预装 Yarn 的 Node.js 镜像
#   a) AS builder: 给镜像命名, 为了后续的多阶段构建
FROM node:18-alpine AS builder

# 工作目录
WORKDIR '/app'

# 复制依赖文件
COPY ./package.json ./yarn.lock ./

# 安装依赖
RUN yarn install

# 拷贝其他内容
COPY . .

# 暴露端口
EXPOSE 5173

# 启动项目
CMD [ "yarn", "build" ]

######Nginx######

# 基础环境，选择 Nginx 镜像
FROM nginx:1.27.0

# 暴露端口
EXPOSE 80

# 从builder中拷贝构建结果
COPY --from=builder /app/dist /usr/share/nginx/html



