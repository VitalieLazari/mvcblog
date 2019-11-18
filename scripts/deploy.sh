#!/usr/bin/env bash

mvn clean package

echo 'Copy files...'

scp -i ~/.ssh/id_rsa \
    target/mvc-blog-1.0-SNAPSHOT.jar \
    sva@192.168.0.102:/home/sva/

echo 'Restart server...'

ssh -i ~/.ssh/id_rsa sva@192.168.0.102 << EOF
pgrep java | xargs kill -9
nohup java -jar mvc-blog-1.0-SNAPSHOT.jar > log.txt &
EOF

echo 'Bye'