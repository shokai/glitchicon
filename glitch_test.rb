#!/usr/bin/env jruby
require 'glitch'
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'


if ARGV.size < 1
  STDERR.puts 'require : input image (plugin)'
  STDERR.puts 'jruby glitch_test.rb input.jpg'
  STDERR.puts 'jruby glitch_test.rb input.jpg vertical'
  exit 1
end

outdir = File.dirname(__FILE__)+"/test"

Dir.mkdir(outdir) unless File.exists?(outdir)
img_in = ImageIO.read(java.io.File.new(ARGV.shift))

plugin_filter = ARGV.shift if ARGV.size > 0
puts "#{img_in.width}x#{img_in.height}"

g = Glitch.new
g.plugins.each{|plugin|
  next if plugin_filter != nil and !(plugin[1].to_s =~ /#{plugin_filter}/i)
  img = BufferedImage.new(img_in.width, img_in.height, img_in.type);  
  img.graphics.drawImage(img_in, 0, 0, nil)
  img, plugin = g.glitch(img, plugin)
  out_name = "#{outdir}/#{plugin[1]}.png"
  ImageIO.write(img, 'png', java.io.File.new(out_name))
  puts "#{plugin[1]} => #{out_name}"
}
