
task :default => [ :install ]

task :submodules do
  puts "Fetch submodules"
  current = Dir.pwd
  if File.directory?("cookbooks/admin-essentials") 
    Dir.chdir("cookbooks/admin-essentials") do
      system 'git pull'
    end
  else
    system 'git clone https://github.com/sometimesfood/chef-admin-essentials.git cookbooks/admin-essentials'
  end

  if File.directory?("cookbooks/apt-repo") 
    Dir.chdir("cookbooks/apt-repo") do
      system 'git pull'
    end
  else
    system 'git clone https://github.com/sometimesfood/chef-apt-repo.git cookbooks/apt-repo'
  end

end

task :get_users do
     system 'scp joerg@192.168.1.69:secrets/my-users.rb cookbooks/my-stuff/attributes/my-users.rb'
end

task :chef do
     puts "Execute Chef"
     system 'sudo EDITOR="${EDITOR}" chef-solo -c contrib/solo_config.rb'
end

task :install => [:submodules, :get_users, :chef]
