---
layout: post
title: "Jekyll / Liquid UTF8 Problems on Windows"
categories:
- bookmark
tags:
- jekyll
- windows
---

1. set LC_ALL=en_US.UTF-8
2. set LANG=en_US.UTF-8
3. chcp 65001

![Jekyll Bug](/images/posts/jekyllutf8windowsbug.png)


* [mojombo](https://github.com/mojombo/jekyll/issues/188)
* [stackoverflow](http://stackoverflow.com/questions/13146420/my-jekyll-site-cant-build-liquid-exception-incompatible-character-encodings)
* [jfromaniello](https://github.com/jfromaniello/joseoncodecom/blob/master/_posts/2011-11-27-solving-utf-problem-with-jekyll-on-windows.markdown)

