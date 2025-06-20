#!/bin/bash

dnf downgrade curl -y
# modify pam files
sed -i '/^#/{G;}' /etc/pam.d/password-auth
sed -i '/^#/{G;}' /etc/pam.d/system-auth
# install httpd
dnf install -y httpd

#set up tmux so it has to restart itself whenever the system reboots
#step 1: make a script
tee ~/startup-tmux.sh << EOF
TMUX='' tmux new-session -d -s 'rhel-session' > /dev/null 2>&1
tmux set -g pane-border-status top
tmux setw -g pane-border-format ' #{pane_index} #{pane_current_command}'
tmux set -g mouse on
tmux set mouse on
tmux unbind -n MouseDown3Pane
EOF

#step 2: make it executable
chmod +x ~/startup-tmux.sh
#step 3: use cron to execute 
echo "@reboot ~/startup-tmux.sh" | crontab -

#step 4: start tmux for the lab
~/startup-tmux.sh