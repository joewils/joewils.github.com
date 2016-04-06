---
layout: post
title: "TIL: Serialize objects with Ruby Marshal"
categories:
- TIL
---

[http://ruby-doc.org/core-2.3.0/Marshal.html](http://ruby-doc.org/core-2.3.0/Marshal.html)

`ruby
  serialized_data = Marshal.dump({'joe'=>'washere'})
  deserialized_data = Marshal.load(serialized_data)
`