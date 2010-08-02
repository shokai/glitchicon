#!/usr/bin/env jruby
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'


module Quantize_contour

  def Quantize_contour.glitch(img)

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

    img_result = BufferedImage.new(img.width, img.height, img.type)
    for y in 1...img.height-1 do
      for x in 1...img.width-1 do
        pix = img.get_rgb(x, y)
        around = (img.get_rgb(x-1,y)+img.get_rgb(x+1,y)+img.get_rgb(x,y-1)+img.get_rgb(x,y+1))/4
        if around < pix
          pix = 0
        else
          pix = 0xFFFFFF
        end
        img_result.set_rgb(x, y, pix)
      end
    end
    return img_result
  end

end
