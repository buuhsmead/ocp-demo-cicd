#!/usr/bin/env bash

#set -x


# add the location of minishift execuatable to PATH
# I also keep other handy tools like kubectl and kubetail.sh
# in that directory


minishift profile set ocpdemocicd
minishift config  set vm-driver virtualbox
minishift config set memory 6GB
minishift config set cpus 4
minishift config set disk-size 40G
minishift config set image-caching true
minishift addon enable admin-user
minishift addon enable xpaas
minishift start --openshift-version 3.11.0

echo "========= ENV ========================"
minishift oc-env
minishift docker-env

echo "========= CONSOLE ========================"
minishift console --url
