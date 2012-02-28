# -*- coding: utf-8 -*-
define :krb5_realm,
:admin_server => [],
:kdc => [],
:default => false do

  node[:kerberos][:default_realm] = params[:name] if params[:default]
  node[:kerberos][:realms][params[:name].downcase] = [ params[:kdc], params[:admin_server] ]

  file "/etc/krb5.conf" do
    action :touch
    notifies :create, "template[/etc/krb5.conf]"
  end

end
