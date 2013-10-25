---
layout: post
title: "Windows Azure Bootcamp"
categories:
- noise
tags:
- development
- training
- cloud
- azure
---

I attended a clinic hosted by Microsoft on deploying and developing applications in "the cloud".  As you can imagine most of the labs where focused on Windows technology (.Net, C#, etc..).
I spent the day working through their Ruby and Node.js tutorials.  I like that Node.js is a first class citizen in their cloud, but Ruby support is only available if you setup a Linux VM.

* [http://www.windowsazure.com/en-us/develop/ruby/](http://www.windowsazure.com/en-us/develop/ruby/)
* [http://www.windowsazure.com/en-us/develop/ruby/tutorials/web-app-with-linux-vm/](http://www.windowsazure.com/en-us/develop/ruby/tutorials/web-app-with-linux-vm/)
* [http://www.windowsazure.com/en-us/develop/training-kit/hol-nodejsazurewebsites-osx/](http://www.windowsazure.com/en-us/develop/training-kit/hol-nodejsazurewebsites-osx/)
* [http://www.windowsazure.com/en-us/develop/nodejs/tutorials/website-with-mongodb-mongolab/](http://www.windowsazure.com/en-us/develop/nodejs/tutorials/website-with-mongodb-mongolab/)

The best part was building a guest book app in RoR while the class did it with .Net.  One of my class mates was concerned that I would fall behind because I didn't have access to the pre-built lab code.

You should have seen his face when this happened:

  rails generate scaffold Guestbook title:string comments:text

