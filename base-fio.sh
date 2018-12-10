fio --ioengine=libaio --runtime=30s --numjobs=1 --iodepth=1 --bs=4k --rw=randwrite --filename=/dev/nvme1n1 --time_based=1 --direct=1 --name=test --group_reporting
fio --ioengine=libaio --runtime=60s --numjobs=2 --iodepth=1 --bs=4k --rw=randwrite --filename=/dev/nvme1n1 --time_based=1 --direct=1 --name=test --group_reporting --cpus_allowed=1,2 --cpus_allowed_policy=split

fio --ioengine=libaio --runtime=30s --numjobs=2 --iodepth=1 --bs=4k --rw=randwrite --filename=/dev/nvme1n1 --time_based=1 --direct=1 --name=test --group_reporting

fio --filename=/dev/vdf --rw=write --bs=256k --iodepth=32 --ioengine=libaio --direct=1 --name=volume-initialize

fio --ioengine=libaio --runtime=30s --numjobs=1 --iodepth=1 --bs=4k --rw=randwrite --filename=/dev/nvme1n1 --time_based=1 --direct=1 --name=test --group_reporting
fio --ioengine=libaio --runtime=60s --numjobs=2 --iodepth=1 --bs=4k --rw=randwrite --filename=/dev/nvme1n1 --time_based=1 --direct=1 --name=test --group_reporting --cpus_allowed=1,2 --cpus_allowed_policy=split

fio --filename=/dev/vdb --rw=read --bs=256k --iodepth=32 --ioengine=libaio --direct=1 --name=volume-initialize
fio --filename=/dev/vdc --rw=read --bs=256k --iodepth=32 --ioengine=libaio --direct=1 --name=volume-initialize
fio --filename=/dev/vdd --rw=read --bs=256k --iodepth=32 --ioengine=libaio --direct=1 --name=volume-initialize
fio --filename=/dev/vde --rw=read --bs=256k --iodepth=32 --ioengine=libaio --direct=1 --name=volume-initialize
fio --filename=/dev/vdf --rw=read --bs=256k --iodepth=32 --ioengine=libaio --direct=1 --name=volume-initialize

iostat -t -xm 1 | tee iostat-read.txt
yum install iotop

iotop -o

