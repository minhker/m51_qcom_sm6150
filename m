#!/bin/bash
#
# by Minhker
# MinhKer Build Script V9 for m51

# Main Dir
if [ ! -d out ]; then
	mkdir out
fi
WINKER=/home/m/share/KERNEL/MinhKer_kernel_R_M51
KERNEL_OUT=$(pwd)/out/arch/arm64/boot/Image.gz-dtb
DTBO_OUT=$(pwd)/out/arch/arm64/boot/dtbo.img
KERNEL_MK=$(pwd)/MK/MinhKer_kernel_R_M51/Image.gz-dtb
DTBO_MK=$(pwd)/MK/MinhKer_kernel_R_M51/dtbo.img
VERSION=V1
NAME=MinhKer_R
JOBS=6
DATE=$(date +%Y%m%d)
CONFIG=sm7150_sec_m51_eur_open_defconfig
VARIANT=M515

# Export KBUILD flags
export KBUILD_BUILD_USER="minhker"
export KBUILD_BUILD_HOST="minhka"
export ARCH=arm64
export SUBARCH=arm64
export ANDROID_MAJOR_VERSION=r
export PLATFORM_VERSION=11.0.0
BUILD_CROSS_COMPILE=/home/m/kernel/aarch64-linux-android-4.9/bin/aarch64-linux-android-
KERNEL_LLVM_BIN=/home/m/kernel/llvm-arm-toolchain-ship-10.0/bin/clang
CLANG_TRIPLE=aarch64-linux-gnu-
KERNEL_MAKE_ENV="DTC_EXT=$(pwd)/tools/dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y"

export CROSS_COMPILE=$BUILD_CROSS_COMPILE
export CLANG_TRIPLE=$CLANG_TRIPLE
export REAL_CC=$KERNEL_LLVM_BIN
export CC=$KERNEL_LLVM_BIN
export USE_CCACHE=1
# Export CCACHE
export CCACHE="$(which ccache)"
export USE_CCACHE=1
ccache -M 20G
export CCACHE_COMPRESS=1
##########################################
CLEAUTO()
{
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
	rm /home/m/kernel/m51_sm6150/out/arch/arm64/boot/dtb
	mkdir out
else
     echo "okey will build kernel"         
fi
}
BUILD_ZIMAGE()
{
	export LOCALVERSION=-$NAME-$VERSION-$VARIANT-$DATE
	 make  O=$(pwd)/out $CONFIG -j6 $KERNEL_MAKE_ENV
 	make -j6 O=$(pwd)/out $KERNEL_MAKE_ENV
	CHECK_IMAGE
	echo "----------------------------------------------"
}
BUILD_DTBO()
{
	if [ ! -e $(find out -name "*.dtbo") ]; then
	exit 0;
	echo "DTBO Failed to Compile"
	else
	tools/mkdtimg create $DTBO_OUT --page_size=4096 $(find out -name "*.dtbo")
	#$BUILD_KERNEL_DIR/tools/mkdtimg create $PRODUCT_OUT/dtbo.img --page_size=4096 $BUILD_KERNEL_OUT_DIR/arch/arm64/boot/dts/samsung/sm6150-sec-${MODEL}-${REGION}-overlay*.dtbo
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
PACK_BOOT_IMG()
{
	echo "----------------------------------------------"
	echo " "
	echo "Building Boot.img for $MK_VARIANT"
	cd MK
	cd AIK-Linux
	rm /home/m/kernel/m51_sm6150/MK/AIK-Linux/split_img/boot.img-dtb
	cp /home/m/kernel/kernel_source_m51_sm6150_R/out/arch/arm64/boot/dts/qcom/sdmmagpie.dtb /home/m/kernel/m51_sm6150/MK/AIK-Linux/split_img/boot.img-dtb
	cp /home/m/kernel/kernel_source_m51_sm6150_R/out/arch/arm64/boot/dts/qcom/sdmmagpie.dtb /home/m/kernel/m51_sm6150/out/arch/arm64/boot/dtb
	 #cp $KERNEL_OUT /home/m/kernel/m51_sm6150/MK/AIK-Linux/split_img/boot.img-kernel
	./repackimg.sh
	echo "coping boot.img... to..."
	cd ..
	cd ..
	cp /home/m/kernel/m51_sm6150/MK/AIK-Linux/image-new.img  /home/m/share/KERNEL/MinhKer_kernel_R_M51/boot_m51_new_dtb_gpuOc.img
}
# Main Menu
clear
echo "----------------------------------------------"
echo "$NAME $VERSION Build Script"
echo "----------------------------------------------"
PS3='Please select your option (1-x) Ctrl C for exit: '
menuvar=( "SM-M515" "SM-M515_v3")
select menuvar in "${menuvar[@]}"
do
    case $menuvar in
	"SM-M515")
            clear
	    CLEAUTO
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
"SM-M515_v3")
            clear
	    CLEAUTO
	    rm $KERNEL_MK $DTBO_MK $KERNEL_OUT $DTBO_OUT
            echo "Starting $VARIANT Image.gz-dtb kernel build..."
 	  #  "${CCACHE}" make O=$(pwd)/out $CONFIG
         #   "${CCACHE}" make -j8 O=$(pwd)/out
	    BUILD_ZIMAGE	
            echo "Starting $VARIANT dtbo.img build..."
	    BUILD_DTBO
   	    echo "Coppy from /OUT Image.gz-dtb dtbo.img to MK folder zip  "
	    cp $KERNEL_OUT $KERNEL_MK
    	    cp $DTBO_OUT $DTBO_MK
	    echo " Create boot.img"
	    PACK_BOOT_IMG
	    echo " Create kernel flashable zip"
            rm -rfv $(find MK/MinhKer_kernel_R_M51 -name "*.zip")
	    ./MK/MinhKer_kernel_R_M51/zip.sh
	    cp -r $(pwd)/MK/MinhKer_kernel_R_M51 /home/m/share/KERNEL
	    echo "$VARIANT Image.gz-dtb dtbo.img build coppy and zip finished."
	    break
            ;;

        *) echo Invalid option.;;
	          
    esac
done
