require 'java'
require 'jruby/core_ext'

class Annotated
  def self.inherited(child)
    @children ||= []
    @children << child
  end

  def self.method_added(name)
    if @method_annotations
      add_method_annotation name.to_s, @method_annotations
      @method_annotations = nil
    end
    if @method_signature
      add_method_signature name.to_s, @method_signature
      @method_signature = nil
    end
    super
  end

  def self.method_annotations
    @method_annotations ||= {}
  end

  def self.Parameters(*param_types)
    @method_signature = param_types
  end

  def self.Returns(clazz)
    @method_signature ||= []
    @method_signature.unshift clazz
  end

  def self.load!
    java.lang.System.setProperty("jruby.dump.reified.classes", ".")
    @children.each {|c| c.become_java!} if @children
  end
end
