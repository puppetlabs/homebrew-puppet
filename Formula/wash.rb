class Wash < Formula
  version = "0.3.1"
  homepage "https://puppetlabs.github.io/wash"
  url "https://github.com/puppetlabs/wash/archive/#{version}.tar.gz"
  sha256 "cf7c4f97cfd183d02d0fe4558e63c0fd110ac1651d824f18c024e9cd9b6c5e83"

  head "https://github.com/puppetlabs/wash.git"

  depends_on "go" => [:build, "1.12.0"]

  def install
    system "go build -ldflags='-w -s -X github.com/puppetlabs/wash/cmd.version=#{version}'"
    bin.install "wash" => "wash"
  end

  test do
    system "#{bin}/wash", "help"
  end

  def caveats
    "Wash depends on libfuse. You can install it with `brew cask install osxfuse`."
  end
end
