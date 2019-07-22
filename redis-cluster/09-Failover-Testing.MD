
#### 1. Delete one master node

> kubectl delete pods redis-cluster-2


#### 2. Check the StatefulSet & pods

> kubectl get pods redis-cluster-2 -o wide

You will see kubernetes StatefulSet brings back redis-cluster-2