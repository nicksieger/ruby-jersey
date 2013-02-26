$LOAD_PATH.unshift "lib"
require 'ruby-jersey'
require 'app/hello'

import com.sun.grizzly.http.embed.GrizzlyWebServer
import com.sun.grizzly.http.servlet.ServletAdapter
import com.sun.jersey.spi.container.servlet.ServletContainer
import com.sun.jersey.api.core.DefaultResourceConfig

AnnotatedJavaClasses.create!

server = GrizzlyWebServer.new(9998)
jersey_adapter = ServletAdapter.new
jersey_adapter.context_path = ""
app = DefaultResourceConfig.new(Hello.java_class)
jersey_adapter.servlet_instance = ServletContainer.new(app)

server.add_grizzly_adapter jersey_adapter
server.start
puts "Server started on http://localhost:9998"
puts "Visit http://localhost:9998/hello"

sleep 1 while true
