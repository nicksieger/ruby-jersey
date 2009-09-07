class Hello < RubyJersey::Resource
  GET()
  Produces("text/plain")
  Returns(java.lang.String)
  def hello
    "Hello Ruby Jersey!"
  end
end
