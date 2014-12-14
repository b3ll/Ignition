include /opt/theos/makefiles/common.mk

BUNDLE_NAME = IgnitionPreferences
CarPlayActivatorPreferences_FILES = IgnitionPreferences.mm
CarPlayActivatorPreferences_INSTALL_PATH = /Library/PreferenceBundles
CarPlayActivatorPreferences_FRAMEWORKS = UIKit
CarPlayActivatorPreferences_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/IgnitionPreferences.plist$(ECHO_END)
