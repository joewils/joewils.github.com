---
layout: post
title: "TIL: Attach a PDF to a WordPress Post using Ruby"
categories:
- TIL
---

Apparently there is more than one way to encode binary data.  When encoding data to be passed to an XMLRPC service, use the XMLRPC library vs. the Base64 library.  I stumbled upon this solution reviewing [Zach Feldman's RubyPress](https://github.com/zachfeldman/rubypress) project on GitHub.

`ruby
  bits = XMLRPC::Base64.new(File.read('/path/to/joes/file.pdf'))
`

* [XMLRPC::Base64](http://ruby-doc.org/stdlib-2.0.0/libdoc/xmlrpc/rdoc/XMLRPC/Base64.html)
* [Base64](http://ruby-doc.org/stdlib-2.3.0/libdoc/base64/rdoc/Base64.html)
* [RubyPress](https://github.com/zachfeldman/rubypress/blob/master/lib/rubypress/media.rb)
* [WordPress XML-RPC Media API](http://codex.wordpress.org/XML-RPC_WordPress_API/Media)