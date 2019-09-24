#!/bin/bash
HOSTS_CM="`cat /root/config/hosts | grep -v "^$" | grep -v localhost | grep -v "#" | awk '{print $2}'`"
HOSTS_NOCM="`cat /root/config/hosts | grep -v "^$" | grep -v localhost | grep -v "#" | grep -v "base" | awk '{print $2}'`"

#mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
#yum -y install /root/config/jdk-8u181-linux-x64.rpm
#cp -f /root/config/oracle-connector-java.jar /usr/share/java/
#yum -y install krb5-workstation
#mv /etc/krb5.conf /etc/krb5.conf.bak
#cp -f /root/config/krb5.conf /etc/

#remove openjdk
for i in $HOSTS_CM;do
echo $i
   ssh $i "rpm -qa|grep openjdk |xargs -I {} yum remove -y {}"
done

#install jdk
for i in $HOSTS_CM;do
echo $i
   scp /root/config/jdk-8u191-linux-x64.rpm root@$i:/usr/
   ssh $i "yum -y install /usr/jdk-8u191-linux-x64.rpm ; rm -rf /usr/jdk-8u181-linux-x64.rpm"
done

#os.repo
#for i in $HOSTS_CM;do
#echo $i 
#   scp /root/config/hosts root@$i:/etc/
#   scp /root/config/os.repo root@$i:/etc/yum.repod/
#   ssh $i "yum clean all ; yum makecache "
#done

#卸载mairdb
rpm -qa|grep mariadb |xargs -I {} yum remove -y {}

#安装mysql
rpm -ivh /root/config/mysql5.7/mysql-community-common-5.7.27-1.el7.x86_64.rpm
rpm -ivh /root/config/mysql5.7/mysql-community-libs-5.7.27-1.el7.x86_64.rpm
rpm -ivh /root/config/mysql5.7/mysql-community-devel-5.7.27-1.el7.x86_64.rpm
rpm -ivh /root/config/mysql5.7/mysql-community-libs-compat-5.7.26-1.el7.x86_64.rpm
rpm -ivh /root/config/mysql5.7/mysql-community-client-5.7.27-1.el7.x86_64.rpm
rpm -ivh /root/config/mysql5.7/mysql-community-server-5.7.27-1.el7.x86_64.rpm


#mysql-connector-java.jar
for i in $HOSTS_CM;do
echo $i
   scp /root/config/mysql5.7/mysql-connector-java.jar root@$i:/usr/share/java/
done

#openldap
#yum -y install openldap-clients
#for i in $HOSTS_CM;do
#echo $in
#   ssh $i "yum -y install openldap-clients"
#done

#kerberos
#for i in $HOSTS_CM;do
#echo $i
#   ssh $i "yum -y install krb5-workstation ; mv /etc/krb5.conf /etc/krb5.conf.bak"
#   scp /root/config/krb5.conf root@$i:/etc/
#done

