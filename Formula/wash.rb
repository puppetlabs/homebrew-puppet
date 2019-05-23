class Wash < Formula
  version = "0.3.0"
  homepage "https://puppetlabs.github.io/wash"
  url "https://github.com/puppetlabs/wash/archive/#{version}.tar.gz"
  sha256 "b9dae027879ac1ee0655f939798ea613af8e1714cbbe832ac1bac3d777c95407"

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
