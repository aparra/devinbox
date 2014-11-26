name             "custom_samba"
maintainer       "Anderson Parra de Paula"
maintainer_email "ander.pp@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures samba devinbox"
version          "0.0.1"

recipe "custom-samba::default", "Includes the samba::client recipe"

%w{ ubuntu redhat }.each do |os|
  supports os
end
