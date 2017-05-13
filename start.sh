#!/bin/bash
#
# Chris Hammer <chris@thezengarden.net>
#######################################

CIMG="docker.thezengarden.net/ansible"
CTAG="latest"
CNAME="ansible"
CONFBASE="/home/chris/git"
PLAYBOOKS="${CONFBASE}/ansible/playbooks:/playbooks"

VOLUMES="-v $PLAYBOOKS"

docker run -ti --rm --name $CNAME --hostname $CNAME $VOLUMES $CIMG:$CTAG
