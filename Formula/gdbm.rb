class Gdbm < Formula
  desc "GNU database manager"
  homepage "https://www.gnu.org.ua/software/gdbm/"
  url "https://ftpmirror.gnu.org/gdbm/gdbm-1.26.tar.gz"
  mirror "https://ftp.gnu.org/gnu/gdbm/gdbm-1.26.tar.gz"
  mirror "http://ftp.gnu.org/gnu/gdbm/gdbm-1.26.tar.gz"
  sha256 "6a24504a14de4a744103dcb936be976df6fbe88ccff26065e54c1c47946f4a5e"
  license "GPL-3.0-or-later"
  compatibility_version 1

  # Upstream bottles, mirrored internally. The sonoma bottle is poured on macOS 14 and newer Intel.
  bottle do
    root_url "https://artifactory.delivery.puppetlabs.net/artifactory/generic/buildsources/macos/homebrew"
    sha256 cellar: :any, arm64_tahoe:   "665930fdbccbaf710705195a7ee89f3b3e04122e11d585f6a50cac2ff2595296"
    sha256 cellar: :any, arm64_sequoia: "1843430b18014e91e8ad64b5ff33bef23e44350d75c6cdfa2d640f32511cc5a4"
    sha256 cellar: :any, arm64_sonoma:  "9308eb5eec8ac7b9186357ea3bc654be370735614b03c79ef4ffb8c55a5ea3a4"
    sha256 cellar: :any, sequoia:       "cd2206fce6d0ecaaa40620b3aa6e73d5b227f444c10a2e9032813a50b6f89a52"
    sha256 cellar: :any, sonoma:        "bc3db54835cc359259f83e3d0b3063a9f961e6c318708fdf98c9f159789266af"
  end
end
