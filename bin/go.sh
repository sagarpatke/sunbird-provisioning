#!/bin/bash

set -e
cd $(dirname $0)

./generate-ssh-keys.sh
./generate-terraform-variables-file.sh
./provision.sh
./generate-hosts-file.sh
./copy-master-ssh-keys.sh
./create-devops-config-file.sh
./deploy-sunbird-prerequisites.sh # Stages 1-6
