#!/bin/bash
export JAVA_OPTS="-Djboss.management.client_socket_bind_address=$OPENSHIFT_WILDFLY_IP"
$OPENSHIFT_WILDFLY_DIR/bin/jboss-cli.sh "$@"
