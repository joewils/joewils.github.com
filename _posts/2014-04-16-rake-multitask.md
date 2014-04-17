---
layout: post
title: Manage Multiple Tasks With Rake
categories:
- bookmark
- development
- rake
---

> melt your cores with rake multitask

* [http://rake.rubyforge.org/files/doc/rakefile_rdoc.html](http://rake.rubyforge.org/files/doc/rakefile_rdoc.html)
* [http://ozmm.org/posts/rake_start.html](http://ozmm.org/posts/rake_start.html)
* [http://www.hezmatt.org/~mpalmer/blog/2012/07/19/melt-your-cores-with-rake-multitask.html](http://www.hezmatt.org/~mpalmer/blog/2012/07/19/melt-your-cores-with-rake-multitask.html)

``` ruby
desc "Do All The Things At The Same Time"
multitask :start => [ 'thing1:start', 'thing2:start', 'thing3:start' ]
```