//
//  PrivateHeaders.h
//  CarPlay Activator
//
//  Created by Adam Bell on 2014-11-28.
//  Copyright (c) 2014 Adam Bell. All rights reserved.
//

#ifndef __CARPLAY_PRIVATE_H
#define __CARPLAY_PRIVATE_H

#import <UIKit/UIKit.h>

static CGRect carplay_frame = CGRectZero;

static BOOL _carplay_active = NO;
static inline BOOL carplay_active() { return [[NSFileManager defaultManager] fileExistsAtPath:@"/Library/Preferences/.carplayuienforced"]; };

@interface UIScreen (carplay_hax)

- (BOOL)_isMainScreen;

@end

@interface FBSDisplay : NSObject

- (BOOL)isMainDisplay;

@end

@interface SBStarkScreenManager : NSObject

+ (instancetype)sharedInstance;

- (void)screenManager:(SBStarkScreenManager *)screenManager didTriggerConnectionHandlerEvent:(id)event forScreen:(UIScreen *)screen;

@end

@interface SBCarWindowLayoutStrategy : NSObject

+ (UIEdgeInsets)edgeInsetsForStatusBar;

@end

@interface MAAppDelegate : NSObject <UIApplicationDelegate>
@end

@interface SpringBoard : UIApplication
@end

@interface SBStarkIconContentView : UIView
@end

@interface SBStarkNowPlayingWindow : UIWindow
@end

@interface AFUISiriView : UIView
@end

@interface SBStarkIconController : UIViewController
@end

@interface SBStarkStatusBarViewController : UIViewController
@end

@interface SBStarkNowPlayingController : UIViewController
@end

@interface SBStarkLockOutViewController : UIViewController
@end

@interface SBStarkRelockUIViewController : UIViewController
@end

@interface SBStarkNotificationViewController : UIViewController
@end

@interface ABStarkContactViewController : UIViewController
@end

@interface ABStarkContactsListViewController : UIViewController
@end

#endif

