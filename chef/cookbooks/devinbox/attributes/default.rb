set["devinbox"][:base_dir] = "/vmspace"
set["devinbox"][:workspace] = "#{env(:base_dir)}/workspace"
set["devinbox"][:download] = "#{env(:base_dir)}/download"
set["devinbox"][:development] = "#{env(:base_dir)}/development"
set["devinbox"][:java] = "#{env(:development)}/java"
set["devinbox"][:jboss] = "#{env(:development)}/jboss"
set["devinbox"][:maven] = "#{env(:base_dir)}/maven"
set["devinbox"][:m2_repo] = "/home/vagrant/.m2"

set['apache']['listen_ports'] = [80, 443]
