#!/system/bin/sh

echo "===卡顿修复脚本by Pzqqt==="
sfoa=/system/framework/oat/arm
sfs=/system/framework/services.jar
cstmp=/cache/STMP

echo ""
echo "=== Remount system & cache..."
/system/bin/mount -o rw,remount /system || busybox mount -o rw,remount /system
/system/bin/mount -o rw,remount /cache || busybox mount -o rw,remount /cache

mkdir $cstmp
unzip $sfs -d $cstmp > /dev/null 2>&1
if ! [ -f $cstmp/classes.dex ];then
rm -rf $cstmp
echo ""
echo "*** Can not found classes.dex in $sfs!"
echo ""
echo "*** Abort..."
exit 1
fi
rm -rf $cstmp

if [ -d $sfoa"64" ]; then
sfoa=$sfoa"64"
fi

echo ""
echo "=== Remove old odex & vdex..."
rm -rf $sfoa/services.vdex
rm -rf $sfoa/services.odex

if ! [ -f $sfoa/services.art ];then
if [ -f $sfoa/BAK/services.art ]; then
cp $sfoa/BAK/services.art $sfoa
chmod 0644 $sfoa/services.art
fi
fi

echo ""
echo "=== Generate new odex & vdex..."
/system/bin/dex2oat --dex-file=$sfs --input-vdex-fd=-1 --output-vdex=$sfoa/services.vdex --oat-file=$sfoa/services.odex
chmod 0644 $sfoa/services.vdex
chmod 0644 $sfoa/services.odex

echo ""
echo "=== Remove classes.dex from services.jar.."
zip -d $sfs classes.dex > /dev/null 2>&1
# mv /system/framework/services.jar /system/framework/services.jar.BAKK
# mv /system/framework/services.jar.bak /system/framework/services.jar
chmod 0644 $sfs

echo ""
echo "=== Remove Dalvik-cache file..."
rm -rf /data/dalvik-cache/arm/system@framework@services.jar@classes.dex
rm -rf /data/dalvik-cache/arm/system@framework@services.jar@classes.vdex
rm -rf /data/dalvik-cache/arm64/system@framework@services.jar@classes.dex
rm -rf /data/dalvik-cache/arm64/system@framework@services.jar@classes.vdex

echo ""
echo "=== Done!"

echo ""
echo "=== Reboot..."
sleep 2
reboot
echo ""
echo "*** If device does not reboot automatically, reboot yourself"
exit 0