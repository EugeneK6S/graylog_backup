graylog-server-backup Cookbook
==============================
This cookbook provides backup of graylog-server(mongodb + elasticsearch indicies)

Requirements
------------
depends on graylog-server cookbook and backup-server-ssh(graylog-key) databag

Attributes
----------
default[:graylog][:elasticsearch][:data_path] = "/opt/elasticsearch/" - path to directory, which contains ES "data" dir
default[:graylog][:elasticsearch][:data_dir] = "data" - indicies directory name 
default[:graylog][:backup][:hour] = "1" - #run time of cronjob  
default[:graylog][:backup][:min] = "30" - #run time of cronjob  
default[:graylog][:backup_server_user] = "graylog-backup" - user on remote backup server
default[:graylog][:backup_server] = "evbyminsd7344.minsk.epam.com" - remote backup server hostname


Usage
-----

Just include `graylog-server-backup` role in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "role[graylog-server-backup]"
  ]
}

License and Authors
-------------------
Authors: 
Maksym_Zinkevych@epam.com
Ievgen_Kabanets@epam.com
