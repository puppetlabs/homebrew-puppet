cask 'puppet-agent-7' do
  if MacOS.version < :catalina
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '7.33.0'
    if arch == 'arm64'
      sha256 'd02bf5990ba491eb2fd462445f19d6ea34a57e20943c4e23ddbb919b06a227f1'
    elsif arch == 'x86_64'
      sha256 '6a9b1d218d5ddc2ef755d264fa1bcad60a0c6cd24ff199d592dcc48e4733e573'
    end
  when '12'
    os_ver = '12'
    version '7.33.0'
    if arch == 'arm64'
      sha256 'b5167df14668897dd895facee9eb5ea69ddb73156e1ed5a405662e7c4ef9bd17'
    elsif arch == 'x86_64'
      sha256 '59a7dab1915c37b0d6bd73d225d45b9e6373b1b50230ed385ae9e4d2a8110528'
    end
  when '13'
    os_ver = '13'
    version '7.33.0'
    if arch == 'arm64'
      sha256 '0c64d9956070d5f6097f8db35e09209860f1a342c248967f976b9eb0858e8e4c'
    elsif arch == 'x86_64'
      sha256 'a3e1df57c1765e3d958c2fb9114bb2e1065b4f1a231f70cce7b177331a8bb50a'
    end
  else
    os_ver = '14'
    version '7.33.0'
    if arch == 'x86_64'
      sha256 '6d895535a9cc13b1db5bf38d60e020c01b5dcb50895282dd7c7c6b16196a3a60'
    elsif arch == 'arm64'
      sha256 'eec6814f4592c709062417e3499208f3dac2a9159f7efffdaed0e575d250e2a3'
    end
  end

  depends_on macos: '>= :big_sur'
  url "https://downloads.puppet.com/mac/puppet7/#{os_ver}/#{arch}/puppet-agent-#{version}-1.osx#{os_ver}.dmg"
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
