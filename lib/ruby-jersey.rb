Dir[File.dirname(__FILE__) + '/*.jar'].each {|j| require j}

require 'annotated'

module RubyJersey
  class Resource < Annotated
    def self.inherited(child)
      super
      child.add_class_annotation javax.ws.rs.Path => {"value" => child.name.downcase}
    end

    def self.GET
      method_annotations[javax.ws.rs.GET] = {}
    end

    def self.Produces(*types)
      method_annotations[javax.ws.rs.Produces] = {"value" => types.to_java(:string)}
    end
  end
end
