FROM openjdk:8-jdk-alpine as build
WORKDIR /workspace/app

COPY ./gradle gradle
COPY ./gradlew gradlew
COPY ./settings.gradle settings.gradle
COPY ./build.gradle .
COPY ./src src
RUN chmod +x ./gradlew && ./gradlew clean build
RUN mkdir -p build/dependency
WORKDIR build/dependency
RUN jar -xf ../libs/*.jar


FROM openjdk:8-jdk-alpine
ARG DEPENDENCY=/workspace/app/build/dependency
COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","by.mark.dockerdemo.DockerDemoApplication"]
