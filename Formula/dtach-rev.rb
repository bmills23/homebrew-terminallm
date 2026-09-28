class DtachRev < Formula
  desc "Detach/reattach terminal sessions with scrollback buffer and idle callbacks"
  homepage "https://github.com/bmills23/dtach-rev"
  url "https://github.com/bmills23/dtach-rev/archive/refs/tags/v0.9.9.tar.gz"
  sha256 "2b115edf5c2f0b8828111ba01c3cff375d5830790ccb7b5c7f438edd22882d62"
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
