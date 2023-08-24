cask 'puppet-agent' do
  if MacOS.version < :catalina
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '7.26.0'
    if arch == 'arm64'
      sha256 'eb4398daf3647f6bcc6c387b4049c8d74b634afe45a286335f5d762c6b5c5fbf'
    elsif arch == 'x86_64'
      sha256 'ae6a44ca69a357018445da3089a19627c3330330176991d266bcc9db676c6ae4'
    end
  when '12'
    os_ver = '12'
    version '7.26.0'
    if arch == 'arm64'
      sha256 '21c3103915742b6e8a4ec93f6d55c48e9ec4161809168a53a60819b8c173c6df'
    elsif arch == 'x86_64'
      sha256 'af86dcf0645dbd274a116b9eed069e8f4667b663bbca85524bad5e157d3435c1'
    end
  else
    os_ver = '13'
    version '7.26.0'
    if arch == 'x86_64'
      sha256 '72a03a71c11df96954f169a5ce36c66d94ffedb843ec637338311f8630ecc7b7'
    elsif arch == 'arm64'
      sha256 '72c3539a440fb84c8ece5b6ed84f9f3878b0640c0d40357e6764edc26888f384'
    end
  end

  depends_on macos: '>= :big_sur'
  url "https://downloads.puppet.com/mac/puppet/#{os_ver}/#{arch}/puppet-agent-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-agent-#{version}-1-installer.pkg"

  name 'Puppet Agent'
  homepage "https://puppet.com/docs/puppet/#{version.major_minor}/about_agent.html"

  uninstall launchctl: [
                         'puppet',
                         'pxp-agent',
                       ],
            pkgutil:   'com.puppetlabs.puppet-agent'

  zap trash: [
               '~/.puppetlabs',
               '/etc/puppetlabs',
             ]
end
