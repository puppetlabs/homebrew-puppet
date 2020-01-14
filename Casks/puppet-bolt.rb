cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.45.0'
    sha256 'f4b8dd200b3c4bd23283a12aa7947e96237feb4e6136c6c35368f1616dccd842'
  when '10.12'
    os_ver = '10.12'
    version '1.45.0'
    sha256 'd5c8af5261d8dbb796a0349faad281bb9f29c190bfd6f767314778825954a670'
  when '10.13'
    os_ver = '10.13'
    version '1.45.0'
    sha256 '076c4d3fc1029f210b86507fb8d20564bf0fdba41a1f4998304fa83060949f32'
  else
    os_ver = '10.14'
    version '1.45.0'
    sha256 '0223f754902cf7381c76b6eb2628ad8472133f520e955e121aca2eb9a45ee6a5'
  end

  depends_on macos: '>= :el_capitan'
  url "https://downloads.puppet.com/mac/puppet/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  bolt_bins = '/opt/puppetlabs/bolt/bin'
  caveats %Q(
    Puppet Bolt binaries are installed in #{bolt_bins}, which is sourced by an /etc/paths.d entry.
    #{bolt_bins} may not be included in your current $PATH but should be included in new shells.
  )

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
