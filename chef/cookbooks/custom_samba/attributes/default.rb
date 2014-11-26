case platform
when "arch"
  set["custom_samba"]["config"] = "/etc/samba/smb.conf"
  set["custom_samba"]["log_dir"] = "/var/log/samba/log.%m"
when "redhat", "centos", "fedora", "amazon", "scientific"
  set["custom_samba"]["config"] = "/etc/samba/smb.conf"
  set["custom_samba"]["log_dir"] = "/var/log/samba/log.%m"
else
  set["custom_samba"]["config"] = "/etc/samba/smb.conf"
  set["custom_samba"]["log_dir"] = "/var/log/samba/%m.log"
end
