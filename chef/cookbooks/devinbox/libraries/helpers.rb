class Chef
  class Recipe
    def clone_repo(param)
      repo_name = param[:uri].gsub(/.*\/(.*)\.git/) { $1 }    
      repo_dir = "#{param[:to]}/#{repo_name}"

      git repo_dir do
        repository param[:uri]
        reference param[:branch]
        action :sync
        user "vagrant"
        group "vagrant"
        not_if { ::File.exists?(repo_dir) }
      	notifies :run, "execute[checkout_branch]"
	notifies :run, "execute[update_submodule]"
      end

      execute "checkout_branch" do 
        command "cd #{repo_dir} && git checkout #{param[:branch]}"
        user "vagrant"
        group "vagrant"
      end

      execute "update_submodule" do 
        command "cd #{repo_dir} && git submodule init && git submodule update"
        user "vagrant"
        group "vagrant"
      end
    end
    
    def export_variable(map)
      map.each do |key, value|
        var = "#{key}=\\\"#{value.gsub("$", "\\$")}\\\""      
        execute "sudo sh -c \"echo 'export #{var}' >> /etc/profile.d/devinbox.sh\"" do
          not_if "grep '#{var}' /etc/profile.d/devinbox.sh"
      	end
      end
    end

    alias_method :export_variables, :export_variable

    def npm_package(package_name)
      execute "install npm package #{package_name}" do
        command "npm -g install #{package_name}"
        user "root"
      end
    end

    def mkdir(dir_name)
      directory dir_name do
        owner "vagrant"
        group "vagrant"
        mode "0755" 
        action :create
      end
    end      
  end
end

def env(key)
  node['devinbox'][key]
end
