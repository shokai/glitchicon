#!/usr/bin/env jruby
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'


module Drumroll_vertical

  def Drumroll_vertical.glitch(img)
    img_result = BufferedImage.new(img.width, img.height, img.type)
    roll = 0
    for x in 0...img.width do
      roll = rand(img.height) if rand > 0.95
      roll = 0 if rand > 0.95
      for y in 0...img.height do
        pix = img.get_rgb(x, y)
        y2 = y+roll
        y2 -= img.height if y2 > img.height-1
        img_result.set_rgb(x, y2, pix)
      end
    end
    return img_result
  end

end
