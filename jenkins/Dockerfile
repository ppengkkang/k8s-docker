FROM jenkins/jenkins:2.184

# Running as root to have an easy support for Docker
USER root

# A default admin user
ENV ADMIN_USER=admin ADMIN_PASSWORD=admin

# Jenkins init scripts
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/

#Install plugins at Docker image build time
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh $(cat /usr/share/jenkins/plugins.txt) && \
    mkdir -p /usr/share/jenkins/ref/ && \
    echo lts > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state && \
    echo lts > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion

ADD apache-maven-3.6.1-bin.tar.gz /var/jenkins_home/

# Install kubectl and helm
COPY kubectl .
COPY kube/config /root/.kube/
RUN  chmod +x ./kubectl && \
     mv ./kubectl /usr/local/bin/kubectl

# helm    
# RUN curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash

