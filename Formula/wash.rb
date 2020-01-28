class Wash < Formula
  version = "0.19.0"
  homepage "https://puppetlabs.github.io/wash"
  url "https://github.com/puppetlabs/wash/archive/#{version}.tar.gz"
  sha256 "bd7f84aebb61ffadac481154047b03c09b95a6632e0513ce5b43bcdac0fddfb4"

  head "https://github.com/puppetlabs/wash.git"

  depends_on "go" => [:build, "1.12.0"]
  option "with-coreutils", "Enables relative paths in the shell prompt using realpath"
  depends_on "coreutils" => :recommended

  def install
    system "go build -ldflags='-w -s -X github.com/puppetlabs/wash/cmd/version.BuildVersion=#{version}'"
    bin.install "wash" => "wash"
  end

  test do
    system "#{bin}/wash", "help"
  end

  def caveats
    "Wash depends on libfuse. You can install it with `brew cask install osxfuse`."
  end
end
