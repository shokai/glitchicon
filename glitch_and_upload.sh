#!/bin/sh
TMP=/var/tmp/glitch_icon.png

if test $# -lt 1
then
    echo "image file required."
    echo "  e.g.  $0 /path/to/img.png"
    exit 1
fi

cd `dirname $0`
jruby create_icon.rb $1 $TMP
ruby upload.rb $TMP
rm -f TMP
