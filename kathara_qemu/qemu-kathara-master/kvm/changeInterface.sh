#!/bin/bash

#Changing interfaces

interfaces=$(ip link | grep ff:ff:ff:ff:ff:ff | wc -l)
echo $interfaces
for ((i=0 , e=3; i<interfaces ; i++ , e++))
do
   ip link set ens${e} down
   ip link set ens${e} name eth${i} 
   ip link set eth${i} up
done

#Create folders into VM
mkdir /shared
mkdir /hostlab
mount -t 9p -o trans=virtio,version=9p2000.L host0 /shared
mount -t 9p -o trans=virtio,version=9p2000.L host0 /hostlab


#Change hostname
hostname=$(cat /usr/local/hostname.txt)
hostnamectl set-hostname $hostname