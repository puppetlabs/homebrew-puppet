class Perl < Formula
  desc "Highly capable, feature-rich programming language"
  homepage "https://www.perl.org/"
  url "https://www.cpan.org/src/5.0/perl-5.40.2.tar.xz"
  sha256 "0551c717458e703ef7972307ab19385edfa231198d88998df74e12226abf563b"
  license any_of: ["Artistic-1.0-Perl", "GPL-1.0-or-later"]
  head "https://github.com/perl/perl5.git", branch: "blead"

  # Upstream bottles, mirrored internally. The sonoma bottle is poured on macOS 14 and newer Intel.
  bottle do
    root_url "https://artifactory.delivery.puppetlabs.net/artifactory/generic/buildsources/macos/homebrew"
    sha256 arm64_tahoe:   "500dcc292ff8387aa3044c31401879dd47c4e653e5573b448c7edfbe3333cd99"
    sha256 arm64_sequoia: "c984a79cf9dba490a830081f3587349723c8c156b79dc7b6c159360624181299"
    sha256 arm64_sonoma:  "3900203e58329e754f54397b61b9120a892f70d61ba48835b90b2fde45c1ecc0"
    sha256 sonoma:        "99d35f068ce3f224448fe8a2b6d11639a0a07a5df1213907337add51e5700bc7"
  end

  depends_on "puppetlabs/puppet/berkeley-db@5" # keep berkeley-db < 6 to avoid AGPL-3.0 restrictions
  depends_on "puppetlabs/puppet/gdbm"

  uses_from_macos "expat"
  uses_from_macos "libxcrypt"

  # Prevent site_perl directories from being removed
  skip_clean "lib/perl5/site_perl"
end
