class Relay < Formula
  version "v4.0.6"
  homepage "https://relay.sh/"
  url "https://github.com/puppetlabs/relay/releases/download/#{version}/relay-#{version}-darwin-amd64", 
    :using => :nounzip
  sha256 "62a4ebf79200a6fb706afe6e2956d966afedafcd6c02bddb959bb1dc02213978"

  def install
    bin.install "relay-#{version}-darwin-amd64" => "relay"
  end

  test do
    system "#{bin}/relay", "help"
  end

end
