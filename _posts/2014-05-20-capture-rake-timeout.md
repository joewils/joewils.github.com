---
layout: post
title: Capture Timeout Errors in Rake
categories:
- bookmark
- development
- ruby
---

``` ruby
def do_rake_task
  # teh awesome goes here...
rescue Timeout::Error => e
  # wtf? #{e}
end
```

* [http://stackoverflow.com/questions/18473489/](http://stackoverflow.com/questions/18473489/ruby-rake-task-api-timeout-error)
* [http://userprimary.net/posts/2008/04/13/setting-a-longer-timeout-for-nethttp-requests-in-ruby/](http://userprimary.net/posts/2008/04/13/setting-a-longer-timeout-for-nethttp-requests-in-ruby/)
* [http://savonrb.com/version2/globals.html](http://savonrb.com/version2/globals.html)