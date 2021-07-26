#!/bin/bash
#KERNEL_VERSION="MinhKer_kernel_R_M51_v1"
#DATE="_$(date +%d.%m.%y-%H:%M)"
#zip -r9 $KERNEL_VERSION$DATE.zip anykernel.sh META-INF tools version Image.gz-dtb dtbo.img zip.sh
cd $(pwd)/MK/MinhKer_kernel_R_M51
#zip -r9 $(pwd)/MK/MinhKer_kernel_R_M51/"MinhKer_kernel_R_M51_v1_$(date +%Y%m%d).zip" $(pwd)/MK/MinhKer_kernel_R_M51/*
zip -r9 "MinhKer_kernel_R_M51_v1_$(date +%Y%m%d).zip" *
cd ..
cd ..


