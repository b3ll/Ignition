//
//  CarPlayLauncherSwitch.x
//  CarPlayLauncher
//
//  Created by Pigi Galdi on 08.12.2014.
//  Copyright (c) 2014 Pigi Galdi. All rights reserved.
//

#import "CarPlayLauncherSwitch.h"

static BOOL _isCarPlayActive (void) {
	// Check if file exist at path.
	NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:CARPLAY_ACTIVE_FILE_PATH])
      	return YES;
    else
      	return NO;
}

static void _removeFile (void) {
	// Disable CarPlay removing file.
	NSFileManager *fileManager = [NSFileManager defaultManager];
	[fileManager removeItemAtPath:CARPLAY_ACTIVE_FILE_PATH error:nil];
}

static void _createFile (void) {
	// Enable CarPlay creating file.
	NSFileManager *fileManager = [NSFileManager defaultManager];
	[fileManager createFileAtPath:CARPLAY_ACTIVE_FILE_PATH contents:[@"canhaz?" dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
}

static void _killallBackboardd (void) {
	// Kill backboardd to get changes.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3.f * NSEC_PER_SEC), dispatch_get_main_queue(),^{
        system("killall -9 backboardd");
    });
}

@implementation CarPlayLauncherSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier {
	return _isCarPlayActive() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
    switch (newState) {
        case FSSwitchStateIndeterminate:
            return;
        case FSSwitchStateOn:
        	// Remove file.
            _createFile();
            _killallBackboardd();
            break;
        case FSSwitchStateOff:
            // Create file.
            _removeFile();
            _killallBackboardd();
            break;
    }
}

@end