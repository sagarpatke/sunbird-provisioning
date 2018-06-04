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
  -e "azure_storage_account_url=`(cd ../terraform && terraform output azure_storage_account_url)`" \
  -e "azure_storage_account_name=`(cd ../terraform && terraform output azure_storage_account_name)`" \
  -e "azure_storage_account_key=`(cd ../terraform && terraform output azure_storage_account_key)`" \
  -i ../ansible/hosts \
  --private-key=../keys/remote \
  ../ansible/create-devops-config-file.yml