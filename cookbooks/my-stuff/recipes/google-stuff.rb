rel = node[:lsb][:codename]

apt_repo "chromium" do
  key_id "4E5E17B5"
  key_server "keyserver.ubuntu.com "
  url "http://ppa.launchpad.net/chromium-daily/stable/ubuntu"
  distribution rel
  components "main"
end

%w(chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg chromium-codecs-ffmpeg-extra ).each do |p|
  package p
end

apt_repo "google-talk" do
  key_url "http://dl-ssl.google.com/linux/linux_signing_key.pub"
  key_id "C07CB649"
  url "http://dl.google.com/linux/talkplugin/deb"
  distribution "stable"
  components "main"
  source_packages false
end

package "google-talkplugin"
