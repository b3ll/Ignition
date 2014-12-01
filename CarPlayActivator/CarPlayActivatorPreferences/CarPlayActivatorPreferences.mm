#import <Preferences/Preferences.h>

@interface CarPlayActivatorPreferencesListController: PSListController
@end

@implementation CarPlayActivatorPreferencesListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"CarPlayActivatorPreferences" target:self];
	}
  
	return _specifiers;
}

@end
