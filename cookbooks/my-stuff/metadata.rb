maintainer       "Jörg Herzinger"
maintainer_email "joerg.herzinger@oiml.at"
license          "MIT"
description      "Stuff for my PCs"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
#version          "0.1"

%w(ubuntu debian).each do |os|
  supports os
end
