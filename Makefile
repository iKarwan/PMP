THEOS_DEVICE_IP = localhost

ARCHS = arm64 arm64e
debug = 0

INSTALL_TARGET_PROCESSES =  MobileSlideShow Preferences

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = PMP
PMP_FILES = Tweak.x
PMP_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
#after-install::
#	install.exec "sbreload"
SUBPROJECTS += PMPPrefs
include $(THEOS_MAKE_PATH)/aggregate.mk
