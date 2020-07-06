THEOS_DEVICE_IP = 192.168.0.13

ARCHS = arm64 arm64e
debug = 0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = PMP
PMP_FILES = Tweak.x
PMP_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
after-install::
	install.exec "sbreload"
SUBPROJECTS += PMPPrefs
include $(THEOS_MAKE_PATH)/aggregate.mk
