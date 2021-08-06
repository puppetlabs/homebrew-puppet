class Relay < Formula
  version "v4.7.0"
  homepage "https://relay.sh/"
  url "https://github.com/puppetlabs/relay/releases/download/#{version}/relay-#{version}-darwin-amd64", 
    :using => :nounzip
  sha256 "e78333c754d78911dd39a5e561dbefcd47cbb1ac78c8dcfe7ee9e4aaa12629bd"

  def install
    bin.install "relay-#{version}-darwin-amd64" => "relay"
  end

  test do
    system "#{bin}/relay", "help"
  end

end
