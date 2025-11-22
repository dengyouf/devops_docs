# 选择基础镜像
# FROM swr.cn-north-4.myhuaweicloud.com/ddn-k8s/docker.io/openjdk:21-linuxarm64
FROM swr.cn-north-4.myhuaweicloud.com/ddn-k8s/docker.io/openjdk:21

# 设置时区为上海（Asia/Shanghai）
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 创建目录（可选，但更规范）
WORKDIR /app

# 复制 jar
COPY target/*.jar app.jar

# JVM 参数
ENV JAVA_OPTS="\
  -server \
  -Xms256m \
  -Xmx512m \
  -XX:MetaspaceSize=256m \
  -XX:MaxMetaspaceSize=512m \
"

# 额外运行参数
ENV PARAMS=""

# 使用 exec 形式，避免 sh -c 带来的 PID1 问题并支持参数扩展
ENTRYPOINT ["sh", "-c", "exec java $JAVA_OPTS -jar /app/app.jar $PARAMS"]
