default[:tt][:install_method] = 'source'
default[:tt][:dbname] = 'casket.tch'
default[:tt][:logfile] = "/var/log/ttserver.log"

default[:tc][:version] = "1.4.48"
default[:tt][:version] = "1.1.41"

default[:tc][:executable_filepath] = '/usr/local/bin/tchmgr'
default[:tt][:executable_filepath] = '/usr/local/bin/ttserver'

default[:tc][:url] = 'http://dl.bintray.com/d9magai/rpm/tokyocabinet-1.4.48-1.x86_64.rpm'
default[:tt][:url] = 'http://dl.bintray.com/d9magai/rpm/tokyotyrant-1.1.41-1.x86_64.rpm'
default[:tc][:checksum] = '8031c801d2519313c46dcc8fb64f2446'
default[:tt][:checksum] = '2bb0619acb8ae4fafbd939e2e7d36ae9'
