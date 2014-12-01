include /opt/theos/makefiles/common.mk

BUNDLE_NAME = CarPlayActivatorPreferences
CarPlayActivatorPreferences_FILES = CarPlayActivatorPreferences.mm
CarPlayActivatorPreferences_INSTALL_PATH = /Library/PreferenceBundles
CarPlayActivatorPreferences_FRAMEWORKS = UIKit
CarPlayActivatorPreferences_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/CarPlayActivatorPreferences.plist$(ECHO_END)
