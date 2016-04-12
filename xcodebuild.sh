#!/bin/sh

CURDIR="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)"

PROJECT_NAME="GoogleTestExample.xcodeproj"
SCHEME_NAME="iOSGTestApp"
CONFIG="Release"

# SDK_NAME="iphonesimulator9.2"
# DES_PLATFORM="platform=iOS Simulator,name=iPhone 6s"
SDK_NAME="iphoneos9.2"
# DES_PLATFORM="platform=iOS,id=88dda2712830c2020dfb4f09f08bfe512a1ab935"
DES_PLATFORM="platform=iOS,id=97d7c68955e24069c7647f9457d5ec6f9ae442ff"

DERIVED_PATH="output"
# APP_PATH="$CURDIR"/"$DERIVED_PATH"/Build/Products/"$CONFIG"-iphonesimulator
APP_PATH="$CURDIR"/"$DERIVED_PATH"/Build/Products/"$CONFIG"-iphoneos

echo "===== Start ipa package ====="

# Run the command killall Simulator && sleep 5 before the xcodebuild command to shutdown the simulator and waiting 5 seconds
killall Simulator && sleep 3

echo "Step-1, build clean ...... "
xcodebuild -project "$PROJECT_NAME" \
           -scheme "$SCHEME_NAME" \
           -configuration "$CONFIG" \
           clean

# echo "Step-2, build as *.app ...... "
# xcodebuild -project "$PROJECT_NAME" \
#            -scheme "$SCHEME_NAME" \
#            -sdk "$SDK_NAME" \
#            -configuration "$CONFIG" \
#            -destination "$DES_PLATFORM" \
#            -derivedDataPath "$DERIVED_PATH" \
#            build
           
echo "Step-3, run test ...... "    
xcodebuild -project "$PROJECT_NAME" \
           -scheme "$SCHEME_NAME" \
           -sdk "$SDK_NAME" \
           -configuration "$CONFIG" \
           -destination "$DES_PLATFORM" \
           -derivedDataPath "$DERIVED_PATH" \
           test           

# echo "Step-4, export as *.ipa ...... "
# app_name_path="$APP_PATH"/${SCHEME_NAME}.app
# ipa_name_path="$APP_PATH"/${SCHEME_NAME}.ipa
# xcrun -sdk iphoneos PackageApplication -v $app_name_path -o $ipa_name_path

# echo "===== End ipa package ====="
