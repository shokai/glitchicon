#!/usr/bin/env jruby
require 'glitch'
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'


if ARGV.size < 2
  STDERR.puts 'require : input and output image'
  STDERR.puts 'jruby glitchicon.rb input.jpg output.jpg'
  exit 1
end

img_in = ImageIO.read(java.io.File.new(ARGV.shift))
out_name = ARGV.shift

puts "#{img_in.width}:#{img_in.height}"

img = BufferedImage.new(img_in.width, img_in.height, img_in.type);
img.graphics.drawImage(img_in, 0, 0, nil)
g = Glitch.new
img, plugin = g.glitch(img)
puts plugin[1]
ImageIO.write(img, out_name.split(/\./).last, java.io.File.new(out_name))
puts out_name
