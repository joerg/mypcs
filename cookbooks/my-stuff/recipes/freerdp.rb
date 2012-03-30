ppa "freerdp-team/freerdp"

%w( freerdp-x11 libfreerdp-plugins-standard ).each do |p|
  package p
end
