glitchicon
==========
create [glitch icon](http://www.flickr.com/photos/shokai/4851980141/)


require
=======

* Java 1.5 or highre
* JRuby 1.5


run test
========

    % jruby glitch_test.rb source.jpg

it makes "test" directory, and create test images there.


create icon
===========

    % jruby create_icon.rb source.jpg output.jpg


upload icon to twitter
======================

edit config.yaml
----------------

    % cp sample.config.yaml config.yaml

put your username and password

upload
------

    % ruby upload.rb /path/to/img.jpg


create and upload
=================

    % ruby glitch_and_upload.rb source.png


make plugin
===========

see [plugins](http://github.com/shokai/glitchicon/tree/master/plugins/) directory