#!/bin/bash

# Unregister and register the VM
subscription-manager clean
subscription-manager register --activationkey=12-5-22-instruqt --org=12451665 --force

dnf downgrade git -y

# modify pam file
echo "# Make a change rpm detects" >> /etc/security/limits.conf

# install httpd moved to instances.yaml
# dnf install -y httpd

