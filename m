#!/bin/bash
#
# by Minhker
# MinhKer Build Script V9 for m51

# Main Dir
if [ ! -d out ]; then
	mkdir out
fi
KERNEL_OUT=$(pwd)/out/arch/arm64/boot/Image.gz-dtb
DTBO_OUT=$(pwd)/out/arch/arm64/boot/dtbo.img
KERNEL_MK=$(pwd)/MK/MinhKer_kernel_R_M51/Image.gz-dtb
DTBO_MK=$(pwd)/MK/MinhKer_kernel_R_M51/dtbo.img
VERSION=V1
NAME=MinhKer_R
JOBS=8
DATE=$(date +%Y%m%d)
CONFIG=sm7150_sec_m51_eur_open_defconfig
VARIANT=M515
export ARCH=arm64
export SUBARCH=arm64
export CROSS_COMPILE=/home/m/kernel/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export CLANG_TRIPLE=/home/m/kernel/toolchain/clang/host/linux-x86/clang-4639204/bin/aarch64-linux-gnu-
export REAL_CC=/usr/bin/clang
BUILD_CROSS_COMPILE=/home/m/kernel/aarch64-linux-android-4.9/bin/aarch64-linux-android-
KERNEL_LLVM_BIN=/home/m/kernel/toolchain/clang/host/linux-x86/clang-4639204/bin/clang
CLANG_TRIPLE=aarch64-linux-gnu-
KERNEL_MAKE_ENV="DTC_EXT=$(pwd)/tools/dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y"
##########################################
read -p "Clean source (y/n) > " yn
if [ "$yn" = "Y" -o "$yn" = "y" ]; then
     echo "Clean Build"    
     make clean && make mrproper 
	rm ./arch/arm64/boot/Image
	rm ./arch/arm64/boot/Image.gz
	rm ./Image  
	rm $KERNEL_MK
    	rm $MK_DTBO
	rm -rf ./out
	mkdir out
else
     echo "okey will build kernel"         
fi

BUILD_ZIMAGE()
{
	echo "Building zImage for $VARIANT"
	export LOCALVERSION=-$NAME-$VERSION-$VARIANT-$DATE
	make  $CONFIG
	make -j$JOBS
	if [ ! -e ./arch/arm64/boot/Image ]; then
	exit 0;
	echo "zImage Failed to Compile"
	fi
	echo "----------------------------------------------"
}
CHECK_DTBO()
{
	if [ ! -e $DTBO_OUT ]; then
	exit 0;
	echo "DTBO Failed to Compile"
	fi
	echo "----------------------------------------------"
}
CHECK_IMAGE()
{
	if [ ! -e $KERNEL_OUT ]; then
	exit 0;
	echo "Image.gz-dtb Failed to Compile"
	fi
	echo "----------------------------------------------"
}
# Main Menu
clear
echo "----------------------------------------------"
echo "$NAME $VERSION Build Script"
echo "----------------------------------------------"
PS3='Please select your option (1-x) Ctrl C for exit: '
menuvar=( "SM-M515_used_for_now" "SM-M515_dtbo.img")
select menuvar in "${menuvar[@]}"
do
    case $menuvar in
	"SM-M515_used_for_now")
            clear
	    rm $KERNEL_MK $DTBO_MK $KERNEL_OUT $DTBO_OUT
            echo "Starting $VARIANT Image.gz-dtb kernel build..."
	    export LOCALVERSION=-$NAME-$VERSION-$VARIANT-$DATE
	    make -C $(pwd) O=$(pwd)/out $KERNEL_MAKE_ENV ARCH=arm64 CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE $CONFIG
	    make -j8 -C $(pwd) O=$(pwd)/out $KERNEL_MAKE_ENV ARCH=arm64 CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE
	    CHECK_IMAGE
            echo "Starting $VARIANT dtbo.img build..."
	    tools/mkdtimg create $DTBO_OUT --page_size=4096 $(find out -name "*.dtbo")
	    #$BUILD_KERNEL_DIR/tools/mkdtimg create $PRODUCT_OUT/dtbo.img --page_size=4096 $BUILD_KERNEL_OUT_DIR/arch/arm64/boot/dts/samsung/sm6150-sec-${MODEL}-${REGION}-overlay*.dtbo
	    CHECK_DTBO
   	    echo "Coppy from /OUT Image.gz-dtb dtbo.img to MK folder zip  "
	    cp $KERNEL_OUT $KERNEL_MK
    	    cp $DTBO_OUT $DTBO_MK
	    echo " Create kernel flashable zip"
            rm -rfv $(find MK/MinhKer_kernel_R_M51 -name "*.zip")
	    ./MK/MinhKer_kernel_R_M51/zip.sh
	    cp -r $(pwd)/MK/MinhKer_kernel_R_M51 /home/m/share/KERNEL
	    echo "$VARIANT Image.gz-dtb dtbo.img build coppy and zip finished."
	    break
            ;;
	"SM-M515_dtbo.img")
            clear
	    rm $DTBO_MK $DTBO_OUT 
            echo "Starting $VARIANT dtbo.img build..."
	    tools/mkdtimg create $DTBO_OUT  --page_size=4096 $(find out -name "*.dtbo")
	    #$BUILD_KERNEL_DIR/tools/mkdtimg create $PRODUCT_OUT/dtbo.img --page_size=4096 $BUILD_KERNEL_OUT_DIR/arch/arm64/boot/dts/samsung/sm6150-sec-${MODEL}-${REGION}-overlay*.dtbo
	    CHECK_DTBO
	    echo "Coppy from /OUT dtbo.img to MK folder zip"
    	    cp $DTBO_OUT $DTBO_MK
	    echo " Create kernel flashable zip"
	    rm -rfv $(find MK/MinhKer_kernel_R_M51 -name "*.zip")
	    ./MK/MinhKer_kernel_R_M51/zip.sh
	    cp -r $(pwd)/MK/MinhKer_kernel_R_M51 /home/m/share/KERNEL
	    echo "$VARIANT dtbo.img build coppy and zip finished."
	    break
            ;;
        *) echo Invalid option.;;
	          
    esac
done
