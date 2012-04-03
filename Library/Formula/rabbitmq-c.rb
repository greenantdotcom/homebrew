require 'formula'

class RabbitmqC < Formula
  depends_on 'mercurial'
  url 'http://hg.rabbitmq.com/rabbitmq-c/', :using => :hg
  version '0.9.1'
  
  VERSION_271 = '82b642218623'
  
  def install
    
    # We now need to clone the codegen module
    
    system "/usr/local/bin/hg", "clone", "-r", VERSION_271, "http://hg.rabbitmq.com/rabbitmq-codegen/", "codegen"
    
    # Now we have to autoreconf
    
    system "autoreconf", "-fi"
    
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    
    system "make", "tests"
    
    system "make install" # if this fails, try separate make/make install steps
  end
end
