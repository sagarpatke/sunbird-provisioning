#!/bin/bash

set -e
cd $(dirname $0)

ansible-playbook \
  -e @../config \
  -e "sunbird_master_host_public_dns=`(cd ../terraform && terraform output sunbird_master_host_public_dns)`" \
  -e "sunbird_master_host_private_ip=`(cd ../terraform && terraform output sunbird_master_host_private_ip)`" \
  -e "sunbird_db_host_public_dns=`(cd ../terraform && terraform output sunbird_db_host_public_dns)`" \
  -e "sunbird_db_host_private_ip=`(cd ../terraform && terraform output sunbird_db_host_private_ip)`" \
  -e "sunbird_auth_host_public_dns=`(cd ../terraform && terraform output sunbird_auth_host_public_dns)`" \
  -e "sunbird_auth_host_private_ip=`(cd ../terraform && terraform output sunbird_auth_host_private_ip)`" \
  ../ansible/generate-hosts-file.yml
