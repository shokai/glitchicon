#!/usr/bin/env jruby
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'


module Quantize

  def Quantize.glitch(img)
    for y in 0...img.height do
      for x in 0...img.width do
        pix = img.get_rgb(x, y)
        r = pix >> 16 & 0xFF
        g = pix >> 8 & 0xFF
        b = pix & 0xFF
        gray = (r+g+b)/3
        quant = gray & 0xC0
        pix = ((quant << 16)&0xFF0000 | (quant << 8)&0xFF00 | quant)
        img.set_rgb(x, y, pix)
      end
    end
    return img
  end

end
