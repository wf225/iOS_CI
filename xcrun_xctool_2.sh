#!/bin/sh

CURDIR="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)"
PROJECT_NAME="GoogleTestExample.xcodeproj"
SCHEME_NAME="iOSGTestApp"
CONFIG="Release"
APP_PATH="$CURDIR/output-packages"

SIM="iPhone 5"
UDID="B1151929-87B0-4C2B-B82F-1FABB01AA69A"
SDK_NAME="iphonesimulator9.2"
DES_PLATFORM="platform=iOS Simulator,id=$UDID"


# == Devices ==
# -- iOS 9.2 --
#     iPhone 4s (BCC9BF41-E46B-4102-84CC-C124BF9B6F92) (Shutdown)
#     iPhone 5 (FA3CC083-8E45-4A2A-BC2D-472C41407C24) (Shutdown)
#     iPhone 5 (B1151929-87B0-4C2B-B82F-1FABB01AA69A) (Shutdown)
#     iPhone 5s (34DE5F65-3250-4F77-B71A-B9FC997CEC46) (Shutdown)
#     iPhone 6 (88241EE7-782D-4DDE-A098-6BF3A3F34F19) (Shutdown)
#     iPhone 6 Plus (2DF4A61E-D8EF-4C19-A557-C61AF3B6CA63) (Shutdown)
#     iPhone 6s (27D0349A-FB3D-4547-8DC2-0878CC8DA5B0) (Shutdown)
#     iPhone 6s Plus (DF7EA119-676A-4C34-88B2-0525E0AC7DC5) (Shutdown)
#     iPad 2 (1BD4AD1A-385A-4CBE-98F3-8E818CAE8E80) (Shutdown)
#     iPad Retina (D8D172A8-3A01-4B8C-B954-38E584E21A5B) (Shutdown)
#     iPad Air (7C4B9399-22C1-468C-812E-ECA6B217A1E8) (Shutdown)
#     iPad Air 2 (90A8133E-BD66-466E-976F-F6BD37AE8E32) (Shutdown)
#     iPad Pro (250E6FE1-FB95-490B-88F9-C724382599B8) (Shutdown)

echo "=== Launch Simulator.app ==="
open -n "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app" --args -CurrentDeviceUDID "$UDID"
sleep 15

echo "=== Uninstall testing app ==="
xcrun simctl uninstall "$SIM" "com.autodesk.iOSGTestApp"
sleep 3

# echo "=== Install testing app ==="
# xcrun simctl install "$SIM" "$APP_PATH/iOSGTestApp.app"
# sleep 3

# xcrun simctl launch "$SIM" "com.autodesk.iOSGTestApp"


# "Run unit-tests standalone"
xctool -sdk "$SDK_NAME" \
       -configuration "$CONFIG" \
       -destination "$DES_PLATFORM" \
       run-tests \
                 -appTest "$APP_PATH"/iOSGTestAppTests.xctest:"$APP_PATH"/iOSGTestApp.app/iOSGTestApp

# "Run UI-tests standalone"
xctool -sdk "$SDK_NAME" \
       -configuration "$CONFIG" \
       -destination "$DES_PLATFORM" \
       run-tests \
                 -appTest "$APP_PATH"/iOSGTestAppUITests.xctest:"$APP_PATH"/iOSGTestApp.app/iOSGTestApp

                 
# Run the command killall Simulator at end
# killall Simulator && sleep 5
# xcrun simctl shutdown "B1151929-87B0-4C2B-B82F-1FABB01AA69A"