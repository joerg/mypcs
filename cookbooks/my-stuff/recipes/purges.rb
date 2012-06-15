%w(ubuntuone-client ubuntuone-client-gnome ubuntuone-control-panel ubuntuone-control-panel-gtk banshee-extension-ubuntuonemusicstore python-ubuntuone-client python-ubuntuone-control-panel libubuntuone1.0-cil libubuntuone-1.0-1 libsyncdaemon-1.0-1 python-ubuntuone-storageprotocol update-manager).each do |p|
  package p do
    action :purge
  end
end

