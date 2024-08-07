su -
apt-get update -y
apt-get upgrade -y
apt install sudo
usermod -aG sudo $USER
echo -e "Defaults env_reset\nDefaults mail_badpass\nDefaults secure_path='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'\nDefaults badpass_message='Password is wrong, please tru again !'\nDefaults passwd_tries=3\nDefaults logfile='/var/log/sudo/sudo.log'\nDefaults log_input, log_output\nDefaults requiretty\nDefaults use_pty\nroot ALL=(ALL:ALL) ALL\n$USER ALL=(ALL:ALL) ALL\n%sudo ALL=(ALL:ALL) ALL\n$USER ALL=(root) NOPASSWD: /usr/local/bin/monitoring.sh\n@includedir /etc/sudoers.d" > /etc/sudoers
apt-get install git -y
apt install openssh-server
systemctl status ssh
echo -e "Include /etc/ssh/sshd_config.d/*.conf\nPort 1285\nKbdInteractiveAuthentication no\nUsePAM yes\nX11Forwading yes\nPrintMotd no\nAcceptEnv LANG LC_*\nSubsystem sftp /usr/lib/openssh/sftp-server" > /etc/ssh/sshd_config
service ssh restart
apt-get install ufw
ufw enable
ufw status numbered
ufw allow ssh
ufw allow 1285
ufw status numbered
systemctl restart ssh