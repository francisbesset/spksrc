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
    # Stop the package
    ${SSS} stop > /dev/null

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
    # Stop the package
    ${SSS} stop > /dev/null

    # create tmp dir
    rm -rf ${TMP_DIR}/${PACKAGE}
    mkdir -p ${TMP_DIR}/${PACKAGE}

    # move config file in tmp dir
    mv ${INSTALL_DIR}/etc/media-indexer ${TMP_DIR}/${PACKAGE}/media-indexer.conf

    exit 0
}

postupgrade ()
{
    # backup original config file
    mv ${INSTALL_DIR}/etc/media-indexer ${INSTALL_DIR}/etc/media-indexer.old

    # restore config file
    mv ${TMP_DIR}/${PACKAGE}/media-indexer.conf ${INSTALL_DIR}/etc/media-indexer

    # remove tmp dir
    rm -rf ${TMP_DIR}/${PACKAGE}

    exit 0
}
