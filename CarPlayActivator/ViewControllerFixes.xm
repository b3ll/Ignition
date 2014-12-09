//
//  ViewControllerFixes.xm
//  CarPlay Activator
//
//  Created by Adam Bell on 2014-11-28.
//  Copyright (c) 2014 Adam Bell. All rights reserved.
//

/*
 Far too many rotation inhibitors, need to figure out a nicer solution...
 */

#include <xctheos.h>

#include "PrivateHeaders.h"

GROUP(VIEWCONTROLLER_FIXES);

HOOK(SBStarkIconContentView)

- (void)setFrame:(CGRect)frame
{
  frame = carplay_frame;
  ORIG(frame);
}

END()

HOOK(SBStarkNowPlayingWindow)

- (void)addSubview:(UIView *)subview
{
  subview.frame = carplay_frame;
  ORIG(subview);
}

END()

HOOK(AFUISiriView)

- (void)setFrame:(CGRect)frame
{
  frame = CGRectMake(0.0, 0.0, carplay_frame.size.height, carplay_frame.size.width);
  ORIG(frame);
}

- (CGRect)frame
{
  return CGRectMake(0.0, 0.0, carplay_frame.size.height, carplay_frame.size.width);
}

END()

// Since UIKit apps have a secondary window on an external screen when in CarPlay mode, we need to hide the context hosting view for the main app window (since the CarPlay one is displayed underneath).
HOOK(FBWindowContextHostWrapperView)

- (id)initWithHostManager:(id)manager
{
  id original = ORIG();
  
  [self setAlpha:1.0];
  
  return original;
}

- (void)setAlpha:(CGFloat)alpha
{
  id manager = [self manager];
  NSString *identifier = [manager identifier];
  LSApplicationProxy *proxy = [GET_CLASS(LSApplicationProxy) applicationProxyForIdentifier:identifier];
  NSDictionary *entitlements = [proxy entitlements];
  
  if (entitlements[@"com.apple.developer.playable-content"]) {
    alpha = 0.0;
  }
  
  ORIG(alpha);
}

END()

// Force ALL required view controllers to be landscape.
#define FIX_VIEW_CONTROLLER(viewcontroller_class)\
HOOK(viewcontroller_class) \
\
- (NSUInteger)supportedInterfaceOrientations\
{\
return UIInterfaceOrientationMaskLandscape;\
}\
\
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation\
{\
  return (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight);\
}\
\
END()

FIX_VIEW_CONTROLLER(AFUISiriViewController)

FIX_VIEW_CONTROLLER(AFUISiriRemoteViewController)

FIX_VIEW_CONTROLLER(SBStarkIconController)

FIX_VIEW_CONTROLLER(SBStarkStatusBarViewController)

FIX_VIEW_CONTROLLER(SBStarkNowPlayingController)

FIX_VIEW_CONTROLLER(SBStarkLockOutViewController)

FIX_VIEW_CONTROLLER(SBStarkRelockUIViewController)

FIX_VIEW_CONTROLLER(SBStarkNotificationViewController)

FIX_VIEW_CONTROLLER(ABStarkContactViewController)

FIX_VIEW_CONTROLLER(ABStarkContactsListViewController)

FIX_VIEW_CONTROLLER(MCDBrowserViewController)

FIX_VIEW_CONTROLLER(PHStarkRootContainerViewController)

FIX_VIEW_CONTROLLER(PHStarkMainMenuContainerViewController)

FIX_VIEW_CONTROLLER(DialerController)

END_GROUP()
