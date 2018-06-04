#!/bin/bash

set -e
cd $(dirname $0)

ansible-playbook -e @../config -e "sunbird_master_host=`(cd ../terraform && terraform output sunbird_master_host)`" -e "sunbird_db_host=`(cd ../terraform && terraform output sunbird_db_host)`" -e "sunbird_auth_host=`(cd ../terraform && terraform output sunbird_auth_host)`" ../ansible/generate-hosts-file.yml
