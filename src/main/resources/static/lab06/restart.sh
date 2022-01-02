#! /bin/sh

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

HOME_PATH= ********/zpi-zp11-webapps/prod
GIT_BRANCH=main
SERVER_PORT=8081
SPRING_PROFILE_ACTIVE=prod
if [ -n "$1" ]; then
    SPRING_PROFILE_ACTIVE=$1
fi
echo [INFO] Checkout to branch ${GIT_BRANCH} and pull...

cd ${HOME_PATH}/
git clone https://github.com/khomichenko/zpi-zp11-webapps.git
cd ${HOME_PATH}/zpi-zp11-webapps/
git checkout ${GIT_BRANCH}
git pull --rebase origin ${GIT_BRANCH}

echo [INFO] Build project...
mvn clean package -Dmaven.test.skip=true -P${SPRING_PROFILE_ACTIVE}
PID=$(ps aux|grep java|grep ${SERVER_PORT}|awk '{printf $2}')
if [ $? -eq 0 ]; then
    if [ -z "$PID" ]; then
        echo [WARN] Server not startup.
        # exit
    fi
    echo [INFO] process id: $PID
else
    echo [WARN] process $input1 not exit!
    exit
fi
echo ${PID} | while read -r line
do
    kill -9 ${line}
    if [ $? -eq 0 ];then
        echo [WARN] Kill process ${line} success...
    else
        echo [ERROR] Kill process ${line} fail!!!
    fi
done
cd ${HOME_PATH}/apps
rm -f zpi-zp11-webapps-0.0.1-SNAPSHOT.jar
cp ${HOME_PATH}/zpi-zp11-webapps/target/zpi-zp11-webapps-0.0.1-SNAPSHOT.jar .
echo [INFO] remove jar, copy jar success...
nohup java -jar -Dserver.port="${SERVER_PORT}" -Dlog4j2.contextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector -Dlog.level.console=warn zpi-zp11-webapps-0.0.1-SNAPSHOT.jar > ${HOME_PATH}/apps/nohup.log 2>&1 &

echo [INFO] Strating server on port ${SERVER_PORT}

exit
