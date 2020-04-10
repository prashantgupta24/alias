#!/bin/bash

/bin/rm -f /etc/profile.d/alias.sh
curl -L -s https://raw.githubusercontent.com/prashantgupta24/alias/master/alias.sh -o /etc/profile.d/alias.sh
