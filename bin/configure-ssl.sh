#!/bin/bash

set -e
cd $(dirname $0)

ansible-playbook \
  -i ../ansible/hosts \
  --private-key=../keys/remote \
  ../ansible/configure-ssl.yml
