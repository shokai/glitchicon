#!/usr/bin/env jruby
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'


module Copy_horizontal

  def Copy_horizontal.glitch(img)
    img_result = BufferedImage.new(img.width, img.height, img.type)
    img_result.graphics.drawImage(img, 0, 0, nil)
    roll = 0
    sources = Array.new
    for i in rand(img.height)...img.height do
      sources << i
      break if rand > 0.98
    end
    loop do
      target = rand(img.height)
      sources.each{|y|
        for x in 0...img.width do
          pix = img.get_rgb(x, y)
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
