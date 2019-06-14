cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.23.0'
    sha256 '15889fb3e52100dc3f92e6b73ca00f5abb10ca2684d377330c18d027eea58077'
  when '10.12'
    os_ver = '10.12'
    version '1.23.0'
    sha256 'b6f4dbdc8819568706b5b1eedbc4b156517bb9d059b140a4973eedd62ef92e43'
  when '10.13'
    os_ver = '10.13'
    version '1.23.0'
    sha256 'c38f2063de1ff0dcbfa23aa48bc8edfebe1a4f39bc669cdeb953b289676a221c'
  else
    os_ver = '10.14'
    version '1.23.0'
    sha256 '710d53de36ea45ea8b8df4c58ce7a3172bffeedd333cf2bd107badffff3ace39'
  end

  depends_on macos: '>= 10.11'
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
