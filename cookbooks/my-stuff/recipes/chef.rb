rel = node[:lsb][:codename]

apt_repo "opscode" do
  key_id "83EF826A"
  key_package "opscode-keyring"
  url "http://apt.opscode.com/"
  distribution rel+"-0.10"
  components "main"
end

%w( chef libshadow-ruby1.8 ).each do |p|
  package p
end
