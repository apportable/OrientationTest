#import <BridgeKit/JavaObject.h>

@interface SettingsSystemUtil : JavaObject
// Corresponds to the device's "Rotation Lock" setting
+ (BOOL)isAccelerometerRotationAllowed;
@end
