#!/usr/bin/env jruby
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'

if ARGV.size < 2
  STDERR.puts 'require : input file and output dir'
  STDERR.puts 'jruby glitchicon.rb /path/to/img.jpg /path/to/out/'
  exit 1
end

img_in = ImageIO.read(java.io.File.new(ARGV.shift))
out_dir = ARGV.shift
out_dir += '/' unless out_dir =~ /\/$/

puts "#{img_in.width}:#{img_in.height}"

for i in 1..10
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
  out_name = "#{out_dir}#{i}.bmp"
  ImageIO.write(img, 'bmp', java.io.File.new(out_name))
  puts out_name
end

puts `convert #{out_dir}*.bmp #{out_dir}out.gif`
#puts `ffmpeg -y -i #{out_dir}%d.bmp -s 100x100 -pix_fmt rgb24 -loop_output 0 -sameq #{out_dir}out.gif`

open("#{out_dir}out.gif"){|gif|
  bytes = gif.read.unpack('H*')
  bytes = [bytes.first.gsub!(/3b$/,'3c2c')]
  open("#{out_dir}glitchicon.gif",'w+'){|out|
    out.write(bytes.pack('H*'))
  }
}
