class DtachRev < Formula
  desc "Detach/reattach terminal sessions with scrollback buffer and idle callbacks"
  homepage "https://github.com/bmills23/dtach-rev"
  url "https://github.com/bmills23/dtach-rev/archive/refs/tags/v0.9.2.tar.gz"
  sha256 "160b9eda50ca9d75af8a364256d13a8ea883b5b9e73a2c44d714a9f51ead6a0d"
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
