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

HOOK(AFUISiriViewController)

- (NSUInteger)supportedInterfaceOrientations
{
  return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation {
  return (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight);
}

END()

HOOK(AFUISiriRemoteViewController)

- (NSUInteger)supportedInterfaceOrientations
{
  return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation
{
  return (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight);
}

END()

HOOK(SBStarkIconController)

- (NSUInteger)supportedInterfaceOrientations
{
  return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation
{
  return (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight);
}

END()

HOOK(SBStarkStatusBarViewController)

- (NSUInteger)supportedInterfaceOrientations
{
  return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation
{
  return (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight);
}

END()

HOOK(SBStarkNowPlayingController)

- (NSUInteger)supportedInterfaceOrientations
{
  return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation
{
  return (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight);
}

END()

HOOK(SBStarkLockOutViewController)

- (NSUInteger)supportedInterfaceOrientations
{
  return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation
{
  return (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight);
}

END()

HOOK(SBStarkRelockUIViewController)

- (NSUInteger)supportedInterfaceOrientations
{
  return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation
{
  return (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight);
}

END()

HOOK(SBStarkNotificationViewController)

- (NSUInteger)supportedInterfaceOrientations
{
  return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation
{
  return (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight);
}

END()

HOOK(ABStarkContactViewController)

- (NSUInteger)supportedInterfaceOrientations
{
  return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation
{
  return (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight);
}

END()

HOOK(ABStarkContactsListViewController)

- (NSUInteger)supportedInterfaceOrientations
{
  return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation
{
  return (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight);
}

END()

END_GROUP()

/*
 %hook FBWindowContextHostWrapperView

 - (id)initWithHostManager:(id)arg1
 {
 id original = ORIG();

 if (CARPLAY_ACTIVE) {
 if ([[arg1 identifier] rangeOfString:@"spotify"].location != NSNotFound && carplay_active) {
 [original setAlpha:0.0];
 }
 }

 return original;
 }

 - (void)setAlpha:(CGFloat)alpha
 {
 if (CARPLAY_ACTIVE) {
 id manager = [self manager];
 NSString *identifier = [manager identifier];

 if ([identifier rangeOfString:@"spotify"].location != NSNotFound && carplay_active) {
 alpha = 0.0;
 }
 }

 ORIG(alpha);
 }

 %end
 */
