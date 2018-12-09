fio --ioengine=libaio --runtime=30s --numjobs=1 --iodepth=1 --bs=4k --rw=randwrite --filename=/dev/nvme1n1 --time_based=1 --direct=1 --name=test --group_reporting
fio --ioengine=libaio --runtime=60s --numjobs=2 --iodepth=1 --bs=4k --rw=randwrite --filename=/dev/nvme1n1 --time_based=1 --direct=1 --name=test --group_reporting --cpus_allowed=1,2 --cpus_allowed_policy=split
