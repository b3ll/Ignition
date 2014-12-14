//
//  main.m
//  IgnitionLauncher
//
//  Created by Adam Bell on 12/6/14.
//  Copyright (c) 2014 Adam Bell. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <PrivateHeaders.h>

int main(int argc, char * argv[]) {
  @autoreleasepool {
    NSFileManager *fileManager = [NSFileManager defaultManager];

    if ([fileManager fileExistsAtPath:CARPLAY_ACTIVE_FILE_PATH]) {
      // Disable CarPlay
      NSError *error;
      [fileManager removeItemAtPath:CARPLAY_ACTIVE_FILE_PATH error:&error];
      if (error) {
        NSLog(@"CARPLAY_ACTIVATOR_ERROR: %@", error);
      }
    } else {
      BOOL enabledCarPlay = [fileManager createFileAtPath:CARPLAY_ACTIVE_FILE_PATH contents:[@"canhaz?" dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
      if (!enabledCarPlay) {
        NSLog(@"CARPLAY_ACTIVATOR_ERROR: Unable to create CarPlay Activator file.");
      }
    }

    return system("killall backboardd");
  }
}
