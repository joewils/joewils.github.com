---
layout: post
title: "MovableType to WordPress .htaccess 301 RedirectMatch Rules"
categories:
- noise
---

The following .htaccess rules assume the following:

1. foo_bar is your TypePad site name
2. You are using "pretty" WordPress URL's
3. www.foobar.com is your domain name

These rules will address the these two URL patterns:

* /foo_bar/12/01/joe-was-here.html == http://www.foobar.com/joe-was-here/
* /foo_bar/boo.html == http://www.foobar.com/boo/

```ApacheConf
RedirectMatch 301 /foo_bar/(.*)/(.*)/(.*)\.html$ http://www.foobar.com/$3/
RedirectMatch 301 /foo_bar/(.*)\.html$ http://www.foobar.com/$1/
```