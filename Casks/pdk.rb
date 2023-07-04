cask 'pdk' do
  arch = 'x86_64'
  case MacOS.version
  when '11'
    os_ver = '11'
    version '3.0.0.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '6874cf28e9f440e38d9f0c9da991e7d6b6336b9489d1885356122c8c773a9f17'
    end
  else
    os_ver = '12'
    version '3.0.0.0'
    if arch == 'x86_64'
      sha256 'f8406b32dd8c156404663021595f4a6a503c0de568726e5b46ef92c2ca1568e6'
    elsif arch == 'arm64'
      sha256 'nil'
    end
  end

  depends_on macos: '>= :big_sur'
  url "https://downloads.puppet.com/mac/puppet-tools/#{os_ver}/#{arch}/pdk-#{version}-1.osx#{os_ver}.dmg"
  pkg "pdk-#{version}-1-installer.pkg"

  name 'Puppet Development Kit'
  homepage 'https://github.com/puppetlabs/pdk'

  pdk_bins = '/opt/puppetlabs/pdk/bin'
  caveats %Q(
    PDK binaries are installed in #{pdk_bins}, which is sourced by an /etc/paths.d entry.
    #{pdk_bins} may not be included in your current $PATH but should be included in new shells.
  )

  uninstall pkgutil: 'com.puppetlabs.pdk'
end
