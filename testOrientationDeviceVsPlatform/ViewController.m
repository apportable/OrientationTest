//
//  ViewController.m
//  testOrientationDeviceVsPlatform
//
//  Created by Nick Richards on 1/23/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

// Support free-rotation every few turns
// Test:
//  1. Lock rotation in device settings
//  2. Launch and rotate the application
//  3. Notice the application WILL ROTATE for a few turns, then it WILL NOT ROTATE for a few turns, ad infinitum


#if defined(APPORTABLE)
#import "SettingsSystemUtil.h"
#endif

#import "ViewController.h"

// E.g. Honor device rotation lock if count of rotation changes since launch modulo 10 is less than 5
static const NSInteger kRotateModX = 10;
static const NSInteger kRotateIfUnderY = 5;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown | UIInterfaceOrientationMaskLandscape;
}

// NOTE: Method not used by Apportable v1.1.24
-(BOOL)shouldAutorotate {
    return YES;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Configure application's desired interface orientation behavior here ...
    BOOL wantRotate = ( UIInterfaceOrientationIsPortrait( interfaceOrientation ) || UIInterfaceOrientationIsLandscape( interfaceOrientation) );

    // For RELEASE build, simply comment out the TESTING stuff below, and uncomment this:
    //   return isAllowed && wantRotate;

    // For TESTING, every few rotations respect the device's rotation-lock setting
    static int rotate_if_under = 0;
    BOOL ignoreRotationSettings = ++rotate_if_under % kRotateModX <= kRotateIfUnderY ? YES : NO;
    NSLog(@"Ignore device rotation settings? %d", ignoreRotationSettings);

    if (!ignoreRotationSettings)
    {
        BOOL isRotationAllowed = YES;

#if defined(APPORTABLE)
        NSLog(@"Checking device rotation lock settings ... ");
        isRotationAllowed = [SettingsSystemUtil isAccelerometerRotationAllowed];
        NSLog(@"Device results: isRotationAllowed(%d)", isRotationAllowed);
#endif

        // Conditionally respect device rotation lock setting
        NSLog(@"Actually rotate? %d", wantRotate && isRotationAllowed);
        return wantRotate && isRotationAllowed;
    }

    return wantRotate;
}


@end
