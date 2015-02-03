execute "install docker" do
  command "curl -sSL https://get.docker.com/ubuntu/ | sudo sh"
  action :run
end
