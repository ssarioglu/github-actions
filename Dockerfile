FROM ubuntu:latest
MAINTAINER Serdar Sarioglu, Serdar.Sarioglu@mysystem.org

# Install Basic Tools
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y build-essential ca-certificates wget curl git docker  mysql-client redis-tools nmap zmap dnsutils htop 
RUN apt install -y python3-pip

# Upgrade PIP
RUN pip install --upgrade pip

#Install Kubectl
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update && apt-get install -y kubectl

# Install Azure CLI, AWS CLI and Google Cloud CLI
RUN pip install awscli --upgrade 
RUN pip install azure-cli
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-cli -y

ENTRYPOINT ["/bin/bash"]"
