include_recipe 'apt'

# install GUI packages to run eclipse
%{ libswt-gtk-3-jni libswt-gtk-3-java }.each do |lib|
  package lib
end

mkdir("#{env(:development)}/eclipse_scala")

eclipse_scala_file = "#{env(:download)}/eclipse_scala.tar.gz"

remote_file eclipse_scala_file do
  source "http://downloads.typesafe.com/scalaide-pack/4.0.0-rc2-luna-211-20141030/scala-SDK-4.0.0-rc2-2.11-linux.gtk.x86_64.tar.gz"
  owner "vagrant"
  group "vagrant"
  mode 0765
  action :create_if_missing
  notifies :run, "bash[extract_eclipse_scala]", :immediately
end

bash 'extract_eclipse_scala' do
  cwd ::File.dirname(eclipse_scala_file)
  code <<-EOH
    tar xzf #{eclipse_scala_file} -C #{env(:development)}/eclipse_scala --strip-components=1
    chown -R vagrant:vagrant #{env(:development)}/eclipse_scala
  EOH
  action :nothing
end

