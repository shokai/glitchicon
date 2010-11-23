#!/usr/bin/env jruby
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'


module Copy_colorshift_vertical_broken

  def Copy_colorshift_vertical_broken.glitch(img)
    img_result = BufferedImage.new(img.width, img.height, img.type)
    img_result.graphics.drawImage(img, 0, 0, nil)

    regions = Array.new
    for i in 0...img.width do regions << i end
    size_ratio = img.width/100
    regions = regions.split_nest((15*size_ratio).to_i,(40*size_ratio).to_i)

    loop do
      shifts = [0,0,0].map{|i|
        rand(255)-128
      }
      target = rand(img.width)
      regions.choice.each{|x|
        for y in 0...img.height do
          pix = img.get_rgb(x, y)
          r = pix >> 16 & 0xFF
          g = pix >> 8 & 0xFF
          b = pix >> 16 & 0xFF
          r += shifts[0]
          g += shifts[1]
          b += shifts[2]
          pix = ((r << 16)&0xFF0000 | (g << 8)&0xFF00 | b)
          img_result.set_rgb(target, y, pix)
        end
        target += 1
        break if target > img.width-1
      }
      break if rand > 0.5
    end

    return img_result
  end

end
