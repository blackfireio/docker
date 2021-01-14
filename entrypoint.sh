#!/bin/sh

# Since the version 2 of the blackfire CLI, the default port has been changed from 8707 to 8307.
# To ease the migration, we create a tunnel from the old port to the new one if the user lets the
# default configuration and didn't set the BLACKFIRE_DISABLE_LEGACY_PORT environment variable.
if [ "${BLACKFIRE_SOCKET}" == "tcp://0.0.0.0:8307" ] && [ -z "${BLACKFIRE_DISABLE_LEGACY_PORT}" ] ; then
    echo "Starting the port forwarder between port 8707 to 8307."
    echo "Please ensure you use the new port (8307)."
    echo "If you are not using the legacy port (8707), you can ignore this message."
    echo "To get rid of this message, you must set a non-null value to the BLACKFIRE_DISABLE_LEGACY_PORT environment variable"
    socat tcp-listen:8707,reuseaddr,fork tcp:localhost:8307 >/dev/null 2>&1 &
fi

exec "$@"
