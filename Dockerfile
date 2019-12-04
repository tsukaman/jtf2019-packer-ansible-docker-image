FROM ansible/ansible-runner:1.3.4

ENV PACKER_VERSION 1.4.5

WORKDIR /usr/local/bin

RUN set -x && \
    yum install -y https://centos7.iuscommunity.org/ius-release.rpm && \
    yum update -y --exclude='ansible*' && \
    yum install -y jq python2-pip tree unzip wget && \
    rm -rf /var/cache/yum/* && yum clean all && \
    wget -q  https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip && \
    unzip ./packer_${PACKER_VERSION}_linux_amd64.zip && \
    rm ./packer_${PACKER_VERSION}_linux_amd64.zip && \
    pip install --upgrade pip && \
    pip install awscli boto pywinrm

