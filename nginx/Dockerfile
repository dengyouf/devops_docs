FROM swr.cn-north-4.myhuaweicloud.com/ddn-k8s/docker.io/rookiezoe/nginx:1.29.2
COPY ./html /usr/share/nginx/html

# 自定义配置（可选）
#COPY ./nginx.conf /etc/nginx/nginx.conf
#*COPY ./conf.d/ /etc/nginx/conf.d/

# 以前台方式启动
CMD ["nginx", "-g", "daemon off;"]
