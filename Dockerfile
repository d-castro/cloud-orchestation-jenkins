FROM jenkins/jenkins

RUN apt-get update -y && \
apt-get install unzip -y && \
apt-get install wget -y && \
apt-get install vim -y

################################
# Install Terraform
################################
RUN wget --quiet https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip

RUN unzip terraform_0.11.11_linux_amd64.zip

RUN mv terraform /usr/local/bin/

RUN terraform --version 

USER jenkins