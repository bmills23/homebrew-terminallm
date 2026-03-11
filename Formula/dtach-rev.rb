class DtachRev < Formula
  desc "Detach/reattach terminal sessions with 256KB scrollback buffer"
  homepage "https://github.com/bmills23/dtach-rev"
  url "https://github.com/bmills23/dtach-rev/archive/refs/tags/v0.9.1.tar.gz"
  sha256 "e8db38bd22382bd495c13016c5d551b69d08bdf8c691cd41be40296f512fb51d"
  license "GPL-2.0-or-later"

  conflicts_with "dtach", because: "both install a `dtach` binary"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    bin.install "dtach"
    man1.install "dtach.1"
  end

  test do
    assert_match "scrollback", shell_output("#{bin}/dtach --help 2>&1", 0)
  end
end
