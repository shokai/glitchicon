#!/usr/bin/env jruby
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'
require File.dirname(__FILE__)+'/../glitch'

module Use_plugin_vertical

  def Use_plugin_vertical.glitch(img)
    img_result = img.get_subimage(0, 0, img.width, img.height)
    loop do
      range = Array.new
      for i in rand(img.width)...img.width do
        range << i
        break if rand > 0.98
      end
      img_part = img.get_subimage(range.first, 0, range.size, img.height)
      g = Glitch.new
      img_part, plugin = g.glitch(img_part)
      img_result.graphics.drawImage(img_part, range.first, 0, nil)
      break if rand > 0.7
    end
    return img_result
  end

end
