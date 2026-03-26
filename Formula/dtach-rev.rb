class DtachRev < Formula
  desc "Detach/reattach terminal sessions with scrollback buffer and idle callbacks"
  homepage "https://github.com/bmills23/dtach-rev"
  url "https://github.com/bmills23/dtach-rev/archive/refs/tags/v0.9.5.tar.gz"
  sha256 "80f481c3ff259f14006b1020a53ef0484deb03e35804de8d7e27366b42ad6354"
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
