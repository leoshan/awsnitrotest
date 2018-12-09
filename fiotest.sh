function RunFio
{
 numjobs=$1  # 实例中的测试线程数，如示例中的 8
 iodepth=$2  # 同时发出I/O数的上限，如示例中的 64
 bs=$3       # 单次I/O的块文件大小，如示例中的 4K
 rw=$4       # 测试时的读写策略，如示例中的 randwrite
 filename=$5 # 指定测试文件的名称，如示例中的 /dev/vdb
 nr_cpus=`cat /proc/cpuinfo |grep "processor" |wc -l`
 if [ $nr_cpus -lt $numjobs ];then
     echo "Numjobs is more than cpu cores, exit!"
     exit -1
 fi
 let nu=$numjobs+1
 cpulist=""
 for ((i=1;i<10;i++))
 do
     list=`cat /sys/block/vdb/mq/*/cpu_list | awk '{if(i<=NF) print $i;}' i="$i" | tr -d ',' | tr '\n' ','`
     if [ -z $list ];then
         break
     fi
     cpulist=${cpulist}${list}
 done
 spincpu=`echo $cpulist | cut -d ',' -f 2-${nu}`
 echo $spincpu
 fio --ioengine=libaio --runtime=30s --numjobs=${numjobs} --iodepth=${iodepth} --bs=${bs} --rw=${rw} --filename=${filename} --time_based=1 --direct=1 --name=test --group_reporting --cpus_allowed=$spincpu --cpus_allowed_policy=split
}
echo 2 > /sys/block/vdb/queue/rq_affinity
sleep 5
RunFio 8 64 '4k' 'randwrite' '/dev/nvme1n1'
