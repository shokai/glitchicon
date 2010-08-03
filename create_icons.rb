#!/usr/bin/env jruby
require File.dirname(__FILE__)+'/glitch'
require 'rubygems'
require 'ArgsParser'
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'

parser = ArgsParser.parser
parser.bind(:in_img, :i, 'input file')
parser.bind(:out_dir, :o, 'output dir')
parser.bind(:num, :n, 'number of output images')
parser.bind(:format, :f, 'output image format')
parser.bind(:help, :h, 'show help')
parser.parse(ARGV)

p parser.params
if parser.has_param(:help) or !parser.has_params([:in_img, :out_dir, :num])
  STDERR.puts 'require : in_img, out_dir, num'
  STDERR.puts 'jruby create_icons.rb -i input.jpg -o /path/to/out/ -n 20'
  puts parser.help
  exit 1
end

img_in = ImageIO.read(java.io.File.new(parser.params[:in_img]))
out_dir = parser.params[:out_dir]
out_dir += '/' unless out_dir =~ /\/$/
format = 'png'
format = parser.params[:format] if parser.params[:format]

puts "#{img_in.width}:#{img_in.height}"
g = Glitch.new
last = parser.params[:num].to_i
for i in 0...last do
  puts "(#{i}/#{last})"
  img = BufferedImage.new(img_in.width, img_in.height, img_in.type);
  img.graphics.drawImage(img_in, 0, 0, nil)
  loop do
    img, plugin = g.glitch(img)
    puts plugin[1]
    break if rand > 0.5
  end
  out_name = "#{out_dir}#{i}.#{format}"
  ImageIO.write(img, format, java.io.File.new(out_name))
  puts out_name
end
