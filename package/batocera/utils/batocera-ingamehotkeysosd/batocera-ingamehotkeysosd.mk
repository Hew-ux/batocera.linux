################################################################################
#
# batocera-ingamehotkeysosd
#
################################################################################

BATOCERA_INGAMEHOTKEYSOSD_VERSION = 1.0
BATOCERA_INGAMEHOTKEYSOSD_LICENSE = GPLv3

define BATOCERA_INGAMEHOTKEYSOSD_INSTALL
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/pygame/ingamehotkeys
	$(INSTALL) -D -m 0755 $(@D)/ingamehotkeys.pygame $(TARGET_DIR)/usr/share/batocera/datainit/roms/pygame/ingamehotkeys/
	$(INSTALL) -D -m 0644 $(@D)/ingame-hotkeys.png $(TARGET_DIR)/usr/share/batocera/datainit/roms/pygame/ingamehotkeys/
	# create an alias for pygame to be able to kill it with killall and evmapy
	(cd $(TARGET_DIR)/usr/bin && ln -sf python pygame)
endef

$(eval $(generic-package))
