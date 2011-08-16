package "unattended-upgrades"

file "/etc/apt/apt.conf.d/10periodic" do
  content 'APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "0";
APT::Periodic::Unattended-Upgrade "1";
'
end

file "/etc/apt/apt.conf.d/50unattended-upgrades" do
  content 'Unattended-Upgrade::Allowed-Origins {
    "${distro_id} ${distro_codename}-security";
    "${distro_id} ${distro_codename}-updates";
//  "${distro_id} ${distro_codename}-proposed";
    "${distro_id} ${distro_codename}-backports";
};
'
end
