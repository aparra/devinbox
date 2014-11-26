maven_file = "#{env(:download)}/maven.tar.gz"

remote_file maven_file do
  source "http://apache.mirrors.tds.net/maven/maven-3/3.1.1/binaries/apache-maven-3.1.1-bin.tar.gz" 
  owner "vagrant"
  group "vagrant"
  mode 0765
  action :create_if_missing
  notifies :run, "bash[extract_maven]", :immediately
end

bash 'extract_maven' do
  cwd ::File.dirname(maven_file)
  code <<-EOH
    tar xzf #{maven_file} -C #{env(:development)}
    chown -R vagrant:vagrant #{env(:development)}/apache-maven-3.1.1
  EOH
  action :nothing
end

directory env(:m2_repo) do
  owner "vagrant"
  group "vagrant"
  action :create
  mode 0765
end

export_variables({
  MAVEN_HOME: "#{env(:development)}/apache-maven-3.1.1",
  PATH: "$PATH:$MAVEN_HOME/bin"
})

