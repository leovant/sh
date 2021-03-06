#!/bin/sh
docker rm -f $(docker ps -qa)
docker volume rm $(docker volume ls -q)
docker rmi -f $(docker images -qa)
cleanupdirs="/var/lib/etcd /etc/kubernetes /etc/cni /opt/cni /var/lib/cni /var/run/calico"
for dir in $cleanupdirs; do
  echo "Removing $dir"
  rm -rf $dir
done
