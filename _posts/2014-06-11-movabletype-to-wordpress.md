---
layout: post
title: MovableType to WordPress
categories:
- noise
- ruby
---

I've forked [@mchung's](https://github.com/mchung) [ruby-mtexport](https://github.com/joewils/ruby-mtexport) utility to include support for converting to WordPress' WXR RSS data format by stealing/borrowing [@chloerei's](https://github.com/chloerei) defunct blog_convertor export method.

Enjoy: [MovableType to WordPress](https://github.com/joewils/ruby-mtexport) 

> I love the smell of r/'napalm'/'repurposed code'/ in the morning ~ Lieutenant Colonel Kilgore

``` ruby
  file = File.read("mtexport.dump")
  mt = MtexportParser.new(file)
  mt.parse
  wordpress = MtToWordPress.new
  wordpress.base_url = 'http://foo.com'
  wordpress.mt_url = 'http://foo.typepad.com'
  wordpress.image_dir = '/images'
  wordpress.print_rss(mt)
```

* [https://github.com/joewils/ruby-mtexport](https://github.com/joewils/ruby-mtexport)
* [https://github.com/mchung/ruby-mtexport](https://github.com/mchung/ruby-mtexport)
* [https://github.com/chloerei/blog_converter/](https://github.com/chloerei/blog_converter/)
* [https://www.youtube.com/watch?v=bPXVGQnJm0w](https://www.youtube.com/watch?v=bPXVGQnJm0w)
