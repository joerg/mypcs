
task :default => [ :install ]

task :install do
     puts "Fetch submodules"
     `git submodule init`
     `git submodule update`
     puts "Execute Chef"
     `sudo EDITOR="${EDITOR}" chef-solo -c contrib/solo_config.rb`
end