#!/usr/bin/env jruby
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'


module Rotate

  def Rotate.glitch(img)
    angles = [0,90,180,270]
    angle = angles[rand(angles.size)]
    img_result = BufferedImage.new(img.width, img.height, img.type)
    g = img_result.create_graphics
    g.rotate(angle.to_f/180*Math::PI, img.width/2, img.height/2)
    g.draw_image(img, nil, 0, 0)
    return img_result
  end

end
