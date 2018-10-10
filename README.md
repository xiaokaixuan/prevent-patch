## 黑域一键补丁 使用说明

```
Usage: prevent_patch.cmd <sdk-version>.

sdk-version:
   19: Android 4.4 KitKat
   20: Android 4.4W
   21: Android 5.0 Lollipop
   22: Android 5.1 Lollipop
   23: Android 6.0 Marshmallow
   24: Android 7.0 Nougat
   25: Android 7.1 Nougat
   26: Android 8.0 Oreo
   27: Android 8.1 Oreo
   28: Android 9.0 Pie
```
### 工具

- > `ADB`, 存在于 Android platform tools 中
  - > [Windows][adb-win]
  - > [USB 驱动][adb-win-driver], 某些古老的 windows 可能需要
- > [Python][python], 最新的 2.X 或者 3.X，用于运行补丁程序
- > [JDK][javase], Java SE 8 (JDK) 以上，smali/baksmali 需要 Java 7，而 oat2dex 需要Java 8

### 准备
- > 设备或ROM中提取 `services.jar`, `services.odex`, `services.odex`, `boot.oat`。
```
$> adb pull /system/framework
```
- > Android 4.4 或者非 odex 优化版本 (`services.jar` 在 1M 以上)， 将`services.jar`放入`work_dir`目录即可。
- > Odex/Vdex 优化版本 (`services.jar` 在 1M 以下)，将`services.jar`放入work_dir目录，`boot.oat`、`services.odex`、`services.odex`放入`work_dir/odex`目录即可。
- > Android 7.0 及以上版本中的`boot.oat`可能依赖同目录下的其它文件，如果`boot.oat`或`services.odex`出现在多个目录，使用任意一个即可。

### 打补丁
```
$> prevent_patch.cmd <sdk-version>
```
执行结束，`work_dir`中会生成中间目录`services`，文件`classes.dex`以及目标文件`services-p.jar`。

补丁完成后，请做好备份，用`services-p.jar`替换`设备`中的`services.jar`，并删除`设备`中原始的`services.odex`，重启即可。

### APP安装
- > Android 8.0 以下版本直接安装`hy.apk`即可。
- > Android 8.0 以上版本需将`hy_oreo.apk`拷贝至`/system/app/Brevent/Brevent.apk`，安装为系统应用即可。

[adb-win]: http://dl.google.com/android/repository/platform-tools_r25-windows.zip
[adb-mac]: http://dl.google.com/android/repository/platform-tools_r25-macosx.zip
[adb-linux]: http://dl.google.com/android/repository/platform-tools_r25-linux.zip
[adb-win-driver]: http://dl.google.com/android/repository/usb_driver_r11-windows.zip
[javase]: http://www.oracle.com/technetwork/java/javase/downloads/index.html
[python]: https://www.python.org/downloads/
[smali]: https://bitbucket.org/JesusFreke/smali/downloads
[patch.py]: https://github.com/liudongmiao/Brevent/raw/master/assets/patch.py
[oat2dex]: https://github.com/testwhat/SmaliEx/releases/tag/0.86
