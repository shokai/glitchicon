#!/usr/bin/env jruby
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'


module Drumroll_horizontal

  def Drumroll_horizontal.glitch(img)
    img_result = BufferedImage.new(img.width, img.height, img.type)

    regions = Array.new
    for i in 0...img.height do regions << i end
    size_ratio = img.height/100
    regions = regions.split_nest((15*size_ratio).to_i,(40*size_ratio).to_i)

    for region in regions do
      roll = rand(img.width)
      for y in region do
        for x in 0...img.width do
          pix = img.get_rgb(x, y)
          x2 = x+roll
          x2 -= img.width if x2 > img.width-1
          img_result.set_rgb(x2, y, pix)
        end
      end
    end
    return img_result
  end

end
