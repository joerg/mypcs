package "flashplugin-installer"

%w( vlc gnome-mplayer exaile qwbfsmanager).each do |p|
  package p
end

%w( gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad ).each do |p|
  package p
end
