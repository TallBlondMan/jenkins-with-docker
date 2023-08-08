FROM jenkins/jenkins:latest

USER root
RUN apt update && apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common \
        && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
        && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
        && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
        && apt update \
        && apt-cache policy docker-ce \
        && apt install -y docker-ce

RUN usermod -aG docker jenkins
USER jenkins
