#import <BridgeKit/AndroidActivity.h>
#import <BridgeKit/AndroidContentResolver.h>
#import <BridgeKit/AndroidContext.h>
#import <BridgeKit/JavaString.h>

#import "SettingsSystemUtil.h"

// Note I recommend using the helper:
//   BOOL isRotationAllowed = [SettingsSystemUtil isAccelerometerRotationAllowed];

@interface SettingsSystemUtil()
// The bridged Java method requires an Android object to operate
// I recommend using the helper, further below
+ (NSString*)accelerometerRotationWithContentResolver:(AndroidContentResolver*)contentResolver;
@end


@implementation SettingsSystemUtil

+ (void)initializeJava
{
    // Note: this must be called for any class that registers custom
    // java apis, without this call the inheritance may not work as expected
    [super initializeJava];

    BOOL registerResult = NO;

    registerResult = [SettingsSystemUtil registerStaticMethod:@"getAccelerometerRotation"
                                                     selector:@selector(accelerometerRotationWithContentResolver:)
                                                  returnValue:[NSString className]
                                                    arguments:[AndroidContentResolver className], nil];

    if (registerResult != YES)
    {
        NSLog(@"Bridge registration failure detected, break in BridgeRegistrationFailure to debug");
    }
}

+ (NSString *)className
{
    return @"com.apportable.demo.SettingsSystemUtil";
}

+ (BOOL)isAccelerometerRotationAllowed
{
    // Need a ContentResolver to ask a question of Settings
    AndroidActivity *activity = [AndroidActivity currentActivity];
    AndroidContext *context = [activity applicationContext];
    AndroidContentResolver *contentResolver = [context contentResolver];

    // Ask the question
    NSString *result = [SettingsSystemUtil accelerometerRotationWithContentResolver:contentResolver];

    // Interpret the result
    BOOL isRotationAllowed = [result isEqualToString:@"1"];

    return isRotationAllowed;
}

@end
