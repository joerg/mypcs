package "flashplugin-installer"

%w( vlc gnome-mplayer exaile qwbfsmanager).each do |p|
  package p
end
