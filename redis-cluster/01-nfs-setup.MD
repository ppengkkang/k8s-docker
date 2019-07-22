# Set up nfs

### 1. Install nfs 
yum -y install nfs-utils rpcbind

### 2. Create  /etc/exports with follwing configuration
/export/pvs/pv0001 *(rw,all_squash)
/export/pvs/pv0002 *(rw,all_squash)
/export/pvs/pv0003 *(rw,all_squash)
/export/pvs/pv0004 *(rw,all_squash)
/export/pvs/pv0005 *(rw,all_squash)
/export/pvs/pv0006 *(rw,all_squash)
/export/pvs/pv0007 *(rw,all_squash)
/export/pvs/pv0008 *(rw,all_squash)
/export/pvs/pv0009 *(rw,all_squash)
/export/pvs/pv0010 *(rw,all_squash)


### 3. chmod
chmod 755 /export/pv*

### 4. Start
systemctl start rpcbind
systemctl start nfs



