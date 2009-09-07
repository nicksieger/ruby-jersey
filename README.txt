To run the Jersey example, simply run "jruby main.rb".

Steps taken to build the Ruby-Jersey example from scratch:

1. Download jersey-archive-1.0.3.zip
$ curl -O -L http://download.java.net/maven/2/com/sun/jersey/jersey-archive/1.0.3/jersey-archive-1.0.3.zip
2. Download grizzly-servlet-webserver-1.8.6.4.jar
$ curl -O -L http://download.java.net/maven/2/com/sun/grizzly/grizzly-servlet-webserver/1.8.6.4/grizzly-servlet-webserver-1.8.6.4.jar
3. Put all jars into a new lib/ directory
$ mkdir lib
$ mv grizzly-servlet-webserver-1.8.6.4.jar lib
$ unzip -j -d lib jersey-archive-1.0.3.zip jersey-archive-1.0.3/lib/*

