rel = node[:lsb][:codename]
releases = [rel, rel+"-updates", rel+"-backports", rel+"-security" ]

file "/etc/apt/sources.list" do
  content ""
end

releases.each do |dist|
  apt_repo "inode-ubuntu-"+dist do
    distribution dist
    key_id "437D05B5"
    keyserver "keyserver.ubuntu.com"
    key_package "ubuntu-keyring"
    url "http://ubuntu.inode.at/ubuntu/"
    components ["universe", "multiverse", "main", "restricted"]
  end
end

apt_repo "ubuntu-extras" do
  distribution rel
  key_id "3E5C1192"
  keyserver "keyserver.ubuntu.com"
  key_package "ubuntu-extras-keyring"
  url "http://extras.ubuntu.com/ubuntu"
  components ["main"]
end
