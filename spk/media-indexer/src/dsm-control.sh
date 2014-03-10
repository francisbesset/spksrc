#!/bin/sh

# Package
PACKAGE="media-indexer"
DNAME="Media Indexer"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"
PATH="${INSTALL_DIR}/bin:/usr/local/bin:/bin:/usr/bin:/usr/syno/bin:/usr/local/sbin"

source "${INSTALL_DIR}/etc/media-indexer"

start_daemon ()
{
    if [ -n "${LOG_FILE}" ] ; then
        log_arg="-l "${LOG_FILE}""
    fi

    ${INSTALL_DIR}/bin/media-indexer -p "${PID_FILE}" -f "${FIFO_FILE}" ${log_arg} "${WATCH_DIRECTORIES}"
}

stop_daemon ()
{
    kill `cat ${PID_FILE}`
    wait_for_status 1 20 || kill -9 `cat ${PID_FILE}`
    rm -f ${PID_FILE}
}

daemon_status ()
{
    if [ -f ${PID_FILE} ] && kill -0 `cat ${PID_FILE}` > /dev/null 2>&1; then
        return
    fi
    rm -f ${PID_FILE}
    return 1
}

wait_for_status ()
{
    counter=$2
    while [ ${counter} -gt 0 ]; do
        daemon_status
        [ $? -eq $1 ] && return
        let counter=counter-1
        sleep 1
    done
    return 1
}


case $1 in
    start)
        if daemon_status; then
            echo ${DNAME} is already running
            exit 0
        else
            echo Starting ${DNAME} ...
            start_daemon
            exit 0
        fi
        ;;
    stop)
        if daemon_status; then
            echo Stopping ${DNAME} ...
            stop_daemon
            exit $?
        else
            echo ${DNAME} is not running
            exit 0
        fi
        ;;
    status)
        if daemon_status; then
            echo ${DNAME} is running
            exit 0
        else
            echo ${DNAME} is not running
            exit 1
        fi
        ;;
    log)
        if [ -z "${LOG_FILE}" ] ; then
            exit 1
        fi

        echo "${LOG_FILE}"
        exit 0
        ;;
    *)
        exit 1
        ;;
esac
