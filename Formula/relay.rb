class Relay < Formula
  version "v4.2.1"
  homepage "https://relay.sh/"
  url "https://github.com/puppetlabs/relay/releases/download/#{version}/relay-#{version}-darwin-amd64", 
    :using => :nounzip
  sha256 "4cd85733f0169422768aa36c201cd9c82adcea358d8e7ab54d8cf1ba24e9a965"

  def install
    bin.install "relay-#{version}-darwin-amd64" => "relay"
  end

  test do
    system "#{bin}/relay", "help"
  end

end
