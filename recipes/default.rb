#
# Cookbook Name:: graylog-server-backup
# Recipe:: default
#
# Copyright 2014, EPAM
#
# All rights reserved - Do Not Redistribute
#

ssh_key = data_bag_item("backup-server-ssh", "graylog-key")

directory "/root/bin" do
  owner "root"
  group "root"
  mode 00644
  action :create
end

template "/root/bin/backup.sh" do
  source "backup.sh.erb"
  mode 0700
  owner "root"
  group "root"
end

cron "graylog_server_backup" do
  hour node['graylog']['backup']['hour']
  minute node['graylog']['backup']['min']
  command "/root/bin/backup.sh"
end

directory "/root/.ssh" do
  owner "root"
  group "root"
  mode 00600
  action :create
end

file "/root/.ssh/.graylog-key" do
  content ssh_key['id_rsa']
  owner "root"
  group "root"
  mode 00600
end
