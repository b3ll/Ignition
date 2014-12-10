THEOS_DEVICE_IP = 192.168.0.14
THEOS_DEVICE_PORT = 22
GO_EASY_ON_ME = 1

ARCHS = armv7 armv7s arm64

TARGET = iphone:clang:latest:8.1

THEOS_BUILD_DIR = Packages

include theos/makefiles/common.mk

BUNDLE_NAME = CarPlayLauncher
CarPlayLauncher_CFLAGS = -fobjc-arc
CarPlayLauncher_FILES = CarPlayLauncherSwitch.x
CarPlayLauncher_FRAMEWORKS = Foundation UIKit
CarPlayLauncher_LDFLAGS = -weak_library libflipswitch.dylib
CarPlayLauncher_INSTALL_PATH = /Library/Switches

include $(THEOS_MAKE_PATH)/bundle.mk

after-install::
	install.exec "rm -rf /tmp/FlipswitchCache; killall -9 backboardd"
