class Libunistring < Formula
  desc "C string library for manipulating Unicode strings"
  homepage "https://www.gnu.org/software/libunistring/"
  url "https://ftpmirror.gnu.org/gnu/libunistring/libunistring-1.3.tar.gz"
  mirror "https://ftp.gnu.org/gnu/libunistring/libunistring-1.3.tar.gz"
  mirror "http://ftp.gnu.org/gnu/libunistring/libunistring-1.3.tar.gz"
  sha256 "8ea8ccf86c09dd801c8cac19878e804e54f707cf69884371130d20bde68386b7"
  license any_of: ["GPL-2.0-only", "LGPL-3.0-or-later"]

  # Upstream bottles, mirrored internally. The sonoma bottle is poured on macOS 14 and newer Intel.
  bottle do
    root_url "https://artifactory.delivery.puppetlabs.net/artifactory/generic/buildsources/macos/homebrew"
    rebuild 1
    sha256 cellar: :any, arm64_tahoe:   "640e9f79172d25b6b74cdc9084d9bc5fdee2afd6e6412b732852d14807ceb645"
    sha256 cellar: :any, arm64_sequoia: "0cc291557b61cc7d02936f50d8ee84eb109b5ee4ebc5070175b6eb78d2210d9f"
    sha256 cellar: :any, arm64_sonoma:  "97bdae1108cd8f835cbebd34e29aad5079582c12b670aa55ca4513a68857aae7"
    sha256 cellar: :any, sonoma:        "464e4554828d664abca64dc50d62f99d100d72d54907c6bb8829ec4029e63656"
  end
end

