.\gradlew clean build^
 && mkdir .\build\dependency^
 && cd build\dependency^
 && jar -xf ..\libs\*.jar^
 && cd ..\..^
 && docker build -t plambir7/docker-demo .
