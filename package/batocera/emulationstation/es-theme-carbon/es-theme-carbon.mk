################################################################################
#
# EmulationStation theme "Carbon"
#
################################################################################
# Version.: Commits on Sep 04, 2019
ES_THEME_CARBON_VERSION = ec9f636a2d44b79f55eea4af2ac02ebdf8aab01f
ES_THEME_CARBON_SITE = $(call github,fabricecaruso,es-theme-carbon,$(ES_THEME_CARBON_VERSION))

define ES_THEME_CARBON_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
    cp -r $(@D)/* $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
    
    cp -r package/batocera/emulationstation/es-theme-carbon/theme/* \
        $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
endef

$(eval $(generic-package))
