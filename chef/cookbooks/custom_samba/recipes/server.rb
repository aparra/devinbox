package value_for_platform(
  ["ubuntu", "debian", "arch"] => { "default" => "samba" },
  ["redhat", "centos", "fedora", "scientific", "amazon"] => { "default" => "samba3x" },
  "default" => "samba"
)

svcs = value_for_platform(
  ["ubuntu", "debian"] => { "default" => ["smbd", "nmbd"] },
  ["redhat", "centos", "fedora", "scientific", "amazon"] => { "default" => ["smb", "nmb"] },
  "arch" => { "default" => [ "samba" ] },
  "default" => ["smbd", "nmbd"]
)

svcs.each do |s|
  service s do
    pattern "smbd|nmbd" if node["platform"] =~ /^arch$/
    action [:enable, :start]
  end
end

template node["custom_samba"]["config"] do
  source "smb.conf.erb"
  owner "root"
  group "root"
  mode 00644
  svcs.each do |s|
    notifies :restart, "service[#{s}]"
  end
end

