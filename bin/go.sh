#!/bin/bash

set -e
cd $(dirname $0)

./generate-ssh-keys.sh
./generate-terraform-variables-file.sh
./provision.sh
./generate-hosts-file.sh
./copy-master-ssh-keys.sh
./create-devops-config-file.sh
./deploy-sunbird-prerequisites.sh # Install until badger setup
./create-devops-config-file.sh # Create config again, to include Sunbird Auth Token, and Badger Token generated from previous script
./deploy-sunbird-core.sh
