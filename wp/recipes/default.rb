#
# Cookbook Name:: wp
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "create db for wp" do
  command "mysql -u root -p\"#{node['mysql']['server_root_password']}\" -e \"create database wordpress;\""
  action :run
end

subversion "wordpress svn" do
  repository "http://core.svn.wordpress.org/trunk/"
  destination "/var/www/wp"
  action :sync
end

directory "/var/www/wp" do
  owner "apache"
  group "apache"
  mode 0755
  recursive true
end

