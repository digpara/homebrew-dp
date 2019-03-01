class Ffmpeg < Formula
  desc "Play, record, convert, and stream audio and video"
  homepage "https://ffmpeg.org/"
  url "https://ffmpeg.org/releases/ffmpeg-4.1.1.tar.xz"
  sha256 "373749824dfd334d84e55dff406729edfd1606575ee44dd485d97d45ea4d2d86"
  head "https://github.com/FFmpeg/FFmpeg.git"

  depends_on "nasm" => :build
  depends_on "pkg-config" => :build
  
  depends_on "openssl"

  def install
    args = %W[
      --prefix=#{prefix}
      --enable-static
      --cc=#{ENV.cc}
      --host-cflags=#{ENV.cflags}
      --host-ldflags=#{ENV.ldflags}
      --enable-videotoolbox
      --disable-libjack
      --disable-indev=jack
      --disable-gpl 
      --disable-nonfree
      --disable-version3
      --enable-pthreads
      --enable-protocols
      --enable-network
      --enable-avresample
      --disable-ffmpeg
      --disable-ffplay
      --disable-ffprobe
      --disable-avdevice
      --enable-swscale
      --enable-avfilter
      --enable-zlib
      --enable-asm
      --disable-doc
      --disable-bzlib
      --disable-programs
      --enable-pic
      --enable-openssl
      --enable-runtime-cpudetect
      --disable-gray
      --disable-manpages
      --disable-podpages
      --disable-txtpages 
      --disable-postproc
      --disable-vaapi
      --disable-iconv
      --disable-dxva2
      --disable-devices
      --disable-stripping
      --enable-encoders
      --enable-muxers
      --enable-avcodec
      --enable-avformat
      --enable-avutil
      --enable-swresample
    ]

    system "./configure", *args
    system "make", "install"
  end

end
