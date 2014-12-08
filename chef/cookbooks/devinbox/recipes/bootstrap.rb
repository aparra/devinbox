include_recipe 'apt'

apt_repository "git-core" do
  uri "http://ppa.launchpad.net/git-core/ppa/ubuntu"
  distribution "precise"
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "E1DF1F24"
  action :add
end

apt_repository "chris-lea-node.js" do
  uri "http://ppa.launchpad.net/chris-lea/node.js/ubuntu"
  distribution "precise"
  components ["main"]
  key "C7917B12"
  keyserver "keyserver.ubuntu.com"
  action :add
end

%w{ git meld nodejs make zip unzip }.each do |lib|
  package lib
end

[env(:base_dir), env(:download), env(:development), env(:java), env(:jboss), env(:m2_repo)].each do |dir_name|
  mkdir dir_name
end
