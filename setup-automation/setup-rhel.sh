#!/bin/bash

dnf downgrade git -y

# modify pam file
echo "# Make a change rpm detects" >> /etc/security/limits.conf

# install httpd moved to instances.yaml
# dnf install -y httpd

