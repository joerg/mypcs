
task :default => [ :install ]

task :submodules do
     puts "Fetch submodules"
     system 'git submodule init'
     system 'git submodule update'
end

task :get_users do
     system 'scp joerg@192.168.1.69:secrets/my-users.rb cookbooks/my-stuff/attributes/my-users.rb'
end

task :chef do
     puts "Execute Chef"
     system 'sudo EDITOR="${EDITOR}" chef-solo -c contrib/solo_config.rb'
end

task :install => [:submodules, :get_users, :chef]
