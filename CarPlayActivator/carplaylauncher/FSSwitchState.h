#import <Foundation/Foundation.h>

typedef enum {
	FSSwitchStateOff = 0,
	FSSwitchStateOn = 1,
	FSSwitchStateIndeterminate = -1
} FSSwitchState;

FOUNDATION_EXTERN NSString *NSStringFromFSSwitchState(FSSwitchState state);

FOUNDATION_EXTERN FSSwitchState FSSwitchStateFromNSString(NSString *stateString);
