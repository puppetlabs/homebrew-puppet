cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.19.0'
    sha256 '0bff8e825dc6be4ced26ad35e37891fb690c26b851755a484fc0bbb495d4d68f'
  when '10.12'
    os_ver = '10.12'
    version '1.19.0'
    sha256 '26bd2c2a138165d830eefbc52e0454aae859ce5d73306d442b0e02ae21943205'
  when '10.13'
    os_ver = '10.13'
    version '1.19.0'
    sha256 'dd2c293ca16653886ff523feb1fe53428703f53538b9ed48d56230dad00b7d4b'
  else
    os_ver = '10.14'
    version '1.19.0'
    sha256 '2023fc1eee602c50bcc3699390a58fd704d8555c005ae057dda27e820e95d1dd'
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
