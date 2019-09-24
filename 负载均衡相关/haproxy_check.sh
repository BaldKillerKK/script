#!/bin/bash
A=`ps -C haproxy --no-header | wc -l`
if [ $A -eq 0 ];then
    systemctl start haproxy
    sleep 3
    if [ `ps -C haproxy --no-header | wc -l ` -eq 0 ];then
        systemctl stop keepalived
        echo "keepalived stop"
    fi
fi
