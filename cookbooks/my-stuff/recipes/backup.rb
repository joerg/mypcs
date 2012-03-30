%w(cifs-utils rdiff-backup sdparm).each do |p|
  package p
end

directory '/etc/rc.local.d' do
  owner 'root'
  group 'root'
  mode 0755
end

cookbook_file '/etc/rc.local.d/backup' do
  source 'backup.rb'
  owner 'root'
  group 'root'
  mode 0755
end

file '/etc/rc.local' do
  content <<END_FILE
#!/bin/sh -e
sleep 120 #Delay execution since those scripts need a network connection...
run-parts /etc/rc.local.d
exit 0
END_FILE
  owner 'root'
  group 'root'
  mode 0755
end

directory '/mnt/blackbox'
directory '/mnt/backup'
