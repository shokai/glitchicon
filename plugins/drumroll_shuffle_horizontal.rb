#!/usr/bin/env jruby
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'


module Drumroll_shuffle_horizontal

  def Drumroll_shuffle_horizontal.glitch(img)
    regions = Array.new
    for i in 0...img.height do regions << i end
    size_ratio = img.height/100
    regions = regions.split_nest((15*size_ratio).to_i,(40*size_ratio).to_i).sort_by{rand}

    regions.flatten!
    img_result = BufferedImage.new(img.width, img.height, img.type)
    for y in 0...img.height do
      for x in 0...img.width do
        pix = img.get_rgb(x, y)
        img_result.set_rgb(x, regions[y], pix)
      end
    end
    return img_result
  end

end
