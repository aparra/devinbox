$jdk_source = {
  jdk8: "http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-linux-x64.tar.gz",
  jdk7: "http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.tar.gz"  
}

def download(jdk_version)
  jdk_file = "#{env(:download)}/#{jdk_version}.tar.gz"

  execute "wget #{jdk_file}" do
    command "wget -O #{jdk_file} --no-check-certificate --no-cookies --header 'Cookie: oraclelicense=accept-securebackup-cookie' #{$jdk_source[jdk_version]}"
    user "vagrant"
    not_if { ::File.exists?(jdk_file) }
  end

  jdk_file
end

def extract(jdk_file)
  execute "extract jdk: #{jdk_file}" do
    command <<-EOH
      tar xzf #{jdk_file} -C #{env(:java)}
      chown -R vagrant:vagrant #{env(:java)}
    EOH
  end
end  

def install(jdk)
  tmp_file = download(jdk)
  extract(tmp_file)
end

[:jdk8, :jdk7].each do |jdk|
  install jdk
end

export_variables({
  JAVA_HOME: "#{env(:java)}/jdk1.8.0_25",
  PATH: "$PATH:$JAVA_HOME/bin"
})
