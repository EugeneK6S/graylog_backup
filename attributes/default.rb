#path to directory, which contains ES "data" dir 
default['graylog']['elasticsearch']['data_path'] = "/opt/elasticsearch/"
#indicies directory name 
default['graylog']['elasticsearch']['data_dir'] = "data"

#run time of cronjob  
default['graylog']['backup']['hour'] = "1"
default['graylog']['backup']['min'] = "30"
default['graylog']['backup_server_user'] = "user_for_backup"
default['graylog']['backup_server'] = "your_backup_server_hostname"
