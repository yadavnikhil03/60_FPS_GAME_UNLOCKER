<<<<<<< HEAD
MODDIR=${0%/*}
setenforce <SELINUX_MODE>
setprop ro.vendor.qti.config.zram true
write /proc/sys/vm/page-cluster 0
write /sys/block/zram0/max_comp_streams 4
conflict=$(xml=$(find /data/adb -iname "*.xml");for i in $xml; do if grep -q 'allow-in-power-save package="com.google.android.gms"' $i 2>/dev/null; then echo "$i";fi; done)
 for i in $conflict
 do
 sed -i '/allow-in-power-save package="com.google.android.gms"/d;/allow-in-data-usage-save package="com.google.android.gms"/d' $i
 done

=======
#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}
setprop ro.vendor.qti.config.zram true
write /proc/sys/vm/page-cluster 0
write /sys/block/zram0/max_comp_streams 4
# This script will be executed in post-fs-data mode
# More info in the main Magisk thread
>>>>>>> 5bbc55447f3f322bc59bd3c98deccd89a4adbc5f
