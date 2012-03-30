#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'net/smtp'

@dry = 1 if ARGV[0] == "dry" 
start = Time.now

def duration( st )
  # Time - Time returns number of seconds
  t = Time.at( Time.now - st ).utc
  "started at #{st.strftime("%a %b %e %Y, %T")} and took #{t.hour}:#{t.min}:#{t.sec} to run."
end

def exec( command )
  start = Time.now
  if @dry
    puts command
    [ "", 0, duration(start)] 
  else
    [ `#{command} 2>&1`, $?.to_i, duration(start)] 
  end
end

def nice_return( str ) 
  str.empty? ? "." : " and claimed:\n#{str}"
end

# Defaults
cifs_mount = disk_mount = rdiff = finish = [ "Not done or no output", 255]
backup_device = "/dev/disk/by-id/ata-WDC_WD10EADS-00L5B1_WD-WCAU47255820"
backup_partition = "/dev/disk/by-uuid/562c67cc-e737-499d-91af-d44a8292febf"
cifs_mountpoint = "/mnt/blackbox"
disk_mountpoint = "/mnt/backup"

# Mount CIFS Partition
cifs_mount = exec("mount -t cifs -o credentials=/root/.blackbox_backup_cred //blackbox/space #{cifs_mountpoint}")

# Mount backup disk
disk_mount = exec("mount #{backup_partition} #{disk_mountpoint}")

# Run backup if both mounts succeeded
unless (cifs_mount[1] + disk_mount[1] ) > 0
  rdiff = exec("rdiff-backup --exclude-if-present .nobackup #{cifs_mountpoint} #{disk_mountpoint}/backup")
end

# Umount backup and cifs, shutdown backup disk even if pc is still running
finish = exec("umount /mnt/blackbox && umount /mnt/backup && sdparm --quiet --flexible --command=stop #{backup_device}")

if ( cifs_mount[1] + disk_mount[1] + rdiff[1] + finish[1] ) > 0
  subj = "BACKUP FAILED !!"
else
  subj = "Backup successful"
end

# Send Mail
message = <<MESSAGE_END
From: Backup Script <backup@oiml.at>
To: Jörg Herzinger <joerg.herzinger@oiml.at>
Subject: #{subj}

Backup #{duration(start)}

### CIFS #{cifs_mount[2]}
CIFS returned status #{cifs_mount[1]}#{nice_return cifs_mount[0]}

### Disk #{disk_mount[2]}
Disk returned status #{disk_mount[1]}#{nice_return disk_mount[0]}

### Rdiff #{rdiff[2]}
Rdiff returned status #{rdiff[1]}#{nice_return rdiff[0]}

### Finishing #{finish[2]}
Finishing it returned status #{finish[1]}#{nice_return finish[0]}
MESSAGE_END

Net::SMTP.start('mgate.chello.at') do |smtp|
  smtp.send_message message, 'backup@oiml.at', 'joerg.herzinger@oiml.at'
end unless @dry
puts message if @dry
