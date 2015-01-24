Demonstration of bridging to Java from Objective-C to respect device orientation lock setting.

Use when adapting Objective-C applications for execution on Android when original application supports arbitrary orientation. 

Fetches "is screen rotation locked" value from android.provider.Settings.System. For demonstration purposes, every 5 or so turns it will honor the rotation setting, then for another 5 it won't.
