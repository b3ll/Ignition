//
//  AppFixes.xm
//  CarPlay Activator
//
//  Created by Adam Bell on 2014-12-12.
//  Copyright (c) 2014 Adam Bell. All rights reserved.
//

#include <xctheos.h>

#include "PrivateHeaders.h"

GROUP(APP_FIXES)

#pragma mark - Music App
HOOK(MAAppDelegate)

- (void)_attachToStarkScreen:(UIScreen *)screen
{
  ORIG([UIScreen mainScreen]);
}

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
  ORIG();
  
  // Remove native App window, since CarPlay one renders underneath it.
  self.window.hidden = YES;
  self.window = nil;
}

END()

#pragma mark - Phone App
HOOK(MobilePhoneApplication)

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
  ORIG();
  
  [[GET_CLASS(PHStarkManager) sharedStarkManager] attachStarkToScreen:[UIScreen mainScreen]];
  
  // Remove native App window, since CarPlay one renders underneath it.
  // -window exists in the header, but not actually when the app is running... wtf?
  UIWindow *window = [self valueForKey:@"_window"];
  window.hidden = YES;
  [self setValue:nil forKey:@"_window"];
}

- (NSUInteger)supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
  return UIInterfaceOrientationMaskLandscape;
}

END()

#pragma mark - SMS App
HOOK(SMSApplication)

- (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  ORIG();
  
  [[GET_CLASS(CKStarkManager) sharedInstance] attachStarkToScreen:[UIScreen mainScreen]];
  
  // Remove native App window, since CarPlay one renders underneath it.
  // -window exists in the header, but not actually when the app is running... wtf?
  UIWindow *window = [self valueForKey:@"_window"];
  window.hidden = YES;
  [self setValue:nil forKey:@"_window"];
}

END()

#pragma mark - Spotify
HOOK(MessageBarController)

// nop this method because it causes Spotify to crash on iPad when in CarPlay mode.
- (void)setContentViewController:(UIViewController *)viewController animation:(BOOL)b completion:(id)c
{
  return;
}

END()

END_GROUP()
