#!/bin/bash

unenv() {
   unset DB_HOST
   unset DB_PORT
   unset DB_USER
   unset DB_PASSWORD
   unset DB_NAME
}

set_env() {
    export DB_HOST="localhost"
    export DB_PORT="5432"
    export DB_USER="root"
    export DB_PASSWORD="root"
    export DB_NAME="root"

    echo "Setting env $HOST"
}

unenv
set_env
