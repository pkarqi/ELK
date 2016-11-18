#!/bin/bash

TIME=`date +'%Y-%m-%d'`
Logpath=/usr/local/moniter
EMAILS=(zhixinping@zhongchebaolian.com,pkarqi@163.com,niexianyu@zhongchebaolian.com)
Disk1=`cat $Logpath/$TIME.xml | sed -n '4p' | awk '{print $4}'`
Load1=`cat $Logpath/$TIME.xml | sed -n '4p' | awk '{print $6}'`
Memery1=`cat $Logpath/$TIME.xml | sed -n '4p' | awk '{print $8}'`
Nm1=`cat $Logpath/$TIME.xml | sed -n '4p' | awk '{print $10}'`
Code1=`cat $Logpath/$TIME.xml | sed -n '4p' | awk '{print $12}'`
max_load=3

xtd_api1=`cat $Logpath/$TIME.xml | sed -n '5p' | awk '{print $4}'`
xtd_api2=`cat $Logpath/$TIME.xml | sed -n '5p' | awk '{print $6}'`
xtd_api3=`cat $Logpath/$TIME.xml | sed -n '5p' | awk '{print $8}'`

Disk3=`cat $Logpath/$TIME.xml| sed -n '6p' | awk '{print $4}'`
Load3=`cat $Logpath/$TIME.xml | sed -n '6p' | awk '{print $6}'`
Memery3=`cat $Logpath/$TIME.xml | sed -n '6p' | awk '{print $8}'`


Disk4=`cat $Logpath/$TIME.xml | sed -n '7p' | awk '{print $4}'`
Load4=`cat $Logpath/$TIME.xml | sed -n '7p' | awk '{print $6}'`
Memery4=`cat $Logpath/$TIME.xml | sed -n '7p' | awk '{print $8}'`
Code4=`cat $Logpath/$TIME.xml | sed -n '7p' | awk '{print $10}'`


Disk5=`cat $Logpath/$TIME.xml | sed -n '8p' | awk '{print $4}'`
Load5=`cat $Logpath/$TIME.xml | sed -n '8p' | awk '{print $6}'`
Memery5=`cat $Logpath/$TIME.xml | sed -n '8p' | awk '{print $8}'`
Code5=`cat $Logpath/$TIME.xml | sed -n '8p' | awk '{print $10}'`


#mysql_total=`cat $Logpath/$TIME.xml | sed -n '9p' | awk '{print $5}'`
mysql_over=`cat $Logpath/$TIME.xml| sed -n '9p' | awk '{print $7}'`
#mysql_secc=`cat $Logpath/$TIME.xml| sed -n '9p' | awk '{print $8}'`
#mysql_failure=`cat $Logpath/$TIME.xml | sed -n '9p' | awk '{print $9}`




######Check files ###########################
if [ -s "$Logpath/$TIME.xml" ]
then
   echo "ok"
else
    echo "NOT FIND FILES $Logpath" | mail -s "Subject" $EMAILS 

fi
#######Check 10.10.74.165##################

if [ "$Disk1" -gt 80 ]
then 
    echo "10.10.74.165 服务器磁盘使用率超过百分之80，当前达到$Disk1" | mail -s "warnning" $EMAILS 
else
  echo "ok"
fi


if [ $(echo "$Load1 > $max_load" | bc) -eq 1 ]
then 
    echo "10.10.74.165 服务器一分钟内负载超过3，当前达到$Load1" | mail -s "warnning" $EMAILS 
else
  echo "ok"
fi


if [ "$Memery1" -lt 300 ]
then 
    echo "10.10.74.165 服务器可使用内存小于 300" | mail -s "warnning" $EMAILS 
else
  echo "ok"
fi


if [ "$Nm1" -gt 8000 ]
then 
    echo "10.10.74.165 服务器文件积压数超过 8000，当前文件数$Nm1" | mail -s "warnning" $EMAILS 
