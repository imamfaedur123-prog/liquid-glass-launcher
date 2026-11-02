#!/system/bin/sh
# Build + open APK after build (Termux)
set -e
cd ~/launcher-app
./gradlew assembleDebug
APK=app/build/outputs/apk/debug/app-debug.apk
cp "$APK" /storage/emulated/0/Download/liquid-glass-launcher.apk
echo "APK copied to Download/liquid-glass-launcher.apk"
termux-open /storage/emulated/0/Download/liquid-glass-launcher.apk
