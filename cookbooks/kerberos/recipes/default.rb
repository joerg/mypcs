template "/etc/krb5.conf" do
  source "krb5.conf.erb"
  action :nothing
  mode 0755
  owner "root"
  group "root"
  variables(
            :realms => node[:kerberos][:realms]
            )
  only_if { !node[:kerberos][:default_realm].empty? }
end
