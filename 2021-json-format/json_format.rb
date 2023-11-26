require "json"

class JSONFormat
  def self.format(json_obj)
    unless json_obj.is_a?(Array) || json_obj.is_a?(Hash)
      raise "Expected json_obj to be: Array or Hash"
    end
    self.new().format_value(json_obj)
  end
  
  def initialize
    @out = ""
    @indent_size = 2
    @indent_level = 0
  end
  
  def format_value(value, indent_first: true)
    indent() if indent_first
    case value
    when Hash then format_hash(value)
    when Array then format_array(value)
    when String then emit('"' + value + '"')
    when Numeric, TrueClass, FalseClass then emit(value.to_s)
    when nil then emit("null")
    else
      raise "ERROR: Want: `value` to be JSON value. Got: #{value.class}"
    end
  end

  def format_hash(hash)
    return emit("{}") if hash.empty?

    emit("{\n")
    @indent_level += 1

    hash.each_with_index do |kv, i|
      key, value = kv
      indent('"' + key + '"')
      emit(": ")
      format_value(value, indent_first: false)
      emit(",") if i != hash.size - 1
      emit("\n")
    end

    @indent_level -= 1
    indent("}")
  end

  def format_array(array)
    return emit("[]") if array.empty?

    emit("[\n")
    @indent_level += 1

    array.each_with_index do |obj, i|
      format_value(obj)
      emit(",") if i != array.size - 1
      emit("\n")
    end

    @indent_level -= 1
    indent("]")
  end
  
  def indent(str="")
    emit((" " * @indent_size * @indent_level) + str)
  end
  
  def emit(str)
    @out << str
  end
end
