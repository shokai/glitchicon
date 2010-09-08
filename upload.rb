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
  oauth = Twitter::OAuth.new(conf['consumer_key'], conf['consumer_secret'])
  oauth.authorize_from_access(conf['access_token'], conf['access_secret'])
  tw = Twitter::Base.new(oauth)
  tw.update_profile_image(open(file))
rescue => e
  STDERR.puts e
end

puts 'upload success'
