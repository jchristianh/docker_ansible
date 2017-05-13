#!/bin/bash
#
# launch sshd (for ansible) then
# fork a bash pid
#
# Chris Hammer <chris@thezengarden.net>
#######################################

/usr/sbin/sshd
/bin/bash
