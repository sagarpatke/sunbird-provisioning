#!/bin/bash

set -e
cd $(dirname $0)

./generate-ssh-keys.sh
./generate-terraform-variables-file.sh
./provision.sh
./generate-hosts-file.sh
./copy-master-ssh-keys.sh
./create-devops-config-file.sh
./configure-ssl.sh
./deploy-sunbird-prerequisites.sh # Install until badger setup
./create-devops-config-file.sh # Create config again, to include Sunbird Auth Token, and Badger Token generated from previous script
./deploy-sunbird-core.sh

printf "\n\n\nSunbird is deployed."
printf "\n\nGive it about 5 minutes to start up completely, else you will see a page with HTTP Error 502, or sign-up will not work."
printf "\n\nIf you have provided domain_name and goDaddy credentials, then use the domain name to access sunbird. Otherwise, access sunbird using the URL: \nhttp://`(cd ../terraform && terraform output sunbird_master_host_public_dns)`\n"
