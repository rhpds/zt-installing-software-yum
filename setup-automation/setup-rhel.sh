#!/bin/bash

dnf downgrade curl -y

# modify pam files
sed -i '/^#/{G;}' /etc/pam.d/password-auth
sed -i '/^#/{G;}' /etc/pam.d/system-auth

# install httpd moved to instances.yaml
# dnf install -y httpd

