# @todo: This looks pretty buggy. $VERSION $version ?? remove if this is not used.
define ruby::gem (
  $name,
  $version = 'latest'
) {
  exec {
    'remove newer versions':
      command   => "VERSION=`gem list -l ${name}|cut -d'(' -f2|cut -d',' -f1`; while \$VERSION != ${version}; do; gem uni ${name} -v \$VERSION;VERSION=`gem list -l ${name}|cut -d'(' -f2|cut -d',' -f1`;end",
      path      => '/bin:/usr/bin:/sbin:/usr/sbin',
      onlyif    => "gem list -l ${name}|grep ','";
  }

  package {
    'gem installation':
      ensure   => $version,
      name     => $name,
      provider => 'gem';
  }
}
