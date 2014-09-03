default[:tokyotyrantserver][:install_method] = 'source'
default[:tokyotyrantserver][:dbname] = 'casket.tch'
default[:tokyotyrantserver][:logfile] = "/var/log/ttserver.log"

default[:tokyotyrantserver][:tokyocabinet][:version] = "1.4.48"
default[:tokyotyrantserver][:tokyotyrant][:version] = "1.1.41"

default[:tokyotyrantserver][:tokyocabinet][:binarypath] = '/usr/local/bin/tchmgr'
default[:tokyotyrantserver][:tokyotyrant][:binarypath] = '/usr/local/bin/ttserver'
