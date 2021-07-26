# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers
# Edit for M51 by @Minhker 98
## AnyKernel setup
# begin properties
properties() { '
kernel.string=Minhker Kernel for Galaxy M51
do.devicecheck=0
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=11
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
dtboblock=/dev/block/bootdevice/by-name/dtbo;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;


## AnyKernel install
split_boot;

ui_print "Flashing kernel...";

flash_boot;

ui_print "Flashing dtbo...";

flash_dtbo;

# migrate from /overlay to /overlay.d to enable SAR Magisk
if [ -d $ramdisk/overlay ]; then
  rm -rf $ramdisk/overlay;
fi;
ui_print "- Done .thanks to some ... for help ";
## end install