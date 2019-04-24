kubectl run -i --tty --image busybox dns-test --restart=Never --rm /bin/sh 

nslookup redis-app-0.redis-service