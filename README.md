glitchicon
==========
create glitch icons

* [sample](http://www.flickr.com/photos/shokai/4855370862/)
* [sample2](http://www.flickr.com/photos/shokai/4855372028/)


require
=======

* Ruby 1.8.7+
* Java 1.5 or higher
* JRuby 1.5+


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

    % sh glitch_and_upload.sh source.png


make plugin
===========

see [plugins](http://github.com/shokai/glitchicon/tree/master/plugins/) directory


LICENSE
=======
(The MIT License)

Copyright (c) 2012 Sho Hashimoto

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.