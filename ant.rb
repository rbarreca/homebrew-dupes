require 'formula'

class Ant < Formula
  url 'http://www.gtlib.gatech.edu/pub/apache/ant/binaries/apache-ant-1.8.4-bin.zip'
  homepage 'http://ant.apache.org/'
  md5 'ca632528c35b8a335edd4e2064f7129e'

  def install
    rm Dir['bin/*.{bat,cmd,dll,exe}']
    libexec.install Dir['*']

    bin.mkpath
    Dir["#{libexec}/bin/*"].each do |f|
      ln_s f, bin+File.basename(f)
    end
  end

  def test
    system "ant -version"
  end
end
