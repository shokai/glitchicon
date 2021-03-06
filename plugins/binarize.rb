#!/usr/bin/env jruby
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'


module Binarize

  def Binarize.glitch(img)
    for y in 0...img.height do
      for x in 0...img.width do
        pix = img.get_rgb(x, y)
        r = pix >> 16 & 0xFF
        g = pix >> 8 & 0xFF
        b = pix & 0xFF
        gray = (r+g+b)/3
        if gray < 128
          bin = 0
        else
          bin  =255
        end

        pix = ((bin << 16)&0xFF0000 | (bin << 8)&0xFF00 | bin)
        img.set_rgb(x, y, pix)
      end
    end
    return img
  end

end
