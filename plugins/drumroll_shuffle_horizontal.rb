#!/usr/bin/env jruby
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'


module Drumroll_shuffle_horizontal

  def Drumroll_shuffle_horizontal.glitch(img)
    # split rolls
    rolls = Array.new
    roll = Array.new
    for y in 0...img.height do
      roll << y
      if rand > 0.95
        rolls << roll
        roll = Array.new
      end
    end
    rolls << roll if roll.size > 0

    # shuffle
    rand_rolls = Array.new
    while rolls.size > 0 do
      rand_rolls << rolls.delete_at(rand(rolls.size))
    end

    rand_rolls.flatten!
    img_result = BufferedImage.new(img.width, img.height, img.type)
    for y in 0...img.height do
      for x in 0...img.width do
        pix = img.get_rgb(x, y)
        img_result.set_rgb(x, rand_rolls[y], pix)
      end
    end
    return img_result
  end

end
