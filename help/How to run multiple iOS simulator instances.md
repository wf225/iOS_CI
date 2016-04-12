By default, the iOS simulato is not allowed to run a second (or more) instance from XCode. However it has a workaround, this arctile will tell you how to run multiple iOS simulator via the command line.

### 1. Check Xcode configuration
Open file /Applications/Xcode.app/Contents/Developer/Applications/iOS Simulator.app/Contents/Info.plist, make sure "Application prohibits multiple instances" set to **NO**.

### 2. Open iOS simulator instance with “open -n” command.
`open -n "Simulator.app" --args -CurrentDeviceUDID <DEVICE UDID>`

If you specify different device UDID, then you can run multiple simulator instances.

Where you can figure out the UDID of the device you want to boot from:

`xcrun simctl list`

**NOTE**: In Xcode 6 and Xcode 7, Simulator.app is responsible for booting the device it uses. If you use simctl to boot the device, it will not be usable by Simulator.app in that state because it will be booted to a headless state.

`xcrun simctl boot "iPhone 6s"`

### TODO
* 1 Get the device's UDID according to the device name (e.g. Get UDID by "iPhone 6")

  `xcrun simctl list`
* 2 Get the simulator's process id according to the UDID.
  
  `ps -A | grep 'Simulator.app' | awk '{print $1}'`
* 3 Kill the process id by the specified UDID.

  `kill pid`
