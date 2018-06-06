#!/bin/bash

set -e
cd $(dirname $0)

export ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook \
  -e @../config \
  -i ../ansible/hosts \
  --private-key=../keys/remote \
  ../ansible/copy-master-ssh-keys.yml
