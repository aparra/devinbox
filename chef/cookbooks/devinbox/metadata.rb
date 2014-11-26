name             "devinbox"
maintainer       "Anderson Parra de Paula"
maintainer_email "ander.pp@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures my personal VM"
version          "0.0.1"

recipe "devinbox::bootstrap", "bootstrap vm configuration"
recipe "devinbox::ant", "install apache ant tool"
recipe "devinbox::eclipse_scala", "install scala eclipse IDE"
recipe "devinbox::hotspot", "install JDK hotspot"
recipe "devinbox::jboss", "install JBoss AS"
recipe "devinbox::maven", "install apache maven tool"
recipe "devinbox::sbt", "install sbt tool"
recipe "devinbox::workspace", "clone internal repositories"

%w{ apt apache2 }.each do |cookbook|
  depends cookbook
end

%w{ ubuntu redhat }.each do |os|
  supports os
end
