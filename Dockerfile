FROM registry-dev-zak8s.zhonganonline.com/env/jdk8
COPY ./target/tm-eureka-server.jar /root/startup/
WORKDIR /root/startup/
EXPOSE 8080
EXPOSE 8788
CMD ["java", "-Xdebug", "-Xrunjdwp:transport=dt_socket,address=8788,server=y,suspend=n", "-Xmx1024m", "-Xms1024m", "-XX:MetaspaceSize=256m","-XX:MaxMetaspaceSize=256m","-XX:+UseParNewGC","-XX:+UseConcMarkSweepGC","-XX:+PrintGC", "-XX:+PrintGCDetails","-XX:+PrintGCTimeStamps","-Xloggc:/alidata1/admin/za-astraea-bops/logs/gc.log","-XX:+UseGCLogFileRotation", "-XX:GCLogFileSize=1M", "-XX:NumberOfGCLogFiles=50", "-XX:+HeapDumpOnOutOfMemoryError", "-XX:HeapDumpPath=/alidata1/admin/za-astraea-bops/logs/dump_pid%p.hprof", "-jar", "tm-eureka-server.jar"]