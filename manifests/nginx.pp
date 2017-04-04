class profiles::nginx (
  Array $vhosts,
) {
  include ::nginx
  $vhosts.each |$vhost| {
    ::nginx::resource::server { $vhost['fqdn']:
      listen_port => $vhost['port'],
#      server_aliases => $vhost['server_aliases'],
      www_root => $vhost['www_root'],
    }
  }
}
