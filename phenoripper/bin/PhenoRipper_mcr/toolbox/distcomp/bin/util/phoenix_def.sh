#!/bin/sh

# Copyright 2004-2012 The MathWorks, Inc.

#-----------------------------------------------------------------------------
# Define some general variables about phoenix
#-----------------------------------------------------------------------------
BINBASE="$MDCEBASE/bin/$ARCH"
APPNAME="mdced"
APP_LONG_NAME="MATLAB Distributed Computing Server"
# Don't change this else we will specifically need to remove it in the stop
# command
PIDFILE="$PIDBASE/$APPNAME.pid"
LOCKFILE="$LOCKBASE/$APPNAME"

# Wrapper
WRAPPER_CMD="$BINBASE/$APPNAME"
WRAPPER_CONF="$CONFIGBASE/wrapper-phoenix.config"
MDCE_PLATFORM_WRAPPER_CONF="$CONFIGBASE/wrapper-phoenix-$ARCH.config"

# The actual command needed to run MATLAB
MATLAB_EXECUTABLE=$MATBASE/bin/$ARCH/MATLAB

#-----------------------------------------------------------------------------
# Export the variables that are REQUIRED by the wrapper-phoenix.config
# file. These variables must be set correctly for the wrapper layer to
# work correctly.
#-----------------------------------------------------------------------------
export JRECMD_FOR_MDCS
export JREFLAGS

export JREBASE
export MATBASE
export JARBASE
export JAREXTBASE
export JINILIB

export MDCE_DEFFILE
export MDCEBASE
export LOGBASE
export CHECKPOINTBASE

export HOSTNAME
export ARCH

export WORKER_START_TIMEOUT

export MATLAB_EXECUTABLE

export JOB_MANAGER_MAXIMUM_MEMORY
export MDCEQE_JOBMANAGER_DEBUG_PORT
export CONFIGBASE

export DEFAULT_JOB_MANAGER_NAME
export DEFAULT_WORKER_NAME

export JOB_MANAGER_HOST
export BASE_PORT

export LOG_LEVEL

export MDCE_PLATFORM_WRAPPER_CONF

export WORKER_DOMAIN
export SECURITY_LEVEL
export USE_SECURE_COMMUNICATION
export TRUSTED_CLIENTS
export SHARED_SECRET_FILE
export SECURITY_DIR
export DEFAULT_KEYSTORE_PATH
export KEYSTORE_PASSWORD
export MDCE_ALLOW_GLOBAL_PASSWORDLESS_LOGON
export ALLOW_CLIENT_PASSWORD_CACHE
export ADMIN_USER
export ALLOWED_USERS

export RELEASE_LICENSE_WHEN_IDLE

export MDCS_ALL_SERVER_SOCKETS_IN_CLUSTER
export MDCS_JOBMANAGER_PEERSESSION_PORT
export MDCS_WORKER_MATLABPOOL_MIN_PORT
export MDCS_WORKER_MATLABPOOL_MAX_PORT

export MDCS_LIFECYCLE_REPORTER
export MDCS_LIFECYCLE_WORKER_HEARTBEAT
export MDCS_LIFECYCLE_TASK_HEARTBEAT

export MDCS_PEER_LOOKUP_SERVICE_ENABLED
export MDCS_PEER_LOOKUP_SERVICE_PORT

export MDCS_ADDITIONAL_CLASSPATH

export MDCS_REQUIRE_WEB_LICENSING
