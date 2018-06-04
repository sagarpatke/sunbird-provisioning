#!/bin/bash

set -e
cd $(dirname $0)

export ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook \
  -e @../config \
  -e "sunbird_master_host=`(cd ../terraform && terraform output sunbird_master_host)`" \
  -e "sunbird_db_host=`(cd ../terraform && terraform output sunbird_db_host)`" \
  -e "sunbird_auth_host=`(cd ../terraform && terraform output sunbird_auth_host)`" \
  -i ../ansible/hosts \
  --private-key=../keys/remote \
  ../ansible/copy-master-ssh-keys.yml
