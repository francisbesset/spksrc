SPK_NAME = inotify-tools
SPK_VERS = 3.14
SPK_REV = 2
SPK_ICON = src/$(SPK_NAME).png

DEPENDS = cross/$(SPK_NAME)

MAINTAINER = Radu Voicilas
MAINTAINER_URL = https://github.com/rvoicilas
DISTRIBUTOR = Francis Besset
DISTRIBUTOR_URL = http://francis-besset.com

DESCRIPTION = inotify-tools is a C library and a set of command-line programs for Linux providing a simple interface to inotify.
DESCRIPTION_FRE = inotify-tools est une librairie C et un ensemble de programmes en ligne de commande pour Linux fournissant une interface simple à inotify.
RELOAD_UI = no
DISPLAY_NAME = inotify-tools
STARTABLE = no

BETA = 1

HOMEPAGE = https://github.com/rvoicilas/inotify-tools/wiki
LICENSE_FILE = LICENSE

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT       = src/dsm-control.sh
ADDITIONAL_SCRIPTS =

INSTALL_PREFIX = /usr/local/$(SPK_NAME)

include ../../mk/spksrc.spk.mk
