cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.40.0'
    sha256 'e6a82581c7140d71b855245ce2581a7aecdd9bdf6868834db250fea5921e3837'
  when '10.12'
    os_ver = '10.12'
    version '1.40.0'
    sha256 'c5a27ca181d3222b617913e454202af71332f7a5f9c8ee020da65d7b14f113ca'
  when '10.13'
    os_ver = '10.13'
    version '1.40.0'
    sha256 '76452db8cb6c5fdb739577703f4a86aa06c4ea33e7ed5d5614e40aacb2ddaade'
  else
    os_ver = '10.14'
    version '1.40.0'
    sha256 '0ddfe99d6acc6a66b6de3fcff0d7976f00fe7ef658c51ad7d1cbe0bdf3c083e8'
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
