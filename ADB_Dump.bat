@echo off
adb devices

for /f "tokens=1" %%a in ('adb devices ^| find /i "device"') do (
    set device=%%a
)

if defined device (
    echo Dumping system/priv-app...
    adb pull /system/priv-app

    echo Dumping system/app...
    adb pull /system/app

    echo Dumping system/vendor...
    adb pull /system/vendor

    echo Dumping system/media...
    adb pull /system/media

    echo Dump Was Sucessful
) else (
    echo No device connected.
)

pause