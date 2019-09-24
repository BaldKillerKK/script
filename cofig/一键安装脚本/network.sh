#!/bin/bash
HOSTS_CM="`cat /root/config/hosts | grep -v "^$" | grep -v localhost | grep -v "#" | awk '{print $2}'`"
HOSTS_NOCM="`cat /root/config/hosts | grep -v "^$" | grep -v localhost | grep -v "#" | grep -v "base" | awk '{print $2}'`"
#hostname
for i in $HOSTS_CM;do
echo $i
   ssh $i "hostnamectl set-hostname $i"
done

#no password
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
for i in $HOSTS_CM;do
echo $i
   /root/config/auto_ssh.sh root user@4444 $i
done

#hosts
for i in $HOSTS_CM;do
echo $i
   scp /root/config/hosts root@$i:/etc/
done

#firewall
for i in $HOSTS_CM;do
echo $i
   ssh $i "systemctl stop firewalld.service ; systemctl disabled firewalld.service"
done

#transparent_hugepage
for i in $HOSTS_CM;do
echo $i
   scp /root/config/rc.local root@$i:/etc/
   ssh $i "echo never > /sys/kernel/mm/transparent_hugepage/enabled ; echo never > /sys/kernel/mm/transparent_hugepage/defrag"
done

#swappiness
for i in $HOSTS_CM;do
echo $i
   ssh $i "sysctl vm.swappiness=1"
   scp /root/config/sysctl.conf root@$i:/etc/
done


#selinux
for i in $HOSTS_CM;do
echo $i
   ssh $i "sentenforce 0 "
   scp /root/config/config root@$i:/etc/selinux/
done

#virsh net
for i in $HOSTS_CM;do
echo $i
   ssh $i "yum -y install qemu-kvm* libvirt* virt-install* bridge-utils ; yum install qemu-kvm* libvirt* virt-install* bridge-utils ; virsh net-destroy default ; virsh net-undefine default ; service libvirtd restart"
done

#ntp
for i in $HOSTS_CM;do
echo $i
   ssh $i "yum -y install ntp "
   scp /root/config/ntp.conf root@$i:/etc/
   ssh $i "systemctl enabled ntpd ; systemctl restart ntpd"
done
