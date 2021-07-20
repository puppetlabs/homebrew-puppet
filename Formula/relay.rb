class Relay < Formula
  version "v4.4.2"
  homepage "https://relay.sh/"
  url "https://github.com/puppetlabs/relay/releases/download/#{version}/relay-#{version}-darwin-amd64", 
    :using => :nounzip
  sha256 "88facbb232d1b29683317c97bd3fc55848b198a8b759bb3e73d00b4615636fa2"

  def install
    bin.install "relay-#{version}-darwin-amd64" => "relay"
  end

  test do
    system "#{bin}/relay", "help"
  end

end
