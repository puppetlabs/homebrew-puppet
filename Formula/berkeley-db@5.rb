class BerkeleyDbAT5 < Formula
  desc "High performance key/value database"
  homepage "https://www.oracle.com/database/technologies/related/berkeleydb.html"
  url "https://download.oracle.com/berkeley-db/db-5.3.28.tar.gz"
  sha256 "e0a992d740709892e81f9d93f06daf305cf73fb81b545afe72478043172c3628"
  license "Sleepycat"
  revision 1

  # Upstream bottles, mirrored internally. The sonoma bottle is poured on macOS 14 and newer Intel.
  bottle do
    root_url "https://artifactory.delivery.puppetlabs.net/artifactory/generic/buildsources/macos/homebrew"
    sha256 cellar: :any, arm64_tahoe:   "a713c6c74511eb18a8dc92c92bbb1b7ca3f1e7c71c3325ab584634e6275ab1bd"
    sha256 cellar: :any, arm64_sequoia: "ac64ff01e9897372c22dd2f9c90a2e5ffc5b66876c243d20d1e107b7c3785fba"
    sha256 cellar: :any, arm64_sonoma:  "7e1f6f67ce491e8636f9095fa45854e7b5720745b909e3b84cad8400b28418fd"
    sha256 cellar: :any, sonoma:        "db128eb3926e9941b0db4aaf52df8848c74194128712f153f46df7810395ff5e"
  end

  keg_only :versioned_formula
end
