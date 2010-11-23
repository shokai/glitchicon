#!/usr/bin/env jruby
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'


module Colorshift_horizontal_broken

  def Colorshift_horizontal_broken.glitch(img)
    shifts = [0,0,0]
    for y in 0...img.height do
      if rand > 0.007 * img.height
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
        pix = ((r << 16)&0xFF0000 | (g << 8)&0xFF00 | b)
        img.set_rgb(x,y, pix)
      end
    end
    return img
  end

end
