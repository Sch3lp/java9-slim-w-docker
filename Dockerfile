FROM openjdk:9.0.1-11-jre-slim-sid

# ENV VERSION "17.03.1-ce"
# RUN curl -L -o /tmp/docker-$VERSION.tgz https://download.docker.com/linux/static/stable/x86_64/docker-$VERSION.tgz \
#     && tar -xz -C /tmp -f /tmp/docker-$VERSION.tgz \
#     && mv /tmp/docker/docker /usr/bin \
#     && rm -rf /tmp/docker-$VERSION /tmp/docker

RUN apt-get update && apt-get install -y curl bash python python-pip
RUN pip install --upgrade awscli==1.14.5 s3cmd==2.0.1

ADD https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz /tmp
RUN tar -xvzf /tmp/docker-latest.tgz && \
    mv docker/* /usr/bin/ && \
    chmod +x /usr/bin/docker && \
    rm -f /tmp/docker-latest.tgz

RUN curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose
