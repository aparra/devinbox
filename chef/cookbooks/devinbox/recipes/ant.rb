ant_file = "#{env(:upload)}/apache-ant.tar.gz"

remote_file ant_file do
  source "http://archive.apache.org/dist/ant/binaries/apache-ant-1.8.2-bin.tar.gz" 
  owner "vagrant"
  group "vagrant"
  mode 0765
  action :create_if_missing
  notifies :run, "bash[extract_ant]", :immediately
end

bash 'extract_ant' do
  cwd ::File.dirname(ant_file)
  code <<-EOH
    tar xzf #{ant_file} -C #{env(:development)}
    chown -R vagrant:vagrant #{env(:development)}/apache-ant-1.8.2
  EOH
  action :nothing
end

export_variables({
  ANT_HOME: "#{env(:development)}/apache-ant-1.8.2",
  PATH: "$PATH:$ANT_HOME/bin"
})

