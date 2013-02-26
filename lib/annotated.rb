require 'java'
require 'jruby/core_ext'

# Aliases for compatibility with JRuby 1.6 and below
begin
  class Class
    alias add_parameter_annotation add_parameter_annotations
    alias add_class_annotations add_class_annotation
  end
rescue Exception
end

class AnnotatedJavaClasses
  def self.inherited(child)
    if self == AnnotatedJavaClasses
      @classes ||= []
      @classes << child
    else
      AnnotatedJavaClasses.inherited(child)
    end
  end

  def self.method_added(name)
    if @method_annotations
      add_method_annotation name.to_s, @method_annotations
      @method_annotations = nil
    end
    if @parameter_annotations
      add_parameter_annotation name.to_s, @parameter_annotations
      @parameter_annotations = nil
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

  def self.parameter_annotations
    @parameter_annotations ||= []
  end

  def self.Parameters(*param_types)
    @method_signature ||= []
    @method_signature += param_types
  end

  def self.Returns(clazz)
    @method_signature ||= []
    @method_signature.unshift clazz
  end

  def self.ParameterAnnotations(*params)
    @parameter_annotations = params
  end

  def self.create!
    @classes.each {|c| c.become_java!(".")} if @classes
  end
end
