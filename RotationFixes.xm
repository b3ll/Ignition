//
//  RotationFixes.xm
//  CarPlay Activator
//
//  Created by Adam Bell on 2014-11-28.
//  Copyright (c) 2014 Adam Bell. All rights reserved.
//

/*
    Far too many rotation inhibitors, need to figure out a nicer solution...
*/

%hook SBStarkIconContentView

- (void)setFrame:(CGRect)frame
{
    frame = carplay_frame;
    %orig(frame);
}

%end

%hook SBStarkNowPlayingWindow

- (void)addSubview:(UIView *)subview
{
    subview.frame = carplay_frame;
    %orig(subview);
}

%end

%hook AFUISiriView

- (void)setFrame:(CGRect)frame
{
    frame = CGRectMake(0, 0, carplay_frame.size.height, carplay_frame.size.width);
    %orig(frame);
}

- (CGRect)frame
{
    return CGRectMake(0, 0, carplay_frame.size.height, carplay_frame.size.width);
}

%end

%hook SBStarkIconController

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation {
    return (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight);
}

%end

%hook SBStarkStatusBarViewController

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation {
    return (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight);
}

%end

%hook SBStarkNowPlayingController

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation {
    return (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight);
}

%end

%hook SBStarkLockOutViewController

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation {
    return (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight);
}

%end

%hook SBStarkRelockUIViewController

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation {
    return (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight);
}

%end

%hook SBStarkNotificationViewController

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation {
    return (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight);
}

%end

%hook ABStarkContactViewController

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation {
    return (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight);
}

%end

%hook ABStarkContactsListViewController

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation {
    return (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight);
}

%end

/*
%hook FBWindowContextHostWrapperView

- (id)initWithHostManager:(id)arg1
{
    id original = %orig;

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

    %orig(alpha);
}

%end
*/
