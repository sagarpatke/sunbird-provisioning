#!/bin/bash

set -e
cd $(dirname $0)

rm -vf ../ansible/hosts
rm -vf ../ansible/config
rm -vf ../ansible/*.retry
rm -rvf ../keys
rm -vf ../ansible/badger_token.txt
rm -vf ../ansible/jwt_token_player.txt
(cd ../terraform && terraform destroy -auto-approve)
rm -vf ../terraform/variables.auto.tfvars
rm -rvf ../terraform/terraform.tfstate*