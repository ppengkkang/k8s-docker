FROM jenkins/jenkins:lts

# Running as root to have an easy support for Docker
USER root

# A default admin user
ENV ADMIN_USER=admin \
    ADMIN_PASSWORD=admin

# Jenkins init scripts
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/

# Install plugins at Docker image build time
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh $(cat /usr/share/jenkins/plugins.txt) && \
    mkdir -p /usr/share/jenkins/ref/ && \
    echo lts > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state && \
    echo lts > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion

#RUN sudo tar -xvzf apache-maven-3.6.0-bin.tar.gz
COPY apache-maven-3.6.0 /var/jenkins_home/
RUN echo "export MAVEN_HOME=/var/jenkins_home/apache-maven-3.6.0" >> /var/jenkins_home/.bashrc
RUN echo "export PATH=/var/jenkins_home/apache-maven-3.6.0/bin:\$PATH" >> /var/jenkins_home/.bashrc

# Install Docker
RUN apt-get -qq update && \
    apt-get -qq -y install curl && \
    curl -sSL https://get.docker.com/ | sh

# Install kubectl and helm
#RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
#    chmod +x ./kubectl && \
#    mv ./kubectl /usr/local/bin/kubectl && \
#    curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash

