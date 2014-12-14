#import <Preferences/Preferences.h>

@interface IgnitionPreferencesListController: PSListController
@end

@implementation IgnitionPreferencesListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"IgnitionPreferences" target:self];
	}
  
	return _specifiers;
}

@end
