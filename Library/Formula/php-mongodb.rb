require 'formula'

class PhpMongodb <Formula
  url 'http://pecl.php.net/get/mongo-1.0.11.tgz'
  homepage 'http://pecl.php.net/package/mongo'
  md5 'eb5968413a4a514fd8c867512c9de80d'

  # depends_on 'cmake'

  def install
    Dir.chdir "mongo-#{version}" do
      system "phpize"
      system "./configure", "--prefix=#{prefix}"
      system "make"

      prefix.install 'modules/mongo.so'
    end
  end

  def caveats
      <<-EOS
$ phpize
$ ./configure
$ make
$ sudo make install

Then add

extension=mongo.so

to your php.ini file.

See http://www.mongodb.org/display/DOCS/PHP+Language+Center for information on configuration options.
      EOS
  end
end
