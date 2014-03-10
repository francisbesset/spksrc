SPK_NAME = media-indexer
SPK_VERS = 1.1.0
SPK_REV = 1
SPK_ICON = src/$(SPK_NAME).png

DEPENDS =
SPK_DEPENDS = "inotify-tools>=3.14-1"

MAINTAINER = Francis Besset
MAINTAINER_URL = http://francis-besset.com
DISTRIBUTOR = Francis Besset
DISTRIBUTOR_URL = http://francis-besset.com

DESCRIPTION = Media Indexer instantly index new files for viewing on sharing UPnP. The graphical user interface is not available, but you can edit the configuration with a text editor: /var/packages/media-indexer/target/etc/media-indexer
DESCRIPTION_FRE = Media Indexer indexe instantanement les nouveaux fichiers pour les visualiser en partage UPnP. L\\\'interface utilisateur n\\\'est pas disponible, mais vous pouvez éditer le fichier de configuration avec un éditeur de texte : /var/packages/media-indexer/target/etc/media-indexer
RELOAD_UI = yes
DISPLAY_NAME = Media Indexer
BETA = 1

HOMEPAGE = https://github.com/francisbesset/spksrc
LICENSE_FILE = LICENSE

WIZARDS_DIR = src/wizard/

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT       = src/dsm-control.sh
ADDITIONAL_SCRIPTS =

INSTALL_PREFIX = /usr/local/$(SPK_NAME)

COPY_TARGET = nop
POST_STRIP_TARGET = media-indexer_extra_install

# Pure Bash package, make sure ARCH is not defined
override ARCH=

include ../../mk/spksrc.spk.mk

.PHONY: media-indexer_extra_install
media-indexer_extra_install:
	install -m 755 -d $(STAGING_DIR)/bin
	install -m 755 -d $(STAGING_DIR)/etc
	install -m 755 -d $(STAGING_DIR)/var
	install -m 755 src/bin/media-indexer $(STAGING_DIR)/bin/media-indexer