else
  echo "ok"
fi


if [ "$Code1" != 200 ]
then 
    echo "10.10.74.165 服务器tomcat返回状态不是 200，当前状态是$Code1" | mail -s "warnning" $EMAILS 
else
  echo "ok"
fi

######Check XTD-API#######################

if [ "$xtd_api1" != 200 ]
then 
    echo "当前新天地Apply接口返回状态不是200，当前状态是$xtd_api1" | mail -s "warnning" $EMAILS 
else
  echo "ok"
fi



if [ "$xtd_api2" != 200 ]
then 
    echo "当前新天地对账(duizhang)接口返回状态不是200,当前状态是$xtd_api2" | mail -s "warnning" $EMAILS 
else
  echo "ok"
fi


if [ "$xtd_api3" != 200 ]
then 
    echo "当前新天地Getresult接口返回状态不是200,当前状态是$xtd_api3" | mail -s "warnning" $EMAILS 
else
  echo "ok"
fi
#######Check 10.10.74.167###############

if [ "$Disk3" -gt 80 ]
then
    echo "10.10.74.167 服务器磁盘使用率超过百分之80，当前达到$Disk3" | mail -s "warnning" $EMAILS
else
  echo "ok"
fi


if [ $(echo "$Load3 > $max_load" | bc) -eq 1 ]
then
    echo "10.10.74.167 服务器一分钟内负载超过 3，当前达到$Load3" | mail -s "warnning" $EMAILS
else
  echo "ok"
fi


if [ "$Memery3" -lt 300 ]
then
    echo "10.10.74.167 服务器可使用内存小于 300" | mail -s "warnning" $EMAILS
else
  echo "ok"
fi
#######Check 10.10.74.168################


if [ "$Disk4" -gt 80 ]
then
    echo "10.10.74.168 服务器磁盘使用率超过百分之80，当前达到$Disk4" | mail -s "warnning" $EMAILS
else
  echo "ok"
fi


if [ $(echo "$Load4 > $max_load" | bc) -eq 1 ]
then
    echo "10.10.74.168 服务器一分钟内负载超过3，当前达到$Load4" | mail -s "warnning" $EMAILS
else
  echo "ok"
fi


if [ "$Memery4" -lt 300 ]
then
    echo "10.10.74.168 服务器可使用内存小于300" | mail -s "warnning" $EMAILS
else
  echo "ok"
fi



if [ "$Code4" != 200 ]
then
    echo "10.10.74.168 tomcat code not 200" | mail -s "warnning" $EMAILS
else
  echo "ok"
fi

#############Check 10.10.74.169##############
if [ "$Disk5" -gt 80 ]
then
    echo "10.10.74.169 服务器磁盘使用率超过百分之80，当前达到$Disk5" | mail -s "warnning" $EMAILS
else
  echo "ok"
fi


if [ $(echo "$Load5 > $max_load" | bc) -eq 1 ]
then
    echo "10.10.74.169 服务器一分钟内负载超过3，当前达到$Load5" | mail -s "warnning" $EMAILS
else
  echo "ok"
fi


if [ "$Memery5" -lt 300 ]
then
    echo "10.10.74.169 服务器可使用内存小于300" | mail -s "warnning" $EMAILS
else
  echo "ok"
fi

#####################Check mysql_total#######
if [ "$mysql_over" -gt 1000 ]
then
    echo "朝阳机房查询进京证办理积压超过1000，当前积压数为$mysql_over" | mail -s "warnning" $EMAILS
else
  echo "ok"
fi
###朝阳机房数据库与政务云数据库积压数对比####
Zwy_Nm=`mysql -h 192.166.8.8 -uroot -proot -e "SELECT count(*) from mobile_bjjj.enterbj_apply_info where status='2' and create_time > '${NOWDAY}'"  | awk 'NR==2{print '$1'}'`
if [ "$mysql_over" -gt "$Zwy_Nm" ]
then
    echo "















