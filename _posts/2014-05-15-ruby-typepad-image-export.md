---
layout: post
title: Extract Images From TypePad Blog Export
categories:
- bookmark
- development
- ruby
---

I've updated the [ruby-mtexport](https://github.com/joewils/ruby-mtexport) project to support image reference extraction: 

``` ruby
  file = File.read("mtexport.dump")
  mt = MtexportParser.new(file)
  mt.parse
  mt.print_fullsize_images
```

* [https://github.com/joewils/ruby-mtexport](https://github.com/joewils/ruby-mtexport)
* [https://github.com/mchung/ruby-mtexport](https://github.com/mchung/ruby-mtexport)
* [TypePad Export Instructions](http://help.typepad.com/import_export.html)
* [EasyGet Download Manager](https://itunes.apple.com/us/app/easyget/id483544597?mt=12)
* [DownThemAll Firefox Add-on](https://addons.mozilla.org/en-US/firefox/addon/downthemall/)