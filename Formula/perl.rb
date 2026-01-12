class Perl < Formula
  desc "Highly capable, feature-rich programming language"
  homepage "https://www.perl.org/"
  url "https://www.cpan.org/src/5.0/perl-5.40.2.tar.xz"
  sha256 "0551c717458e703ef7972307ab19385edfa231198d88998df74e12226abf563b"
  license any_of: ["Artistic-1.0-Perl", "GPL-1.0-or-later"]
  head "https://github.com/perl/perl5.git", branch: "blead"

  bottle do
    sha256 arm64_tahoe:   "500dcc292ff8387aa3044c31401879dd47c4e653e5573b448c7edfbe3333cd99"
    sha256 arm64_sequoia: "c984a79cf9dba490a830081f3587349723c8c156b79dc7b6c159360624181299"
    sha256 arm64_sonoma:  "3900203e58329e754f54397b61b9120a892f70d61ba48835b90b2fde45c1ecc0"
    sha256 arm64_ventura: "f695d132859207d5406bb2ec7f5c522df7085065da91b2fdee94c53d090fc8b0"
    sha256 sonoma:        "99d35f068ce3f224448fe8a2b6d11639a0a07a5df1213907337add51e5700bc7"
    sha256 ventura:       "0c121d939ac294ca374240fa2aa755bb7f1debf2545961552e30ab464b337f30"
    sha256 arm64_linux:   "6c2b1d9010669da23fe973949dc0d714bdff92d2cbd006d52a0d4736e743ffca"
    sha256 x86_64_linux:  "018804347f6d231ea705e0b43c0d9ef6f996d9432697146dcce7fb65a8c3787f"
  end

  depends_on "berkeley-db@5" # keep berkeley-db < 6 to avoid AGPL-3.0 restrictions
  depends_on "gdbm"

  uses_from_macos "expat"
  uses_from_macos "libxcrypt"

  # Prevent site_perl directories from being removed
  skip_clean "lib/perl5/site_perl"
end
