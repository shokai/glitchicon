#!/usr/bin/env jruby
#require 'rubygems'
#require 'twitter'
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'

if ARGV.size < 1
  STDERR.puts 'require : input file'
  STDERR.puts 'jruby glitch_and_upload.rb /path/to/img.jpg'
  exit 1
end

img_in = ImageIO.read(java.io.File.new(ARGV.shift))

img = BufferedImage.new(img_in.width, img_in.height, img_in.type);
img.graphics.drawImage(img_in, 0, 0, nil)
shifts = [0,0,0]
for y in 0...img.height do
  if rand > 0.85
    shifts = shifts.map{|j|
      j = rand(255)-128
    }
  end
  for x in 0...img.width do
    pix = img.get_rgb(x, y)
    r = pix >> 16 & 0xFF
    g = pix >> 8 & 0xFF
    b = pix & 0xFF
    r += shifts[0]
    g += shifts[1]
    b += shifts[2]
    r = 255 if r > 255
    g = 255 if g > 255
    b = 255 if b > 255
    r = 0 if r < 0
    g = 0 if g < 0
    b = 0 if b < 0
    pix = ((r << 16)&0xFF0000 | (g << 8)&0xFF00 | b)
    "#{r},#{g},#{b}"
    img.set_rgb(x,y, pix)
  end
end
puts out_name = File.dirname(__FILE__)+'/tmp.jpg'
ImageIO.write(img, 'jpg', java.io.File.new(out_name))

`exec ruby #{File.dirname(__FILE__)}/upload.rb #{File.dirname(__FILE__)}/tmp.jpg`
