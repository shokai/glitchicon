#!/usr/bin/env jruby
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'


module Colorshift_vertical

  def Colorshift_vertical.glitch(img)
    shifts = [0,0,0]

    regions = Array.new
    for i in 0...img.width do regions << i end
    size_ratio = img.width/100
    regions = regions.split_nest((3*size_ratio).to_i,(15*size_ratio).to_i)

    for region in regions do
      shifts = shifts.map{|j| j = rand(255)-128 }
      for x in region do
        for y in 0...img.height do
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
          img.set_rgb(x,y, pix)
        end
      end
    end

    return img
  end

end
