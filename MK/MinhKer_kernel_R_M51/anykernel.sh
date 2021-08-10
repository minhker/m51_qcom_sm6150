# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers
# Edit for A30 by @Minhker 98
## AnyKernel setup
# begin properties
properties() { '
kernel.string=
do.devicecheck=0
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=
'; } # end properties

# shell variables
block=/dev/block/by-name/boot;
dtboblock=/dev/block/by-name/dtbo;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

ui_print "- Unpacking boot image";

## AnyKernel install
dump_boot;

mount /system
mount /system_root/
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;

# Enable Spectrum Support
 #ui_print "- Setting Up Spectrum work now on R";
 #cp /tmp/anykernel/tools/init.spectrum.rc /system_root/init.spectrum.rc;
 #chmod 644 /system_root/init.spectrum.rc;
 #cp /tmp/anykernel/tools/init.spectrum.sh /system_root/init.spectrum.sh;
 # chmod 755 /system_root/init.spectrum.sh;

#insert_line /system_root/system/etc/init/hw/init.rc "import /init.spectrum.rc" after "import /init.container.rc" "import /init.spectrum.rc";

 #ui_print "- Fixed smart view";
# WifiDisplay
#insert_line /system_root/system/build.prop "wlan.wfd.hdcp=disable" after "net.bt.name=Android" "wlan.wfd.hdcp=disable";


mount -o rw,remount -t auto /system >/dev/null;
rm -rf /system/bin/vaultkeeper;
rm -rf /system/etc/tima;
rm -rf /system/etc/init/secure_storage_daemon.rc;
rm -rf /system/lib/libvkjni.so;
rm -rf /system/lib/libvkservice.so;
rm -rf /system/lib64/libvkjni.so;
rm -rf /system/lib64/libvkservice.so;
rm -rf /system/priv-app/KLMSAgent;
rm -rf /system/priv-app/KnoxGuard;
rm -rf /system/priv-app/Rlc;
rm -rf /system/priv-app/TeeService;
rm -rf /system/vendor/app/mcRegistry/ffffffffd0000000000000000000000a.tlbin;
#rm -rf /system_root/system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk;
# Fix secure storage (Wi-Fi)
#cp /tmp/anykernel/tools/libsecure_storage.so /system/vendor/lib/libsecure_storage.so;
#chmod 644 /system/vendor/lib/libsecure_storage.so;
#cp /tmp/anykernel/tools/x86_64/mk /system_root/system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk;
#chmod 644 /system_root/system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk;
#cp /tmp/anykernel/tools/libsecure_storage.so /system/vendor/lib/libsecure_storage.so;
#chmod 644 /system/vendor/lib/libsecure_storage.so;

# Change permissions
chmod 755 /system/bin/busybox;
####################################################################
# Set KNOX to 0x0 on running /system
$RESETPROP ro.boot.warranty_bit "0";
$RESETPROP ro.warranty_bit "0";

# Fix Samsung Related Flags
$RESETPROP ro.fmp_config "1";
$RESETPROP ro.boot.fmp_config "1";



umount /system;
umount /system_root;
#ui_print "- Installing new boot image and spectrum";

write_boot;

ui_print "- Done  ";
ui_print " ";

## end install

