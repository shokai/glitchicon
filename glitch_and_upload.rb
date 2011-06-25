#!/usr/bin/env jruby

if ARGV.size < 1
  STDERR.puts 'require : source image'
  STDERR.puts 'ruby glitch_and_upload /path/to/img.jpg'
  exit 1
end

source = ARGV.shift
dir = File.dirname(__FILE__)

puts `jruby #{dir}/create_icon.rb #{source} #{dir}/tmp.jpg`
puts `jruby #{dir}/upload.rb #{dir}/tmp.jpg`
