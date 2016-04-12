#!/bin/sh

CURDIR="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)"
echo "$CURDIR"

PROJECT_NAME="GoogleTestExample.xcodeproj"
SCHEME_NAME="iOSGTestApp"
CONFIG="Release"

# SDK_NAME="iphonesimulator9.2"
# DES_PLATFORM="platform=iOS Simulator,name=iPhone 6s"
SDK_NAME="$1"
DES_PLATFORM="platform=iOS Simulator,name=$2"

DERIVED_PATH="output"
# APP_PATH="$CURDIR"/$DERIVED_PATH/Build/Products/Release-iphonesimulator
APP_PATH="$CURDIR"/output-packages

# xcode-select -s /Applications/Xcode7.2.1.app/Contents/Developer

# # "Execute clean"
# xctool -project "$PROJECT_NAME" \
#        -scheme "$SCHEME_NAME" \
#        clean

# # "Execute build-tests"
# xctool -project "$PROJECT_NAME" \
#        -scheme "$SCHEME_NAME" \
#        -sdk "$SDK_NAME" \
#        -configuration "$CONFIG" \
#        -destination "$DES_PLATFORM" \
#        -derivedDataPath "$DERIVED_PATH" \
#        build-tests

# # "Execute run-tests with source code build"
# xctool -project "$PROJECT_NAME" \
#        -scheme "$SCHEME_NAME" \
#        -sdk "$SDK_NAME" \
#        -configuration "$CONFIG" \
#        -destination "$DES_PLATFORM" \
#        -derivedDataPath "$DERIVED_PATH" \
#        run-tests -freshSimulator

# "Run unit-tests standalone"
xctool -sdk "$SDK_NAME" \
       -configuration "$CONFIG" \
       -destination "$DES_PLATFORM" \
       run-tests -freshSimulator \
                 -appTest "$APP_PATH"/iOSGTestAppTests.xctest:"$APP_PATH"/iOSGTestApp.app/iOSGTestApp

"Run UI-tests standalone"
xctool -sdk "$SDK_NAME" \
       -configuration "$CONFIG" \
       -destination "$DES_PLATFORM" \
       run-tests -freshSimulator \
                 -appTest "$APP_PATH"/iOSGTestAppUITests.xctest:"$APP_PATH"/iOSGTestApp.app/iOSGTestApp

                 
# Run the command killall Simulator at end
killall Simulator && sleep 5               