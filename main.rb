$LOAD_PATH.unshift "lib"
require 'ruby-jersey'
require 'app/foo'

import com.sun.grizzly.http.embed.GrizzlyWebServer
import com.sun.grizzly.http.servlet.ServletAdapter
import com.sun.jersey.spi.container.servlet.ServletContainer

RubyJersey::Resource.load!

server = GrizzlyWebServer.new(9998)
jersey_adapter = ServletAdapter.new
jersey_adapter.add_init_parameter "com.sun.jersey.config.property.packages", "ruby"
jersey_adapter.context_path = "/jersey"
jersey_adapter.servlet_instance = ServletContainer.new
server.add_grizzly_adapter jersey_adapter
server.start
puts "Foo started on http://localhost:9998"

while true
  Thread.pass
  sleep 1
end
