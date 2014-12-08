THEOS_DEVICE_IP = 192.168.0.14
THEOS_DEVICE_PORT = 22
GO_EASY_ON_ME = 1

TARGET = iphone:clang:latest:8.1
ARCHS = armv7 armv7s arm64

include /opt/theos/makefiles/common.mk

TWEAK_NAME = CarPlayActivator
CarPlayActivator_CFLAGS = -fobjc-arc -DUSE_THEOS -IXcode-Theos/
CarPlayActivator_FILES = Tweak.xmi
CarPlayActivator_FRAMEWORKS = Foundation CoreGraphics UIKit
CarPlayActivator_LIBRARIES = substrate

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += CarPlayActivatorPreferences
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 backboardd"
