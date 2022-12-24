################################################################################
#
# snesdev
#
################################################################################
# Version 1.0
# Released Sep 5, 2019
SNESDEV_VERSION = c09df177b6a4e1716d2c84f5a8c7ed0c24a730d8
SNESDEV_SITE = $(call github,petrockblog,SNESDev-RPi,$(SNESDEV_VERSION))

# No dependencies because apparently this project's makefile makes them on its own (?)

#define SNESDEV_INSTALL_TARGET_CMDS
#endef

$(eval $(generic-package))
