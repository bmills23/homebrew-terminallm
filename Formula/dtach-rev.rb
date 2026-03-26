class DtachRev < Formula
  desc "Detach/reattach terminal sessions with scrollback buffer and idle callbacks"
  homepage "https://github.com/bmills23/dtach-rev"
  url "https://github.com/bmills23/dtach-rev/archive/refs/tags/v0.9.5.tar.gz"
  sha256 "ae02ecf0c8deceb837df5289ac0ac76672241a123ce782c34797660248d59c34"
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
