class Libtool < Formula
  desc "Generic library support script"
  homepage "https://www.gnu.org/software/libtool/"
  url "https://ftpmirror.gnu.org/libtool/libtool-2.6.2.tar.xz"
  mirror "https://ftp.gnu.org/gnu/libtool/libtool-2.6.2.tar.xz"
  sha256 "2ef1067c16c97db930fd740cc9bc3d3ba9a583804ae5ac42cc3e8719e49e191e"
  license "GPL-2.0-or-later"
  compatibility_version 1

  # Upstream bottles, mirrored internally. The sonoma bottle is poured on macOS 14 and newer Intel.
  bottle do
    root_url "https://artifactory.delivery.puppetlabs.net/artifactory/generic/buildsources/macos/homebrew"
    sha256 cellar: :any, arm64_tahoe:   "719ae9c4597d0198ee77da6bb09dfcb6f68ae0302330f1a1e61503648e59fdd2"
    sha256 cellar: :any, arm64_sequoia: "86f6495e08630095d0a0a4a8be76d8ba0350985a55ec13fb43a73f5473d2a410"
    sha256 cellar: :any, arm64_sonoma:  "6d51bf4ccdbc2a0cb7c23d71edc885130c955193ce6f388ab77411f8ebd4305a"
    sha256 cellar: :any, tahoe:         "c94ba9b047fa5744349911cd632fec5b88cd366991bb39cb06fe018d166a0a39"
    sha256 cellar: :any, sequoia:       "205e69efbbd83ca9ff421c98a0063bd20b64690b44248d0398bd6deb941cf81b"
    sha256 cellar: :any, sonoma:        "616479dd74d4824d290395c2551ce07c69a715b92bb3901c1438ad734e2e45d0"
  end

  depends_on "puppetlabs/puppet/m4"
end
