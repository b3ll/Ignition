#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "FSSwitchState.h"

@interface FSSwitchPanel : NSObject

+ (FSSwitchPanel *)sharedPanel;

/**
 Returns a list of identifying all switches installed on the device.
 */
@property (nonatomic, readonly, copy) NSArray *switchIdentifiers;


/**
 Returns the localized title for a specific switch.
 */
- (NSString *)titleForSwitchIdentifier:(NSString *)switchIdentifier;


/**
 Returns a UIButton for a specific switch.
 The button automatically updates its style based on the user interaction and switch state changes, applies the standard action when pressed, and applies the alternate action when held.
 */
- (UIButton *)buttonForSwitchIdentifier:(NSString *)switchIdentifier usingTemplate:(NSBundle *)templateBundle;

- (UIImage *)imageOfSwitchState:(FSSwitchState)state controlState:(UIControlState)controlState forSwitchIdentifier:(NSString *)switchIdentifier usingTemplate:(NSBundle *)templateBundle;


/**
 Returns an image representing how a specific switch would look in a particular state when styled with the provided template.
 */
- (UIImage *)imageOfSwitchState:(FSSwitchState)state controlState:(UIControlState)controlState scale:(CGFloat)scale forSwitchIdentifier:(NSString *)switchIdentifier usingTemplate:(NSBundle *)templateBundle;


/**
 Returns the raw glyph identifier as retrieved from the backing FSSwitch instance.
 */
- (id)glyphImageDescriptorOfState:(FSSwitchState)switchState size:(CGFloat)size scale:(CGFloat)scale forSwitchIdentifier:(NSString *)switchIdentifier;


/**
 Returns the current state of a particualr switch.
 */
- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier;


/**
 Updates the state of a particular switch. If the switch accepts the change it will send a state change.
 */
- (void)setState:(FSSwitchState)state forSwitchIdentifier:(NSString *)switchIdentifier;


/**
 Applies the default action of a particular switch.
 */
- (void)applyActionForSwitchIdentifier:(NSString *)switchIdentifier;


/**
 Queries whether a switch supports an alternate action. This is often triggered by a hold gesture.
 */
- (BOOL)hasAlternateActionForSwitchIdentifier:(NSString *)switchIdentifier;


/**
 Apply the alternate action of a particular switch.
 */
- (void)applyAlternateActionForSwitchIdentifier:(NSString *)switchIdentifier;


/**
 Helper method to open a particular URL as if it were launched from an alternate action.
 */
- (void)openURLAsAlternateAction:(NSURL *)url;

@end

@protocol FSSwitchDataSource;

@interface FSSwitchPanel (SpringBoard)

/**
 Registers a switch implementation for a specific identifier. Bundlee in /Library/Switches will have their principal class automatically loaded.
 */
- (void)registerDataSource:(id<FSSwitchDataSource>)dataSource forSwitchIdentifier:(NSString *)switchIdentifier;

/**
 Unregisters a switch.
 */
- (void)unregisterSwitchIdentifier:(NSString *)switchIdentifier;

/**
 Informs the system when a switch changes its state. This will trigger any switch buttons to update their style.
 */
- (void)stateDidChangeForSwitchIdentifier:(NSString *)switchIdentifier;

@end

FOUNDATION_EXTERN NSString * const FSSwitchPanelSwitchesChangedNotification;

FOUNDATION_EXTERN NSString * const FSSwitchPanelSwitchStateChangedNotification;
FOUNDATION_EXTERN NSString * const FSSwitchPanelSwitchIdentifierKey;

FOUNDATION_EXTERN NSString * const FSSwitchPanelSwitchWillOpenURLNotification;
