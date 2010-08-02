#!/usr/bin/env jruby
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'


module Color_reverse

  def Color_reverse.glitch(img)
    for y in 0...img.height do
      for x in 0...img.width do
        pix = img.get_rgb(x, y)
        r = pix >> 16 & 0xFF
        g = pix >> 8 & 0xFF
        b = pix & 0xFF
        r = 256-r
        g = 256-g
        b = 256-b
        pix = ((r << 16)&0xFF0000 | (g << 8)&0xFF00 | b)
        img.set_rgb(x,y, pix)
      end
    end
    return img
  end

end
