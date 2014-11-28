//
//  PrivateHeaders.h
//  CarPlay Activator
//
//  Created by Adam Bell on 2014-11-28.
//  Copyright (c) 2014 Adam Bell. All rights reserved.
//

#import <UIKit/UIKit.h>

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
