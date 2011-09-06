#include_attribute "my-stuff::my-users"

node.default["my-stuff"]["users"].each do |user_name, user_data|
  user user_name do
    comment user_data[0]
    password user_data[1]
    shell "/bin/zsh"
    home "/home/#{user_name}"
    supports :manage_home => true
  end
end
