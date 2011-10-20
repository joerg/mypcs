%w( unrar openssh-server ).each do |p|
  package p
end

service "ssh" do
  action [:disable, :stop]
end

ppa "caffeine-developers/ppa"
package "caffeine"
