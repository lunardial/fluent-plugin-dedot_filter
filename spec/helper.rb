# -*- coding: utf-8 -*-

require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems."
  exit e.status_code
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

unless ENV.has_key?('VERBOSE')
  nulllogger = Object.new
  nulllogger.instance_eval { |obj|
    def method_missing(method, *args)
      #pass
    end
  }
  $log = nulllogger
end

require 'fluent/test'
require 'fluent/plugin/filter_dedot'
