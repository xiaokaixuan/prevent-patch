@echo off 

setlocal

set sdk=%1

:main
if "%sdk%"=="19" goto :common
if "%sdk%"=="20" goto :common
if "%sdk%"=="21" goto :sdk21
if "%sdk%"=="22" goto :sdk22
if "%sdk%"=="23" goto :common
if "%sdk%"=="24" goto :common
if "%sdk%"=="25" goto :common
if "%sdk%"=="26" goto :sdk26
if "%sdk%"=="27" goto :sdk27
if "%sdk%"=="28" goto :sdk28

:help
echo.
echo Usage: prevent_patch.cmd ^<sdk-version^>.
echo.
echo sdk-version:
echo    19: Android 4.4 KitKat
echo    20: Android 4.4W
echo    21: Android 5.0 Lollipop
echo    22: Android 5.1 Lollipop
echo    23: Android 6.0 Marshmallow
echo    24: Android 7.0 Nougat
echo    25: Android 7.1 Nougat
echo    26: Android 8.0 Oreo
echo    27: Android 8.1 Oreo
echo    28: Android 9.0 Pie
exit /b

:sdk21
:sdk22
if exist work_dir\odex\boot if exist work_dir\odex\services.odex (
	cd work_dir\odex
	echo Extracting boot.oat services.odex...
	java -Xmx800m -jar "%~dsp0oat2dex.jar" boot boot.oat
	java -Xmx800m -jar "%~dsp0oat2dex.jar" services.odex dex
	cd ..
	java -Xmx800m -jar "%~dsp0baksmali.jar" d odex\services.dex -o services
	echo Patching...
	python "%~dsp0patch.py" -a "%~dsp0apk" -s services
	echo Packaging^(1/2^)...
	java -Xmx800m -jar "%~dsp0smali.jar" a -o classes.dex services
	echo Packaging^(2/2^)...
	jar -cvf services-p.jar classes.dex
	exit /b
)
goto :common

:sdk26
:sdk27
if exist work_dir\odex\services.vdex (
	cd work_dir\odex
	echo Extracting services.vdex...
	"%~dsp0vdexExtractor" -f --ignore-crc-error -v 2 -i services.vdex
	cd ..
	java -Xmx800m -jar "%~dsp0baksmali.jar" d odex\services_classes.dex -o services
	echo Patching...
	python "%~dsp0patch_oreo.py" -a "%~dsp0apk_oreo" -s services
	echo Packaging^(1/2^)...
	java -Xmx800m -jar "%~dsp0smali.jar" a -o classes.dex services
	echo Packaging^(2/2^)...
	jar -cvf services-p.jar classes.dex
	exit /b
)
goto :common

:sdk28
if exist work_dir\odex\services.vdex (
	cd work_dir\odex
	echo Extracting services.vdex...
	"%~dsp0vdexExtractor" -f --ignore-crc-error -v 2 -i services.vdex
	cd ..
	"%~dsp0flinux" "%~dsp0compact_dex_converter_linux_32" odex\services_classes.cdex
	java -Xmx800m -jar "%~dsp0baksmali.jar" d odex\services_classes.cdex.new -o services
	echo Patching...
	python "%~dsp0patch_oreo.py" -a "%~dsp0apk_oreo" -s services
	echo Packaging^(1/2^)...
	java -Xmx800m -jar "%~dsp0smali.jar" a -o classes.dex services
	echo Packaging^(2/2^)...
	jar -cvf services-p.jar classes.dex
	exit /b
)
goto :common

:common
if exist work_dir\odex\services.odex (
	cd work_dir
	echo Extracting services.odex...
	java -Xmx800m -jar "%~dsp0baksmali.jar" x -d odex odex\services.odex -o services
	echo Patching...
	python "%~dsp0patch.py" -a "%~dsp0apk" -s services
	echo Packaging^(1/2^)...
	java -Xmx800m -jar "%~dsp0smali.jar" a -o classes.dex services
	echo Packaging^(2/2^)...
	jar -cvf services-p.jar classes.dex
	exit /b
)
if exist work_dir\services.jar (
	cd work_dir
	echo Extracting service.jar...
	java -Xmx800m -jar "%~dsp0baksmali.jar" d services.jar -o services
	echo Patching...
	if "%sdk%"=="26" (
		python "%~dsp0patch_oreo.py" -a "%~dsp0apk_oreo" -s services
	) else if "%sdk%"=="27" (
		python "%~dsp0patch_oreo.py" -a "%~dsp0apk_oreo" -s services
	) else if "%sdk%"=="28" (
		python "%~dsp0patch_oreo.py" -a "%~dsp0apk_oreo" -s services
	) else (
		python "%~dsp0patch.py" -a "%~dsp0apk" -s services
	)
	echo Packaging^(1/2^)...
	java -Xmx800m -jar "%~dsp0smali.jar" a -o classes.dex services
	echo Packaging^(2/2^)...
	jar -cvf services-p.jar classes.dex
	exit /b
)

