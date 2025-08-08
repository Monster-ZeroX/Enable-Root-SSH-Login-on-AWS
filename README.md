# Enable Root SSH Login on AWS Lightsail Ubuntu

> **Automate root SSH key login—securely, in one step.**

## 🚀 What Does This Script Do?

- Configures SSH key-based login for the `root` user on an Ubuntu Lightsail VPS.
- Automatically updates `/etc/ssh/sshd_config` to set `PermitRootLogin yes`.
- Copies the `ubuntu` user’s SSH key to the `root` user’s authorized keys.
- Secures file permissions for the `root` user’s SSH configuration.
- Restarts the SSH service to apply changes.

**No manual configuration. No incomplete setups.**

## ⚡️ How to Use

1. **SSH into your Lightsail Ubuntu server as the `ubuntu` user**:
   ```bash
   ssh -i /path/to/key.pem ubuntu@your-server-ip
   ```

2. **Run the one-liner script** (replace `<your-github-username>` and `<your-repo>` with your GitHub details):
   ```bash
   bash <(curl -s https://raw.githubusercontent.com/Monster-ZeroX/Enable-Root-SSH-Login-on-AWS/refs/heads/main/enable-root-ssh.sh)
   ```

3. **Log in as `root` with your SSH key**:
   ```bash
   ssh -i /path/to/key.pem root@your-server-ip
   ```

## 💡 Why Use This?

By default, AWS Lightsail and Ubuntu disable direct `root` SSH login for security reasons. However, enabling it is sometimes necessary for:
- Automation tasks.
- System recovery.
- Advanced server configurations.

This script ensures secure setup by using SSH keys only, avoiding less secure password-based authentication.

## ⚠️ Security Warning

- **Never enable password-based root login.**
- Use strong, unique SSH keys.
- Disable root login when no longer needed (`PermitRootLogin no`).

## 🛠 Script Details

- Updates or inserts `PermitRootLogin yes` in `/etc/ssh/sshd_config`.
- Copies the `ubuntu` user’s SSH keys to `/root/.ssh/authorized_keys`.
- Sets secure permissions for the `root` user’s SSH configuration.
- Restarts the SSH service to apply changes.

## ✨ Example Output

```
[*] Enabling root SSH login with SSH key...
[+] Root SSH key login is ENABLED. Try: ssh -i /path/to/key.pem root@<your-server-ip>
```

## 👨‍💻 Author

[MonsterZeroX](https://github.com/Monster-ZeroX/)

## 📢 Contribute / Issues

- Pull requests are welcome for improvements or additional features!
- Open an issue if you encounter bugs—this script is designed to be straightforward, but issues can arise.

**Own your infrastructure. Automate boldly.**
