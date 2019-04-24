# Set up nfs

### 1. Install nfs 
yum -y install nfs-utils rpcbind

### 2. Create  /etc/exports with follwing configuration
/usr/local/k8s/redis/pv1 *(rw,all_squash)
/usr/local/k8s/redis/pv2 *(rw,all_squash)
/usr/local/k8s/redis/pv3 *(rw,all_squash)
/usr/local/k8s/redis/pv4 *(rw,all_squash)
/usr/local/k8s/redis/pv5 *(rw,all_squash)
/usr/local/k8s/redis/pv6 *(rw,all_squash)


### 3. chmod
chmod 777 /usr/local/k8s/redis/pv*

### 4. Start
systemctl start rpcbind
systemctl start nfs

### 5. Test
In 172.26.126.11: mount -t nfs 172.26.126.26:/usr/local/k8s/redis/pv1 /mnt
touch test

In 172.26.126.26 check /usr/local/k8s/redis/pv1/test


