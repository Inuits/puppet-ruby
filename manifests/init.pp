class ruby (
  $stages = 'no',
  $home   = $::operatingsystem ? {
    default   => '/usr',
    archlinux => '/opt/ruby1.8',
  },
  $lib_dir = $::operatingsystem ? {
    default   => '/usr/lib/ruby',
    archlinux => '/opt/ruby1.8/lib/ruby',
    debian    => '/var/lib',
  },
  $bin_dir = $::operatingsystem ? {
    default   => '/usr/bin',
    archlinux => '/opt/ruby1.8/bin',
  },
  $usecrappyhttpdmodule = 'no',
  $version = '1.8',
  $managerepo    = false

) {

    if $ruby::managerepo {
      include ruby::repo
    }
    include ruby::packages

    if $::operatingsystem == 'centos' {
      if $::operatingsystemrelease =~ /^5/ {
        include ruby::openssl_fix
      }
    }

    if $ruby::usecrappyhttpdmodule == 'yes' {
      realize(Package['httpd-devel'])
      include passenger
    }
}
