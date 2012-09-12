#!/usr/bin/env jruby
require 'rubygems'
require 'bundler/setup'
require 'twitter'
require 'yaml'

begin
  conf = YAML::load open(File.expand_path '../config.yaml', File.dirname(__FILE__))
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
  Twitter.configure do |config|
    config.consumer_key = conf['consumer_key']
    config.consumer_secret = conf['consumer_secret']
    config.oauth_token = conf['access_token']
    config.oauth_token_secret = conf['access_secret']
  end
  Twitter.update_profile_image(open(file,'r'))
  puts 'upload success'
rescue => e
  STDERR.puts e
  exit 1
end
