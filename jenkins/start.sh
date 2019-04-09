docker run -d --name jenkins-k8s-alpine -p 7086:8080 -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/jenkins_home:/var/jenkins_home 127.0.0.1/jenkins:k8s-alpine
