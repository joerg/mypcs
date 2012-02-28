template "/etc/krb5.conf" do
  source "krb5.config.erb"
  action :nothing
  variables(
            :realms => node[:kerberos][:realms]
            )
  only_if { !node[:kerberos][:default_realm].empty? }
end
