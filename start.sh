docker run -d --name jenkins-k8s -p 7084:8080 -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/jenkins_home:/var/jenkins_home 127.0.0.1/jenkins:lts-k8s
