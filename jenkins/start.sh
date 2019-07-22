docker run -d --name myjenkins-k8s-alpine -p 7086:8080 -v /var/run/docker.sock:/var/run/docker.sock -v /Users/tompeng/ContainerPlatform/docker/volume:/var/jenkins_home myjenkins:k8s-alpine
