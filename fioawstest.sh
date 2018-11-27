#!/bin/bash

rm -rf fio_res_[ABCB]_single*

#delay extend
./fio_single_test.sh B_single_queue 00 randwrite 0 4K    1 180  #0
./fio_single_test.sh B_single_queue 01 randread  0 4K    1 180  #1
./fio_single_test.sh B_single_queue 02 write     0 4K    1 180  #2
./fio_single_test.sh B_single_queue 03 read      0 4K    1 180  #3
./fio_single_test.sh B_single_queue 04 randwrite 0 8K    1 180  #4
./fio_single_test.sh B_single_queue 05 randread  0 8K    1 180  #5
./fio_single_test.sh B_single_queue 06 write     0 8K    1 180  #6
./fio_single_test.sh B_single_queue 07 read      0 8K    1 180  #7
./fio_single_test.sh B_single_queue 08 randwrite 0 16K    1 180  #4
./fio_single_test.sh B_single_queue 09 randread  0 16K    1 180  #5
./fio_single_test.sh B_single_queue 10 write     0 16K    1 180  #6
./fio_single_test.sh B_single_queue 11 read      0 16K    1 180  #7
./fio_single_test.sh B_single_queue 12 randwrite 0 32K    1 180  #4
./fio_single_test.sh B_single_queue 13 randread  0 32K    1 180  #5
./fio_single_test.sh B_single_queue 14 write     0 32K    1 180  #6
./fio_single_test.sh B_single_queue 15 read      0 32K    1 180  #7
./fio_single_test.sh B_single_queue 16 randwrite 0 64K    1 180  #4
./fio_single_test.sh B_single_queue 17 randread  0 64K    1 180  #5
./fio_single_test.sh B_single_queue 18 write     0 64K    1 180  #6
./fio_single_test.sh B_single_queue 19 read      0 64K    1 180  #7
./fio_single_test.sh B_single_queue 20 randwrite 0 128K    1 180  #4
./fio_single_test.sh B_single_queue 21 randread  0 128K    1 180  #5
./fio_single_test.sh B_single_queue 22 write     0 128K    1 180  #6
./fio_single_test.sh B_single_queue 23 read      0 128K    1 180  #7
#iops stability

#iops extend
./fio_single_test.sh B_single_vbs 43 randwrite 0 128K    32 180  #20
./fio_single_test.sh B_single_vbs 44 randread  0 128K    32 180  #21
./fio_single_test.sh B_single_vbs 45 randwrite 0 128K    64 180  #20
./fio_single_test.sh B_single_vbs 46 randread  0 128K    64 180  #21
./fio_single_test.sh B_single_vbs 47 randwrite 0 128K    128 180  #20
./fio_single_test.sh B_single_vbs 48 randread  0 128K    128 180  #21
./fio_single_test.sh B_single_vbs 49 randwrite 0 64K    32 180  #20
./fio_single_test.sh B_single_vbs 50 randread  0 64K    32 180  #21
./fio_single_test.sh B_single_vbs 51 randwrite 0 64K    64 180  #20
./fio_single_test.sh B_single_vbs 52 randread  0 64K    64 180  #21
./fio_single_test.sh B_single_vbs 53 randwrite 0 64K    128 180  #20
./fio_single_test.sh B_single_vbs 53 randread  0 64K    128 180  #21
./fio_single_test.sh B_single_vbs 54 randwrite 0 32K    32 180  #20
./fio_single_test.sh B_single_vbs 55 randread  0 32K    32 180  #21
./fio_single_test.sh B_single_vbs 56 randwrite 0 32K    64 180  #20
./fio_single_test.sh B_single_vbs 57 randread  0 32K    64 180  #21
./fio_single_test.sh B_single_vbs 58 randwrite 0 32K    128 180  #20
./fio_single_test.sh B_single_vbs 59 randread  0 32K    128 180  #21
./fio_single_test.sh B_single_vbs 60 randwrite 0 4K    32 180  #20
./fio_single_test.sh B_single_vbs 61 randread  0 4K    32 180  #21
./fio_single_test.sh B_single_vbs 62 randwrite 0 4K    64 180  #20
./fio_single_test.sh B_single_vbs 63 randread  0 4K    64 180  #21
./fio_single_test.sh B_single_vbs 64 randwrite 0 4K    128 180  #20
./fio_single_test.sh B_single_vbs 65 randread  0 4K    128 180  #21
./fio_single_test.sh B_single_vbs 66 randwrite 0 8K    32 180  #20
./fio_single_test.sh B_single_vbs 67 randread  0 8K    32 180  #21
./fio_single_test.sh B_single_vbs 68 randwrite 0 8K    64 180  #20
./fio_single_test.sh B_single_vbs 69 randread  0 8K    64 180  #21
./fio_single_test.sh B_single_vbs 70 randwrite 0 8K    128 180  #20
./fio_single_test.sh B_single_vbs 71 randread  0 8K    128 180  #21
./fio_single_test.sh B_single_vbs 72 randwrite 0 16K    32 180  #20
./fio_single_test.sh B_single_vbs 73 randread  0 16K    32 180  #21
./fio_single_test.sh B_single_vbs 74 randwrite 0 16K    64 180  #20
./fio_single_test.sh B_single_vbs 75 randread  0 16K    64 180  #21
./fio_single_test.sh B_single_vbs 76 randwrite 0 16K    128 180  #20
./fio_single_test.sh B_single_vbs 77 randread  0 16K    128 180  #21


#bw extend
./fio_single_test.sh B_single_vbs 78 write     0 128K    32 180  #22
./fio_single_test.sh B_single_vbs 79 read      0 128K    32 180  #23
./fio_single_test.sh B_single_vbs 80 write     0 128K    64 180  #22
./fio_single_test.sh B_single_vbs 81 read      0 128K    64 180  #23
./fio_single_test.sh B_single_vbs 82 write     0 128K    128 180  #22
./fio_single_test.sh B_single_vbs 83 read      0 128K    128 180  #23
./fio_single_test.sh B_single_vbs 84 write     0 1024K    32 180  #22
./fio_single_test.sh B_single_vbs 85 read      0 1024K    32 180  #23
./fio_single_test.sh B_single_vbs 86 write     0 1024K    64 180  #22
./fio_single_test.sh B_single_vbs 87 read      0 1024K    64 180  #23
./fio_single_test.sh B_single_vbs 88 write     0 1024K    128 180  #22
./fio_single_test.sh B_single_vbs 89 read      0 1024K    128 180  #23
#mix IO
./fio_single_test.sh B_single_vbs 90 rw     50 4K    64 180  #22
./fio_single_test.sh B_single_vbs 91 rw     70 4K    64 180  #22
./fio_single_test.sh B_single_vbs 92 rw     50 16K    64 180  #22
./fio_single_test.sh B_single_vbs 93 rw     70 16K    64 180  #22
./fio_single_test.sh B_single_vbs 94 rw     50 128K    64 180  #22
./fio_single_test.sh B_single_vbs 95 rw     70 128K    64 180  #22
./fio_single_test.sh B_single_vbs 96 rw     50 1024K    64 180  #22
./fio_single_test.sh B_single_vbs 97 rw     70 1024K    64 180  #22
