class Relay < Formula
  version "v4.6.0"
  homepage "https://relay.sh/"
  url "https://github.com/puppetlabs/relay/releases/download/#{version}/relay-#{version}-darwin-amd64", 
    :using => :nounzip
  sha256 "3deff9636d07e718a3cc5ebd9d094d5013a2880add460d72f39c9e3b43f57407"

  def install
    bin.install "relay-#{version}-darwin-amd64" => "relay"
  end

  test do
    system "#{bin}/relay", "help"
  end

end
