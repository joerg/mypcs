require "socket"
hostname = Socket.gethostname

cookbooks = File.expand_path(File.join(File.dirname(__FILE__), "../cookbooks"))
runlist = File.join(File.expand_path(File.dirname(__FILE__)), "#{hostname}-runlist.json")

cookbook_path cookbooks
json_attribs runlist
