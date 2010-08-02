#!/usr/bin/env jruby
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'


module Drumroll_horizontal

  def Drumroll_horizontal.glitch(img)
    img_result = BufferedImage.new(img.width, img.height, img.type)
    roll = 0
    for y in 0...img.height do
      roll = rand(img.width) if rand > 0.95
      roll = 0 if rand > 0.95
      for x in 0...img.width do
        pix = img.get_rgb(x, y)
        x2 = x+roll
        x2 -= img.width if x2 > img.width-1
        img_result.set_rgb(x2,y, pix)
      end
    end
    return img_result
  end

end
