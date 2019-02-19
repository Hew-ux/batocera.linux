#!/usr/bin/env python

import sys
import os
import io
import recalboxFiles
import settings
from Emulator import Emulator
from settings.unixSettings import UnixSettings
import ConfigParser

def writePPSSPPConfig(system):
    iniConfig = ConfigParser.ConfigParser()
    # To prevent ConfigParser from converting to lower case
    iniConfig.optionxform = str
    if os.path.exists(recalboxFiles.ppssppConfig):
        with io.open(recalboxFiles.ppssppConfig, 'r', encoding='utf_8_sig') as fp:
            iniConfig.readfp(fp)

    createPPSSPPConfig(iniConfig, system)
    # save the ini file
    if not os.path.exists(os.path.dirname(recalboxFiles.ppssppConfig)):
        os.makedirs(os.path.dirname(recalboxFiles.ppssppConfig))
    with open(recalboxFiles.ppssppConfig, 'w') as configfile:
        iniConfig.write(configfile)

def createPPSSPPConfig(iniConfig, system):
    if not iniConfig.has_section("Graphics"):
        iniConfig.add_section("Graphics")

    # Display FPS
    if system.isOptSet('showFPS') and system.getOptBoolean('showFPS') == True:
        iniConfig.set("Graphics", "ShowFPSCounter", "3") # 1 for Speed%, 2 for FPS, 3 for both
    else:
        iniConfig.set("Graphics", "ShowFPSCounter", "0")

    # Performances
    if system.isOptSet('frameskip') and system.getOptBoolean('frameskip') == True:
        iniConfig.set("Graphics", "FrameSkip",  "1")
    else:
        iniConfig.set("Graphics", "FrameSkip", "0")

    if system.isOptSet('frameskiptype'):
        iniConfig.set("Graphics", "FrameSkipType", system.config["frameskiptype"])
    else:
        iniConfig.set("Graphics", "FrameSkipType",  "0")

    if system.isOptSet('internalresolution'):
        iniConfig.set("Graphics", "InternalResolution", system.config["internalresolution"])
    else:
        iniConfig.set("Graphics", "InternalResolution", "1")
