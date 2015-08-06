class ruby::openssl_fix {

  $RUBY_DIR = '/usr/lib/ruby/1.8'

  file {
    'openssl.rb':
      ensure => present,
      source => 'puppet:///modules/ruby/openssl.rb',
      owner  => 'root',
      group  => 'root',
      path   => "${RUBY_DIR}/openssl.rb";

    'openssl':
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      path   => "${RUBY_DIR}/openssl";

    'bn.rb':
      ensure => present,
      source => 'puppet:///modules/ruby/openssl/bn.rb',
      owner  => 'root',
      group  => 'root',
      path   => "${RUBY_DIR}/openssl/bn.rb";

    'buffering.rb':
      ensure => present,
      source => 'puppet:///modules/ruby/openssl/buffering.rb',
      owner  => 'root',
      group  => 'root',
      path   => "${RUBY_DIR}/openssl/buffering.rb";

    'cipher.rb':
      ensure => present,
      source => 'puppet:///modules/ruby/openssl/cipher.rb',
      owner  => 'root',
      group  => 'root',
      path   => "${RUBY_DIR}/openssl/cipher.rb";

    'config.rb':
      ensure => present,
      source => 'puppet:///modules/ruby/openssl/config.rb',
      owner  => 'root',
      group  => 'root',
      path   => "${RUBY_DIR}/openssl/config.rb";

    'digest.rb':
      ensure => present,
      source => 'puppet:///modules/ruby/openssl/digest.rb',
      owner  => 'root',
      group  => 'root',
      path   => "${RUBY_DIR}/openssl/digest.rb";

    'pkcs7.rb':
      ensure => present,
      source => 'puppet:///modules/ruby/openssl/pkcs7.rb',
      owner  => 'root',
      group  => 'root',
      path   => "${RUBY_DIR}/openssl/pkcs7.rb";

    'ssl-internal.rb':
      ensure => present,
      source => 'puppet:///modules/ruby/openssl/ssl-internal.rb',
      owner  => 'root',
      group  => 'root',
      path   => "${RUBY_DIR}/openssl/ssl-internal.rb";

    'ssl.rb':
      ensure => present,
      source => 'puppet:///modules/ruby/openssl/ssl.rb',
      owner  => 'root',
      group  => 'root',
      path   => "${RUBY_DIR}/openssl/ssl.rb";

    'x509.rb':
      ensure => present,
      source => 'puppet:///modules/ruby/openssl/x509.rb',
      owner  => 'root',
      group  => 'root',
      path   => "${RUBY_DIR}/openssl/x509.rb";

    'x509-internal.rb':
      ensure => present,
      source => 'puppet:///modules/ruby/openssl/x509-internal.rb',
      owner  => 'root',
      group  => 'root',
      path   => "${RUBY_DIR}/openssl/x509-internal.rb";

  }

  package { 'ruby-static':
      ensure  => present,
      require => Yumrepo['kbs-el5-rb187'];
  }
}
