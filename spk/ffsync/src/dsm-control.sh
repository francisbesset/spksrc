#!/bin/sh

# Package
PACKAGE="ffsync"
DNAME="Firefox Sync Server 1.5"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"
PATH="${INSTALL_DIR}/env/bin:${INSTALL_DIR}/bin:${PYTHON_DIR}/bin:${PATH}"
USER="ffsync"
PSERVE="${INSTALL_DIR}/env/bin/pserve"

INI_FILE="${INSTALL_DIR}/var/ffsync.ini"
PID_FILE="${INSTALL_DIR}/var/ffsync.pid"
LOG_FILE="${INSTALL_DIR}/var/pserve.log"

start_daemon ()
{
    ${PSERVE} ${INI_FILE} --user=${USER} --daemon --pid-file=${PID_FILE} --log-file=${LOG_FILE}
}

stop_daemon ()
{
    ${PSERVE} ${INI_FILE} --stop-daemon --pid-file=${PID_FILE} --log-file=${LOG_FILE}
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
            exit $?
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
        echo ${LOG_FILE}
        ;;
    *)
        exit 1
        ;;
esac
