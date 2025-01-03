FROM ubuntu:20.04

RUN sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list  

RUN apt-get update


RUN apt-get install -y jq curl 

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

ENTRYPOINT ["/bin/bash", "-c", "sleep 10 && ./sdcs-test.sh 3 && tail -f /dev/null"]
