#!/bin/bash

# 计算出当前时间
curr_time=`date +%s`

# 筛选出正在运行的app 存到列表中
app_list=`yarn application -list -appStates RUNNING | awk '/application_/{print $1}'`

for app in $app_list;do
    # 遍历列表 查看每个app运行状态 并获取开始时间
    app_start_time=`yarn application -status $app | awk '/Start-Time/{print substr($3, 0, 10)}'`
    
    # 计算当前时间和app运行时间的差值
    result=`expr $curr_time - $app_start_time`
    
    # 判断如果超过两天就kill
    if [ "$result" -ge "172800" ]; then
        echo "timeout  kill $app... "
        yarn application -kill $app
    fi

done
