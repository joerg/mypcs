
task :default => [ :install ]

task :install do
     puts "Fetch submodules"
     system 'git submodule init'
     system 'git submodule update'
     puts "Execute Chef"
     system 'sudo EDITOR="${EDITOR}" chef-solo -c contrib/solo_config.rb'
end