#!/usr/bin/env jruby
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'


module Copy_colorshift_horizontal_broken

  def Copy_colorshift_horizontal_broken.glitch(img)
    img_result = BufferedImage.new(img.width, img.height, img.type)
    img_result.graphics.drawImage(img, 0, 0, nil)
    roll = 0
    sources = Array.new
    for i in rand(img.height)...img.height do
      sources << i
      break if rand > 0.98
    end
    loop do
      shifts = [0,0,0].map{|i|
        rand(255)-128
      }
      target = rand(img.height)
      sources.each{|y|
        for x in 0...img.width do
          pix = img.get_rgb(x, y)
          r = pix >> 16 & 0xFF
          g = pix >> 8 & 0xFF
          b = pix >> 16 & 0xFF
          r += shifts[0]
          g += shifts[1]
          b += shifts[2]
          pix = ((r << 16)&0xFF0000 | (g << 8)&0xFF00 | b)
          img_result.set_rgb(x, target, pix)
        end
        target += 1
        break if target > img.height-1
      }
      break if rand > 0.5
    end

    return img_result
  end

end
