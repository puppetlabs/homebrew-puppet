require 'digest'
require 'erb'
require 'net/http'
require 'tmpdir'

def fetch(uri, limit = 10)
  # puts "Fetching #{uri}" # Uncomment to debug what URI's are being fetched
  raise 'too many HTTP redirects' if limit == 0
  response = Net::HTTP.get_response(URI(uri))
  case response
  when Net::HTTPSuccess then
    response
  when Net::HTTPRedirection then
    fetch(response['location'], limit - 1)
  else
    raise "Request for listing failed: #{response.body}"
  end
end

PKG_TO_COLLECTIONS = {
  'puppet-bolt' => 'puppet-tools',
  'pdk' => 'puppet-tools'
}

VERSION_TO_CODENAME = {
  '10.10' => :yosemite,
  '10.11' => :el_capitan,
  '10.12' => :sierra,
  '10.13' => :high_sierra,
  '10.14' => :mojave,
  '10.15' => :catalina,
  '11'    => :big_sur,
  '12'    => :monterey,
}

LATEST_PE = '2021'

CLIENT_TOOLS = {
  '2021'   => '21.1.0',
  '2019.8' => '19.8.6',
}

def operating_systems(collection, pkg = nil)
  if %w[puppet-bolt].include?(pkg)
    return %w[10.11 10.12 10.13 10.14 10.15 11 12]
  end

  case collection
  when 'pct2019.8'
    %w[10.14 10.15]
  when 'pct2021'
    %w[10.14 10.15]
  when 'puppet7'
    %w[10.15 11 12]
  when 'puppet'
    %w[10.15 11 12]
  else
    %w[10.11 10.12 10.13 10.14 10.15 11 12]
  end
end

namespace :brew do
  desc 'Update SHAs for a specific package: rake brew:cask[puppet-bolt] or rake brew:cask[puppet-agent,5]'
  task :cask, [:pkg, :collection] do |task, args|
    pkg = args[:pkg]
    collection = PKG_TO_COLLECTIONS[pkg] || "puppet#{args[:collection]}"
    cask = pkg
    cask += '-' + args[:collection] if args[:collection]
    os_versions = operating_systems(collection, pkg)

    path_pre = "https://downloads.puppet.com/mac/#{collection}/"

    latest_versions = os_versions.map do |os_ver|
      resp = fetch("#{path_pre}#{os_ver}/x86_64/")
      raise "Request for listing failed: #{resp.body}" unless resp.kind_of? Net::HTTPSuccess
      versions = resp.body.scan(/#{pkg}-(\d+\.\d+\.\d+(?:\.\d+)?)-\d\.osx#{os_ver}\.dmg/).map(&:first).uniq
      versions.sort_by! {|version| Gem::Version.new(version)}
      versions.last
    end
    puts "Getting SHA256 sums for #{pkg}: #{latest_versions}"

    package_triples = os_versions.zip(latest_versions).map do |os_ver, pkg_ver|
      if pkg_ver
        resp = fetch("#{path_pre}#{os_ver}/x86_64/#{pkg}-#{pkg_ver}-1.osx#{os_ver}.dmg")
        x86_64_sha = Digest::SHA256.hexdigest(resp.body)
        arm64_sha = 'nil'
        if pkg == 'puppet-agent' && os_ver.to_i >= 11
          resp_arm64 = fetch("#{path_pre}#{os_ver}/arm64/#{pkg}-#{pkg_ver}-1.osx#{os_ver}.dmg")
          arm64_sha  = Digest::SHA256.hexdigest(resp_arm64.body)
        end
        [os_ver, pkg_ver, x86_64_sha, arm64_sha]
      end
    end.compact

    url = "#{path_pre}"+'#{os_ver}/#{arch}/'+pkg+'-#{version}-1.osx#{os_ver}.dmg'

    source_stanza = ERB.new(File.read(File.join(__dir__, 'templates', "source_stanza.erb")), 0, '-').result(binding)

    cask_erb = ERB.new(File.read(File.join(__dir__, 'templates', "#{cask}.rb.erb")), 0, '-')
    File.write(File.join(__dir__, 'Casks', "#{cask}.rb"), cask_erb.result(binding))
  end

  desc 'Update SHAs for pe-client-tools: rake brew:pe_client_tools rake brew:pe_client_tools[2019.3]'
  task :pe_client_tools, [:collection] do |task, args|
    pkg = 'pe-client-tools'
    collection = args[:collection] || LATEST_PE
    version = CLIENT_TOOLS[collection]
    cask = pkg
    cask += '-' + args[:collection] if args[:collection]
    os_versions = operating_systems("pct#{collection}")

    pe_ver = CLIENT_TOOLS[collection].dup.prepend('20')
    path_pre = "https://pm.puppet.com/pe-client-tools/#{pe_ver}/"

    latest_versions = os_versions.map do |os_ver|
      version
    end

    package_triples = os_versions.zip(latest_versions).map do |os_ver, pkg_ver|
      if pkg_ver
        puts "Getting SHA256 sum for #{pkg} #{pkg_ver} on macOS #{os_ver}"
        resp = fetch("#{path_pre}#{pkg_ver}/repos/apple/#{os_ver}/PC1/x86_64/#{pkg}-#{pkg_ver}-1.osx#{os_ver}.dmg")
        sha = Digest::SHA256.hexdigest(resp.body)
        [os_ver, pkg_ver, sha]
      end
    end.compact

    url = "#{path_pre}"+'#{version}/repos/apple/#{os_ver}/PC1/x86_64/'+pkg+'-#{version}-1.osx#{os_ver}.dmg'

    source_stanza = ERB.new(File.read(File.join(__dir__, 'templates', "source_stanza.erb")), 0, '-').result(binding)

    cask_erb = ERB.new(File.read(File.join(__dir__, 'templates', "#{cask}.rb.erb")), 0, '-')
    File.write(File.join(__dir__, 'Casks', "#{cask}.rb"), cask_erb.result(binding))
  end
end
