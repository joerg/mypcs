if node["cpu"]["0"]["flags"].include?("svm") || node["cpu"]["0"]["flags"].include?("vmx")
  include_recipe "my-stuff::virt_#{node.my_stuff.virt_method}"
else
  puts "No hardware virtualization component found.  Maybe you have to enable it in your BIOS."
end
