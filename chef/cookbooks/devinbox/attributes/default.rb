default["devinbox"][:base_dir] = "/vmspace"
default["devinbox"][:workspace] = "#{env(:base_dir)}/workspace"
default["devinbox"][:download] = "#{env(:base_dir)}/download"
default["devinbox"][:development] = "#{env(:base_dir)}/development"
default["devinbox"][:java] = "#{env(:development)}/java"
default["devinbox"][:jboss] = "#{env(:development)}/jboss"
default["devinbox"][:maven] = "#{env(:base_dir)}/maven"
default["devinbox"][:m2_repo] = "/home/vagrant/.m2"

default['apache']['listen_ports'] = [80, 443]
