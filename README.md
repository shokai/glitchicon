glitchicon
==========
create glitch icons

* [sample](http://www.flickr.com/photos/shokai/4855370862/)
* [sample2](http://www.flickr.com/photos/shokai/4855372028/)


require
=======

* Java 1.5 or higher
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

regist your app
---------------
regist your app [on twitter](http://twitter.com/apps/new)

edit config.yaml
----------------

    % cp sample.config.yaml config.yaml

edit consumer key and secret.

upload
------

    % ruby upload.rb /path/to/img.jpg


create and upload
=================

    % ruby glitch_and_upload.rb source.png


make plugin
===========

see [plugins](http://github.com/shokai/glitchicon/tree/master/plugins/) directory