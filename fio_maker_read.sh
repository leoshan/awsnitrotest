#!/bin/bash

#rm -rf fio_res*

#mount /dev/sdb1/ /home/vm_env/vm_share_ext3/
#cp /home/vm_env/vm_share_ext3/fio_res_* .
#umount /dev/sdb1/

#sh /home/dragon_test/fioA/pm_collect_result.sh
#sh /home/dragon_test/fioB/pm_collect_result.sh 

iops=0
bw=0
bwdata=0
bwunit=0
delaydata=0
delayunit=0

rm -rf fio_res_output.txt
for i in `ls fio_res*`
do
	iops=`head -n 18 $i | tail -n 4 | grep iops | awk -F',' '{print $3}' |awk -F'=' '{print $2}'`
	bw=`head -n 18 $i | tail -n 4 |grep iops | awk -F',' '{print $2}' |awk -F'=' '{print $2}'`
	bwdata=`head -n 18 $i | tail -n 4 | grep iops | awk -F',' '{print $2}' |awk -F'=' '{print $2}'|awk -F"[KM]" '{print $1}'`
	bwunit=${bw:0-4:4}

	delaydata=`head -n 18 $i | tail -n 4 | grep -w lat | grep -w avg | awk -F',' '{print $3}'|awk -F'=' '{print $2}'`
	delayunit=`head -n 18 $i | tail -n 4 | grep -w lat | head -n 1 | awk -F'(' '{print $2}' |  awk -F')' '{print $1}'`

	if [ $bwunit = "MB/s" ];then
		bwdata=`echo "$bwdata*1000"|bc`;
	fi

	if [ $delayunit = "msec" ];then	
		delaydata=`echo "$delaydata*1000"|bc`;
	fi
	
	printf "[ipos bw[KBps] delay[usec]] %-20s %-20s %-20s" $iops $bwdata $delaydata >> fio_res_output.txt	
	printf "%-50s" $i >> fio_res_output.txt

	echo  >> fio_res_output.txt
done

cat fio_res_output.txt
