#!/usr/bin/env jruby
require 'java'
import 'java.lang.System'
import 'javax.imageio.ImageIO'
import 'java.awt.image.BufferedImage'

class Glitch
  # input BufferedImage, return BufferedImage
  def glitch(img, plugin)
    plugin = plugins[rand(plugins.size)] if plugin == nil
    require plugin[0]
    method = eval("#{plugin[1]}.method('glitch')")
    return method.call(img), plugin
  end

  def plugins
    Dir.glob(File.dirname(__FILE__)+'/plugins/*.rb').map{|rb|
      [rb, rb.scan(/([^\/\.]+)\.rb/).first.first.capitalize]
    }
  end
  
end

