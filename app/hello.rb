class Hello < RubyJersey::Resource
  GET()
  Produces("text/plain")
  Returns(java.lang.String)
  def hello
    "Hello Ruby Jersey!"
  end

  GET()
  Path("{id}")
  Produces("text/plain")
  Returns(java.lang.String)
  Parameters(java.lang.String)
  ParameterAnnotations(PathParam("id"))
  def personal_hello(msg)
    "Hello #{msg}!"
  end
end
