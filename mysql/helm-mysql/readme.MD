### Install mysql with helm

swith to bitnami folder and issue the command

> helm install mysql



### Steps to export the tiller image into each kubernetes nodes

1. Save image tar file in master
> cd /nfsshare/install/images
> docker save -o bitnami-helm-mysql-5.7.tar docker.io/bitnami/mysql:5.7
> docker save -o prom-helm-mysqld-exporter-v0.10.0.tar docker.io/prom/mysqld-exporter:v0.10.0
2. In each nodes
> cd /nfsshare/scripts
> ./load_images.sh
> 
> 
> 
> 
> 
> NOTES:

Please be patient while the chart is being deployed

Tip:

  Watch the deployment status using the command: kubectl get pods -w --namespace default

Services:

  echo Master: existing-chicken-mysql.default.svc.cluster.local:3306
  echo Slave:  existing-chicken-mysql-slave.default.svc.cluster.local:3306

Administrator credentials:

  echo Username: root
  echo Password : $(kubectl get secret --namespace default existing-chicken-mysql -o jsonpath="{.data.mysql-root-password}" | base64 --decode)

To connect to your database:

  1. Run a pod that you can use as a client:

      kubectl run existing-chicken-mysql-client --rm --tty -i --restart='Never' --image  docker.io/bitnami/mysql:5.7 --namespace default --command -- bash

  2. To connect to master service (read/write):

      mysql -h existing-chicken-mysql.default.svc.cluster.local -uroot -p v_sharedworkout

  3. To connect to slave service (read-only):

      mysql -h existing-chicken-mysql-slave.default.svc.cluster.local -uroot -p v_sharedworkout

To upgrade this helm chart:

  1. Obtain the password as described on the 'Administrator credentials' section and set the 'root.password' parameter as shown below:

      ROOT_PASSWORD=$(kubectl get secret --namespace default existing-chicken-mysql -o jsonpath="{.data.mysql-root-password}" | base64 --decode)
      helm upgrade existing-chicken bitnami/mysql --set root.password=$ROOT_PASSWORD

WARNING: Rolling tag detected (bitnami/mysql:5.7), please note that it is strongly recommended to avoid using rolling tags in a production environment.
+info https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/


Create external mysql service:
``` 
kind: Service
apiVersion: v1
metadata:
 name: mysql
spec:
 type: ClusterIP
 ports:
 - port: 3306
   targetPort: 3306
   protocol: TCP


---

kind: Endpoints
apiVersion: v1
metadata:
 name: mysql
subsets:
 - addresses:
     - ip: 10.10.0.158
   ports:
     - port: 3306
```

``` 
kind: Service
apiVersion: v1
metadata:
 name: nats
spec:
 type: ClusterIP
 ports:
 - port: 4222
   targetPort: 4222
   protocol: TCP


---

kind: Endpoints
apiVersion: v1
metadata:
 name: nats
subsets:
 - addresses:
     - ip: 10.10.0.158
   ports:
     - port: 4222
```


