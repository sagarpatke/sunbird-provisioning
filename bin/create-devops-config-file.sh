#!/bin/bash

set -e
cd $(dirname $0)

ansible-playbook \
  -e @../config \
  -e "sunbird_master_host=`(cd ../terraform && terraform output sunbird_master_host)`" \
  -e "sunbird_db_host=`(cd ../terraform && terraform output sunbird_db_host)`" \
  -e "sunbird_auth_host=`(cd ../terraform && terraform output sunbird_auth_host)`" \
  -e "azure_storage_account_url=`(cd ../terraform && terraform output azure_storage_account_url)`" \
  -e "azure_storage_account_name=`(cd ../terraform && terraform output azure_storage_account_name)`" \
  -e "azure_storage_account_key=`(cd ../terraform && terraform output azure_storage_account_key)`" \
  ../ansible/create-devops-config-file.yml