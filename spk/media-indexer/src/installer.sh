#!/bin/sh

# Package
PACKAGE="media-indexer"
DNAME="Media Indexer"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"
SSS="/var/packages/${PACKAGE}/scripts/start-stop-status"
TMP_DIR="${SYNOPKG_PKGDEST}/../../@tmp"

preinst ()
{
    exit 0
}

postinst ()
{
    # Link
    ln -s ${SYNOPKG_PKGDEST} ${INSTALL_DIR}

    echo -e "WATCH_DIRECTORIES=\"${wizard_watch_directories:=/volume1/video:/volume1/music:/volume1/photo}\"" \
            "\nPID_FILE=\"${INSTALL_DIR}/var/media-indexer.pid\"" \
            "\nFIFO_FILE=\"${INSTALL_DIR}/var/media-indexer.fifo\"" \
            "\n#LOG_FILE=\"${INSTALL_DIR}/var/media-indexer.log\"" \
            > ${INSTALL_DIR}/etc/media-indexer

    exit 0
}

preuninst ()
{
    exit 0
}

postuninst ()
{
    # Remove link
    rm -f ${INSTALL_DIR}

    exit 0
}

preupgrade ()
{
    exit 0
}

postupgrade ()
{
    exit 0
}
