class SkyjosOpenssl < Formula
  desc "SSL/TLS cryptography library"
  homepage "https://openssl.org/"
  url "https://www.openssl.org/source/openssl-1.0.2q.tar.gz"
  mirror "https://dl.bintray.com/homebrew/mirror/openssl--1.0.2q.tar.gz"
  mirror "https://www.mirrorservice.org/sites/ftp.openssl.org/source/openssl-1.0.2q.tar.gz"
  sha256 "5744cfcbcec2b1b48629f7354203bc1e5e9b5466998bbccc5b5fcde3b18eb684"

  def install
    ENV.delete("PERL")
    ENV.delete("PERL5LIB")
    ENV.deparallelize

    args = %W[
      --prefix=#{prefix}
      --openssldir=#{openssldir}
      no-ssl2
      no-ssl3
      no-zlib
      darwin64-x86_64-cc
      no-share
    ]

    system "perl", "./Configure", *args
    system "make", "depend"
    system "make"
    system "make", "install"
  end

  def openssldir
    etc/"openssl"
  end

end
