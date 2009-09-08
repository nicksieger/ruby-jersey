$LOAD_PATH.unshift "lib"
require 'ruby-jersey'
require 'app/hello'

import com.sun.grizzly.http.embed.GrizzlyWebServer
import com.sun.grizzly.http.servlet.ServletAdapter
import com.sun.jersey.spi.container.servlet.ServletContainer

AnnotatedJavaClasses.create!

server = GrizzlyWebServer.new(9998)
jersey_adapter = ServletAdapter.new
jersey_adapter.add_init_parameter "com.sun.jersey.config.property.packages", "ruby"
jersey_adapter.context_path = "/jersey"
jersey_adapter.servlet_instance = ServletContainer.new
server.add_grizzly_adapter jersey_adapter
server.start
puts "Server started on http://localhost:9998"

sleep 1 while true
