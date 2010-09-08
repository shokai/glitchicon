#!/usr/bin/env ruby
require 'rubygems'
require 'oauth'
require 'yaml'

begin
  conf = YAML::load open(File.dirname(__FILE__) + '/config.yaml')
rescue
  STDERR.puts 'config.yaml load error'
  exit 1
end

consumer = OAuth::Consumer.new(conf['consumer_key'], conf['consumer_secret'],
                               :site => "http://twitter.com/")

request_token = consumer.get_request_token(
                                           #:oauth_callback => "http://example.com"
                                           )

puts 'please access following URL and approve'
puts request_token.authorize_url

print 'then, input OAuth Verifier: '
oauth_verifier = gets.chomp.strip

access_token = request_token.get_access_token(:oauth_verifier => oauth_verifier)

puts 'access_token : ' + "'#{access_token.token}'"
puts 'access_secret : ' + "'#{access_token.secret}'"
