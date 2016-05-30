# -*- coding: utf-8 -*-

require 'helper'

class TestDedotFilter
  RSpec.describe Fluent::DedotFilter do

    CONFIG = %[]

    def create_driver(conf=CONFIG, tag='test')
      Fluent::Test::FilterTestDriver.new(Fluent::DedotFilter, tag)
    end

    def create_filter
      Fluent::DedotFilter.new
    end
    
    before :all do
      Fluent::Test.setup
    end

    before :each do
      @text = "{'key'=>'value'}"
      @filter = create_filter
      @test_driver = create_driver
    end



    context "#de_dot" do

      it "no error because of empty record" do
        expect(@filter.de_dot({})).to eq Hash.new
      end

      it "no error with non recursive hash" do
        @filter.de_dot_nested = false
        test_hash = {}
        test_hash["key"] = "value"
        test_hash["key.dot"] = "value.dot"
        expect_hash = {}
        expect_hash["key"] = test_hash["key"]
        expect_hash["key_dot"] = test_hash["key.dot"]
        expect(@filter.de_dot(test_hash)).to eq expect_hash
      end

      it "no error with recursive hash with de_dot_nested = false" do
        # "child_dot" => {"key"=>"value", "key.dot"=>"value.dot"}
        @filter.de_dot_nested = false
        test_child_hash = {}
        test_child_hash["key"] = "value"
        test_child_hash["key.dot"] = "value.dot"
        test_hash = {}
        test_hash["key"] = "value"
        test_hash["child.dot"] = test_child_hash
        expect_child_hash = {}
        expect_child_hash["key"] = test_child_hash["key"]
        expect_child_hash["key.dot"] = test_child_hash["key.dot"]
        expect_hash = {}
        expect_hash["key"] = "value"
        expect_hash["child_dot"] = expect_child_hash
        expect(@filter.de_dot(test_hash)).to eq expect_hash
      end

      it "no error with recursive hash with de_dot_nested = true" do
        # "child_dot" => {"key"=>"value", "key_dot"=>"value.dot"}
        @filter.de_dot_nested = true
        test_child_hash = {}
        test_child_hash["key"] = "value"
        test_child_hash["key.dot"] = "value.dot"
        test_hash = {}
        test_hash["key"] = "value"
        test_hash["child.dot"] = test_child_hash
        expect_child_hash = {}
        expect_child_hash["key"] = test_child_hash["key"]
        expect_child_hash["key_dot"] = test_child_hash["key.dot"]
        expect_hash = {}
        expect_hash["key"] = "value"
        expect_hash["child_dot"] = expect_child_hash
        expect(@filter.de_dot(test_hash)).to eq expect_hash
      end

      it "no error with recursive array with de_dot_nested = false" do
        # "child_dot" => ["test", "test.dot", {"key"=>"value", "key.dot"=>"value.dot"}]
        @filter.de_dot_nested = false
        test_child_hash = {}
        test_child_hash["key"] = "value"
        test_child_hash["key.dot"] = "value.dot"
        test_child_array = []
        test_child_array.push("test")
        test_child_array.push("test.dot")
        test_child_array.push(test_child_hash)
        test_hash = {}
        test_hash["key"] = "value"
        test_hash["child.dot"] = test_child_array
        expect_child_hash = {}
        expect_child_hash["key"] = test_child_hash["key"]
        expect_child_hash["key.dot"] = test_child_hash["key.dot"]
        expect_child_array = []
        expect_child_array.push("test")
        expect_child_array.push("test.dot")
        expect_child_array.push(expect_child_hash)
        expect_hash = {}
        expect_hash["key"] = "value"
        expect_hash["child_dot"] = expect_child_array
        expect(@filter.de_dot(test_hash)).to eq expect_hash
      end

      it "no error with recursive array with de_dot_nested = true" do
        # "child_dot" => ["test", "test.dot", {"key"=>"value", "key_dot"=>"value.dot"}]
        @filter.de_dot_nested = true
        test_child_hash = {}
        test_child_hash["key"] = "value"
        test_child_hash["key.dot"] = "value.dot"
        test_child_array = []
        test_child_array.push("test")
        test_child_array.push("test.dot")
        test_child_array.push(test_child_hash)
        test_hash = {}
        test_hash["key"] = "value"
        test_hash["child.dot"] = test_child_array
        expect_child_hash = {}
        expect_child_hash["key"] = test_child_hash["key"]
        expect_child_hash["key_dot"] = test_child_hash["key.dot"]
        expect_child_array = []
        expect_child_array.push("test")
        expect_child_array.push("test.dot")
        expect_child_array.push(expect_child_hash)
        expect_hash = {}
        expect_hash["key"] = "value"
        expect_hash["child_dot"] = expect_child_array
        expect(@filter.de_dot(test_hash)).to eq expect_hash
      end

    end
    
  end

end
