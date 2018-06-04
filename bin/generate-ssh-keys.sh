#!/bin/bash

set -e
cd $(dirname $0)

[ -d ../keys ] && echo "../keys/ already exists" || mkdir ../keys
[ -f ../keys/remote ] && echo "remote SSH Key already generated" || ssh-keygen -t rsa -b 4096 -f ../keys/remote -P ""
[ -f ../keys/master ] && echo "master SSH Key already generated" || ssh-keygen -t rsa -b 4096 -f ../keys/master -P ""
