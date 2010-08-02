#!/usr/bin/env ruby
require 'rubygems'
require 'twitter'
require 'yaml'

begin
  conf = YAML::load open(File.dirname(__FILE__) + '/config.yaml')
rescue
  STDERR.puts 'config.yaml load error'
  exit 1
end

if ARGV.size < 1
  STDERR.puts 'require icon file'
  STDERR.puts 'ruby upload_icon.rb /path/to/image.jpg'
  exit 1
end

puts file = ARGV.shift

begin
  tw = Twitter::Base.new(Twitter::HTTPAuth.new(conf['user'], conf['pass']))
  tw.update_profile_image(open(file))
rescue => e
  STDERR.puts e
end

puts 'upload success'
