#!/bin/sh

CURDIR="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)"

PROJECT_NAME="GoogleTestExample.xcodeproj"
SCHEME_NAME="iOSGTestApp"
CONFIG="Debug"

SDK_NAME="iphoneos"
DEST_SETTING="platform=iOS,id=88dda2712830c2020dfb4f09f08bfe512a1ab935"
DERIVED_PATH="output"
APP_PATH="$CURDIR"/"$DERIVED_PATH"/Build/Products/"$CONFIG"-iphoneos

# "Execute clean"
xctool -project "$PROJECT_NAME" \
       -scheme "$SCHEME_NAME" \
       clean

# "Execute build-tests"
xctool -project "$PROJECT_NAME" \
       -scheme "$SCHEME_NAME" \
       -sdk "$SDK_NAME" \
       -configuration "$CONFIG" \
       -derivedDataPath "$DERIVED_PATH" \
       -CODE_SIGN_IDENTITY="iPhone Developer: Bill Wu (P8488Y53R7)" \
       build-tests


# List ids and names of connected devices
ios-deploy -c

# deploy and debug your app to a connected device, uninstall the app first
ios-deploy --uninstall_only --bundle_id com.autodesk.iOSGTestApp
ios-deploy --uninstall_only --bundle_id com.apple.test.iOSGTestAppUITests-Runner

# #  deploy and launch your app to a connected device, but quit the debugger after
# ios-deploy --uninstall --bundle "$APP_PATH"/iOSGTestApp.app
# ios-deploy --uninstall --justlaunch --bundle "$APP_PATH"/iOSGTestAppUITests-Runner.app
ios-deploy --bundle "$APP_PATH"/iOSGTestApp.app
# ios-deploy --justlaunch --bundle "$APP_PATH"/iOSGTestAppUITests-Runner.app

# # Download your app's Documents, Library and tmp folders
# ios-deploy --bundle_id "com.apple.test.iOSGTestAppUITests-Runner" --download --to "$APP_PATH"/"log"