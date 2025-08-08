#!/bin/bash

set -e

echo "[*] Enabling root SSH login with SSH key..."

# Ensure root .ssh dir and copy keys
sudo mkdir -p /root/.ssh
sudo chmod 700 /root/.ssh
sudo cp /home/ubuntu/.ssh/authorized_keys /root/.ssh/authorized_keys
sudo chmod 600 /root/.ssh/authorized_keys

# Update sshd_config: set PermitRootLogin yes
SSHD_CONFIG="/etc/ssh/sshd_config"
if sudo grep -q "^PermitRootLogin" $SSHD_CONFIG; then
    sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin yes/' $SSHD_CONFIG
else
    echo "PermitRootLogin yes" | sudo tee -a $SSHD_CONFIG
fi

# Restart SSH service
if sudo systemctl status ssh >/dev/null 2>&1; then
    sudo systemctl restart ssh
else
    sudo service ssh restart
fi

echo "[+] Root SSH key login is ENABLED. Try: ssh -i /path/to/key.pem root@<your-server-ip>"
