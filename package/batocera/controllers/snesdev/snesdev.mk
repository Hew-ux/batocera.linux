################################################################################
#
# snesdev
#
################################################################################
# Version 1.0
# Released Sep 5, 2019
SNESDEV_VERSION = 4ab4be71e7a8586746f23e52a9d8d5dfa73ef2a4
SNESDEV_SITE = $(call github,axle-h,SNESDev-RPi,$(SNESDEV_VERSION))
SNESDEV_DEPENDENCIES = libconfuse-dev

# No dependencies because apparently this project's makefile makes them on its own (?)

#define SNESDEV_INSTALL_TARGET_CMDS
#endef

$(eval $(cmake-package))
