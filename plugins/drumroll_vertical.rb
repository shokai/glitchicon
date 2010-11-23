#!/usr/bin/env jruby
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'


module Drumroll_vertical

  def Drumroll_vertical.glitch(img)
    img_result = BufferedImage.new(img.width, img.height, img.type)

    regions = Array.new
    for i in 0...img.width do regions << i end
    size_ratio = img.width/100
    regions = regions.split_nest((15*size_ratio).to_i,(40*size_ratio).to_i)

    for region in regions do
      roll = rand(img.height)
      for x in region do
        for y in 0...img.height do
          pix = img.get_rgb(x, y)
          y2 = y+roll
          y2 -= img.height if y2 > img.height-1
          img_result.set_rgb(x, y2, pix)
        end
      end
    end
    return img_result
  end

end
