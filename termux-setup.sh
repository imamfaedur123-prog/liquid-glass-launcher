#!/system/bin/sh
# Termux setup script for building Liquid Glass Launcher APK
set -e

echo "=== 1. Update & install base packages ==="
pkg update -y
pkg install -y openjdk-21 git wget unzip

echo "=== 2. Setup Android SDK ==="
export ANDROID_HOME="$HOME/android-sdk"
mkdir -p "$ANDROID_HOME/cmdline-tools"
cd "$ANDROID_HOME/cmdline-tools"

# Download command-line tools (adjust version if needed)
CMDLINE_URL="https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip"
wget -O cmdline.zip "$CMDLINE_URL"
unzip -q cmdline.zip
mv cmdline-tools latest
rm cmdline.zip

echo "=== 3. Install platform & build-tools ==="
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
yes | sdkmanager --licenses
sdkmanager "platforms;android-33" "build-tools;34.0.0" "platform-tools"

echo "=== 4. Environment variables (add to ~/.bashrc) ==="
echo 'export ANDROID_HOME=$HOME/android-sdk' >> ~/.bashrc
echo 'export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH' >> ~/.bashrc
echo 'export JAVA_HOME=/data/data/com.termux/files/usr/lib/jvm/java-21-openjdk' >> ~/.bashrc

echo "=== DONE ==="
echo "Now copy launcher-app folder to Termux home, then:"
echo "  cd ~/launcher-app && ./gradlew assembleDebug"
