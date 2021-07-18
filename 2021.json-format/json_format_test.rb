require "json"
require "minitest/spec"
require "minitest/autorun"
require_relative "json_format.rb"

describe "The thing" do
  it "works" do
    [
      "t.array.empty.json",
      "t.array.simple.json",
      "t.array.nested.json",
      "t.object.empty.json",
      "t.object.simple.json",
      "t.json-org1.json",
      "t.json-org2.json",
      "t.json-org3.json",
      "t.json-org4.json",
      "t.json-org5.json"
    ].each do |t|
      json_str = File.read(t)
      json_obj = JSON.parse(json_str)
      output   = JSONFormat.format(json_obj)
      assert_equal json_str, output, "❌: #{t} "
    end
  end
end
