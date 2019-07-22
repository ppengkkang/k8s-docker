## Set up Redis cluster

#### Step 1: Make sure all pods are in running state
> kubectl get pods -l app=redis-cluster

#### Step 2: Set up cluster

We can setup the cluster using redis-cli (In Redis 3 and 4 we can use redis-trib.rb, which requires ruby runtime)

Here we alreday have 6 running redis instances, we target to set up the cluster of 3 masters, and 3 slaves, 
with 16384 slots equally distributed on 3 nodes.

> kubectl exec -it redis-cluster-0 -- redis-cli --cluster create --cluster-replicas 1 $(kubectl get pods -l app=redis-cluster -o jsonpath='{range.items[*]}{.status.podIP}:6379 ')


#### Step 3: Verify the cluster status

> kubectl exec -it redis-cluster-0 -- redis-cli -c

> cluster nodes

> cluster slots


## Scale up the Redis cluster node

We have 6 reids pods running under StatefulSet after the redis cluster was set up. 
Now let's add 2 more instances, and let them join the cluster with 1 master and 1 slave

#### Step 1: Scale up 2 replicas

> kubectl  scale --replicas=10 StatefulSet/redis-cluster  

#### Step 2: Add the 2 nodes to the cluster

Retrive the new pods' ip address
> kubectl get pods -o wide

new nodes to join the cluster
> redis-cli --cluster add-node <ip1>:6379 <existing node ip>0:6379
> redis-cli --cluster add-node <ip2>:6379 <existing node ip>0:6379


Make 1 master, 1 slave


#### Step 3: Reshard slots

New nodes have joined the cluster, but there is no slots allocated to the new nodes, 
we will do the resharding to move 1000 slots from existing nodes to new nodes

> redis-cli --cluster reshard <ip>:6379 --cluster-from 0799f1dbffa91995a60df48cf005701b6268aa4c --cluster-to 7f54566a9d7af210728f2b026900f7923ade9c84 --cluster-slots 1
  000
  
REPLICATE <node-id> -- Configure current node as replica to <node-id>.
>   redis-cli --cluster REPLICATE <node-id>

 