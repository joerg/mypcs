rel = node[:lsb][:codename]

package "python-gpgme"

apt_repo "dropbox" do
  key_id "5044912E "
  #key_package "opscode-keyring"
  url "http://linux.dropbox.com/ubuntu"
  distribution rel
  components "main"
end

package "nautilus-dropbox"
