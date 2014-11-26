$jboss_source = {
  jboss8: "http://download.jboss.org/wildfly/8.2.0.Final/wildfly-8.2.0.Final.tar.gz",
  jboss7: "http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz"  
}

def download(jboss_version)
  jboss_file = "#{env(:download)}/#{jboss_version}.tar.gz"

  remote_file jboss_file do
    source $jboss_source[jboss_version] 
    owner "vagrant"
    group "vagrant"
    mode 0765
    action :create_if_missing
  end

  jboss_file
end

def extract(jboss_file)
  execute "extract jboss: #{jboss_file}" do
    command <<-EOH
      tar xzf #{jboss_file} -C #{env(:jboss)}
      chown -R vagrant:vagrant #{env(:jboss)}
    EOH
  end
end  

def install(jboss)
  tmp_file = download(jboss)
  extract(tmp_file)
end

[:jboss8, :jboss7].each do |jboss|
  install jboss
end  

