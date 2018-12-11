#!/bin/bash

sight=$1
index=$2
rwtype=$3
rwmixread=$4
bs=$5
iodep=$6
runtime=$7
numjobs=$8
case $sight in
 A_single_queue)
        echo "A_single_queue" $index
	cp fio_uvp_100.fio fio_work.fio
        ;;
 A_single_lun)
        echo "A_single_lun" $index
	cp fio_uvp_100.fio fio_work.fio
        ;;
 A_single_vbs)
        echo "A_single_vbs" $index
	cp fio_uvp_10.fio fio_work.fio
        ;;
 B_single_queue)
        echo "B_single_queue" $index
	cp fio_aws_1lun.fio fio_work.fio
        ;;
 B_single_lun)
        echo "B_single_lun" $index
	cp fio_sdi_100.fio fio_work.fio
        ;;
 B_single_vbs)
        echo "B_single_vbs" $index
	cp fio_aws_4lun.fio fio_work.fio
        ;;
 C_single_queue)
        echo "C_single_queue" $index
	cp fio_vm_100.fio fio_work.fio
        ;;
 C_single_lun)
        echo "C_single_lun" $index
	cp fio_vm_100.fio fio_work.fio
        ;;
 C_single_vbs)
        echo "C_single_vbs" $index
	cp fio_vm_10.fio fio_work.fio
        ;;
 D_single_queue)
        echo "D_single_queue" $index
	cp fio_vm_100.fio fio_work.fio
        ;;
 D_single_lun)
        echo "D_single_lun" $index
	cp fio_vm_100.fio fio_work.fio
        ;;
 D_single_vbs)
        echo "D_single_vbs" $index
	cp fio_vm_10.fio fio_work.fio
        ;;
 *)
        echo "Usage: $name [A/B/C/D_single_queue/single_lun/single_vbs rwtype blocksize iodep runtime]"
        exit 1
        ;;
esac

sed -i "s/rw=rwxxx/rw=$rwtype/g" fio_work.fio
sed -i "s/bs=bsxxx/bs=$bs/g" fio_work.fio
sed -i "s/iodepth=iodepxxx/iodepth=$iodep/g" fio_work.fio
sed -i "s/runtime=runtimexxx/runtime=$runtime/g" fio_work.fio
sed -i "s/rwmixread=rwmixreadxxx/rwmixread=$rwmixread/g" fio_work.fio

rm -rf fio_res_${index}_${sight}_${rwtype}_${bs}_${rwmixread}_${iodep}_${runtime}_${numjobs}
fio fio_work.fio | tee fio_res_${index}_${sight}_${rwtype}_${bs}_${rwmixread}_${iodep}_${runtime}_${numjobs}
