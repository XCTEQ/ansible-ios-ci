#!/bin/sh

# Adapted from https://github.com/ayufan/travis-osx-vm-templates/tree/d398e1dd425e3936c02291fda844b987659c8b2c/scripts

set -eo pipefail

# create the placeholder file that's checked by CLI updates' .dist code
# in Apple's SUS catalog
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
# find the CLI Tools update
PROD=$(softwareupdate -l | grep "\*.*Command Line" | head -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n')
# install it
softwareupdate -i "$PROD" -v
