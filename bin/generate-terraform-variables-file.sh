#!/bin/bash

set -e
cd $(dirname $0)

ansible-playbook -e @../config ../ansible/generate-terraform-variables-file.yml
