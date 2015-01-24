Demonstration of bridging to Java from Objective-C to respect device orientation lock setting via Apportable Android

## Details

Use when adapting Objective-C applications for execution on Android especially when original Objective-C application supports arbitrary orientation. 

Fetches "is screen rotation locked" value from android.provider.Settings.System. For demonstration purposes, every 5 or so turns it will honor the rotation setting, then for another 5 it won't.

* [SettingsSystemUtil.java](java/src/com/apportable/demo/SettingsSystemUtil.java) - Java code to be exposed
* [SettingsSystemUtil.m](testOrientationDeviceVsPlatform/SettingsSystemUtil.m) - Objective-C code exposing Java code via helper [`+[SettingsSystemUtil isAccelerometerRotationAllowed]`](testOrientationDeviceVsPlatform/SettingsSystemUtil.m#L46)
* [configuration.json](testOrientationDeviceVsPlatform.approj/configuration.json) - build integration of `SettingsSystemUtil` Java and Objective-C source files
*  [`-[ViewController shouldAutorotateToInterfaceOrientation]`](testOrientationDeviceVsPlatform/ViewController.m#L51) - usage demonstration of conditionally honoring and not honoring the device's rotation lock setting

## Requirements

* [Apportable Platform](http://www.apportable.com) - tested on v1.1.24
