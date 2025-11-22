## Run

```
docker run -it -p 8081:8080  -n hellojar -e JAVA_OPTS='-server -Xms2048m -Xmx4192m -XX:MetaspaceSize=256m -XX:MaxMetaspaceSize=512m' harbor.devops.io/library/hellojar:jdk21
```


```
docker top hellojar                                                                                                                                                 
PID                 USER                TIME                COMMAND
1745                root                0:04                java -server -Xms2048m -Xmx4192m -XX:MetaspaceSize=256m -XX:MaxMetaspaceSize=512m -jar /app/app.jar
```

```
CONTAINER ID   NAME         CPU %     MEM USAGE / LIMIT     MEM %     NET I/O          BLOCK I/O        PIDS
eea0b109b0e2   hellojar   0.18%     277.3MiB / 7.808GiB   3.47%     1.13kB / 126B    121MB / 32.8kB   34
c84418d43818   mysql_db     1.07%     453.5MiB / 7.808GiB   5.67%     7.47MB / 180kB   16GB / 53.3MB    46
```
