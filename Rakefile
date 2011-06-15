
task :default => [ :install ]

task :submodules do
     puts "Fetch submodules"
     system 'git submodule init'
     system 'git submodule update'
end

task :chef do
     puts "Execute Chef"
     system 'sudo EDITOR="${EDITOR}" chef-solo -c contrib/solo_config.rb'
end

task :install => [:submodules, :chef]
