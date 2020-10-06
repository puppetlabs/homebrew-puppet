class Relay < Formula
  version "v4.2.2"
  homepage "https://relay.sh/"
  url "https://github.com/puppetlabs/relay/releases/download/#{version}/relay-#{version}-darwin-amd64", 
    :using => :nounzip
  sha256 "6cecd5b093bd09fa0805325c0953cbc2c8ec6d28cabb90e15a227e95fed9da1c"

  def install
    bin.install "relay-#{version}-darwin-amd64" => "relay"
  end

  test do
    system "#{bin}/relay", "help"
  end

end
