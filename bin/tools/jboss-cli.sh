#!/bin/bash
export JAVA_OPTS="-Djboss.management.client_socket_bind_address=$OPENSHIFT_AEROGEAR_PUSH_IP"
$OPENSHIFT_AEROGEAR_PUSH_DIR/bin/jboss-cli.sh "$@"
