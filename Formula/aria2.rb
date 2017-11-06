class Aria2 < Formula
  desc "Download with resuming and segmented downloading, dig para version, removed some restrictions"
  homepage "https://github.com/digpara/aria2"
  url "https://github.com/digpara/aria2/archive/dp.0.1.tar.gz"
  head "https://github.com/digpara/aria2.git"

  depends_on "pkg-config" => :build
  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "libssh2"

  needs :cxx11

  def install
    ENV.cxx11

    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
      --with-appletls
      --without-openssl
      --without-gnutls
      --without-libgmp
      --without-libnettle
      --without-libgcrypt
      --with-libssh2
    ]

    system "./configure", *args
    system "make", "install"

    bash_completion.install "doc/bash_completion/aria2c"
  end

  test do
    system "#{bin}/aria2c", "https://brew.sh/"
    assert_predicate testpath/"index.html", :exist?, "Failed to create index.html!"
  end
end
