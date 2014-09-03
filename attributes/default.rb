default[:tokyotyrantserver][:install_method] = 'source'
default[:tokyotyrantserver][:dbname] = 'casket.tch'
default[:tokyotyrantserver][:logfile] = "/var/log/ttserver.log"

default[:tokyotyrantserver][:tc][:version] = "1.4.48"
default[:tokyotyrantserver][:tt][:version] = "1.1.41"

default[:tokyotyrantserver]['tc']['name'] = 'tokyocabinet'
default[:tokyotyrantserver]['tt']['name'] = 'tokyotyrant'

default[:tokyotyrantserver]['tc']['binarypath'] = '/usr/local/bin/tchmgr'
default[:tokyotyrantserver]['tt']['binarypath'] = '/usr/local/bin/ttserver'
