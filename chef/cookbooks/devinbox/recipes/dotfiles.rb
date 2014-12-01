def update_bashrc(file)
  execute "sh -c \"echo 'source #{file}' >> /home/vagrant/.bashrc\"" do
    not_if "grep '#{file}' /home/vagrant/.bashrc"
  end
end

clone_repo({
  uri: "https://github.com/aparra/dotfiles.git",
  branch: "master",
  to: env(:workspace)
})

dotfiles_dir = "#{env(:workspace)}/dotfiles"

execute "create symbolic links to my personal configuration" do
  command <<-EOH
    ln -sf #{dotfiles_dir}/.vim /home/vagrant
  EOH
  user "root"
end

# update ~/.bashrc with entries of dotfiles/profile.d 
Dir.glob("#{dotfiles_dir}/profile.d/*").map(&File.method(:realpath)).each do |file|
  update_bashrc file
en
