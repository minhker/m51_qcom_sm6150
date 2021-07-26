#!/bin/bash

export CROSS_COMPILE=/home/m/kernel/aarch64-linux-android-4.9/bin/aarch64-linux-android-
#export ARCH=arm64

mkdir out

BUILD_CROSS_COMPILE=/home/m/kernel/aarch64-linux-android-4.9/bin/aarch64-linux-android-
KERNEL_LLVM_BIN=/home/m/kernel/toolchain/clang/host/linux-x86/clang-4639204/bin/clang
CLANG_TRIPLE=aarch64-linux-gnu-
KERNEL_MAKE_ENV="DTC_EXT=$(pwd)/tools/dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y"

#export ARCH=arm64
#make -C $(pwd) O=$(pwd)/out KCFLAGS=-mno-android a70q_eur_open_defconfig
#make -j64 -C $(pwd) O=$(pwd)/out KCFLAGS=-mno-android

make -C $(pwd) O=$(pwd)/out $KERNEL_MAKE_ENV ARCH=arm64 CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE sm7150_sec_m51_eur_open_defconfig
make -j8 -C $(pwd) O=$(pwd)/out $KERNEL_MAKE_ENV ARCH=arm64 CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE

#cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image
tools/mkdtimg create out/arch/arm64/boot/dtbo.img --page_size=4096 $(find out -name "*.dtbo")
#$BUILD_KERNEL_DIR/tools/mkdtimg create $PRODUCT_OUT/dtbo.img --page_size=4096 $BUILD_KERNEL_OUT_DIR/arch/arm64/boot/dts/samsung/sm6150-sec-${MODEL}-${REGION}-overlay*.dtbo
