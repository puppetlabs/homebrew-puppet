cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.27.1'
    sha256 'b06b21182186083871ced11b1e29856ceb54b0d94314b86f47197a5be86e52e2'
  when '10.12'
    os_ver = '10.12'
    version '1.27.1'
    sha256 'f9a46a7a234d656f4c78401da242097318fcf02f9adbc04f695b25599ccdfd3d'
  when '10.13'
    os_ver = '10.13'
    version '1.27.1'
    sha256 '836c2ef4530fdfd0a0a360e321705ee45e77885cad885f0421d64d4caf7b1527'
  else
    os_ver = '10.14'
    version '1.27.1'
    sha256 'd7343a99e7cf43aa8dd5aa7b99188ef51b8d5e2edec6610abdcdec5caa726550'
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
