#!/usr/bin/env jruby
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'


module Copy_vertical

  def Copy_vertical.glitch(img)
    img_result = BufferedImage.new(img.width, img.height, img.type)
    img_result.graphics.drawImage(img, 0, 0, nil)
    roll = 0
    sources = Array.new
    for i in rand(img.width)...img.width do
      sources << i
      break if rand > 0.98
    end
    loop do
      target = rand(img.width)
      sources.each{|x|
        for y in 0...img.height do
          pix = img.get_rgb(x, y)
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
