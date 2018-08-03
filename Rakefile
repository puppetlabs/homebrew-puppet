require 'digest'
require 'erb'
require 'net/http'
require 'tmpdir'

def fetch(http, req, limit = 10)
  raise 'too many HTTP redirects' if limit == 0
  resp = http.get(req)

  case resp
  when Net::HTTPSuccess then resp
  when Net::HTTPRedirection then fetch(http, resp['location'], limit - 1)
  else raise "Request for listing failed: #{resp.body}"
  end
end

namespace :brew do
  desc 'Update SHAs for a specific package: rake brew:cask[puppet-bolt]'
  task :cask, [:pkg] do |task, args|
    pkg = args[:pkg]
    os_versions = { '10.11' => :el_capitan, '10.12' => :sierra, '10.13' => :high_sierra }
    latest_version = nil

    host = 'downloads.puppet.com'
    path_pre = '/mac/puppet5/'
    shas = Net::HTTP.start(host, use_ssl: true) do |http|
      latest_version = os_versions.keys.map do |ver|
        resp = fetch(http, "#{path_pre}#{ver}/x86_64")
        raise "Request for listing failed: #{resp.body}" unless resp.kind_of? Net::HTTPSuccess
        resp.body.scan(/#{pkg}-(\d+\.\d+\.\d+(?:\.\d+)?)-\d\.osx#{ver}\.dmg/).map(&:first).sort.last
      end.uniq
      raise "Expected a single latest version: #{latest_version}" unless latest_version.count == 1
      latest_version = latest_version.first
      puts "Getting SHA256 sums for #{pkg} #{latest_version}"

      os_versions.keys.map do |ver|
        resp = http.get("/mac/puppet5/#{ver}/x86_64/#{pkg}-#{latest_version}-1.osx#{ver}.dmg")
        Digest::SHA256.hexdigest(resp.body)
      end
    end

    url = "https://#{host}#{path_pre}"+'#{MacOS.version}/x86_64/'+pkg+'-#{version}-1.osx#{MacOS.version}.dmg'
    cask = ERB.new(File.read(File.join(__dir__, 'templates', "#{pkg}.rb.erb")), 0, '-')
    File.write(File.join(__dir__, 'Casks', "#{pkg}.rb"), cask.result(binding))
  end
end

