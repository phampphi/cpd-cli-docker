#!/bin/sh

export PATH=$PATH:/home/bin
cpd-cli config users set cpd-admin --username ${CPD_API_USER} --apikey ${CPD_API_KEY}
cpd-cli config profiles set ${CPD_PROFILE} --user cpd-admin --url ${CPD_PROFILE_URL}

# This will exec the CMD from your Dockerfile
exec "$@"
