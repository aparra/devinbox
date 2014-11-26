sbt_file = "#{env(:download)}/sbt.tar.gz"

remote_file sbt_file do
  source "https://dl.bintray.com/sbt/native-packages/sbt/0.13.7/sbt-0.13.7.tgz"
  owner "vagrant"
  group "vagrant"
  mode 0765
  action :create_if_missing
  notifies :run, "bash[extract_sbt]", :immediately
end

bash 'extract_sbt' do
  cwd ::File.dirname(sbt_file)
  code <<-EOH
    tar xzf #{sbt_file} -C #{env(:development)}
    chown -R vagrant:vagrant #{env(:development)}/sbt
  EOH
  action :nothing
end

export_variables({
  SBT_OPTS: "-Xms512M -Xmx1536M -Xss1M",
  SBT_HOME: "#{env(:development)}/sbt",
  PATH: "$PATH:$SBT_HOME/bin"
})

