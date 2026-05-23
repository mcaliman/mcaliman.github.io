---
layout: post
title: "How to install Jekyll on Ubuntu 14.04"
excerpt: "Installing Jekyll on Ubuntu 14.04 for static site generation"
category: Linux
date: 2014-06-07
comments: true
share: false
modified: 2024-07-11
published: true
tags: [linux, ubuntu, en, code]
permalink: /linux/install-jekyll-ubuntu-1404/
---


Prerequisites:

* Ruby.
* RubyGems.
* Ubuntu 14.04.

First, let's install Ruby.

```
sudo apt-get install ruby ruby-dev make
```

We check the version of Ruby installed with the command.

```
ruby -v
```

To make sure everything works, you should obtain the following version of Ruby.
```
ruby 1.9.3p484 (2013-11-22 revision 43786) [x86_64-Linux]
```

A small workaround to fix the CoffeeScript gem... we need the g++ compiler...

```
sudo apt-get install g++
```

...and `therubyracer`:
```
sudo gem install therubyracer --no-rdoc --no-ri
```

We finally install Jekyll:

```
sudo gem install jekyll 
```

We check the installed version of Jekyll with the command.

```
jekyll -v
```

You should get an output like this:
```
jekyll 2.0.3
```

Visit [Jekyll docs][jekyll] for more information on how to get the most out of Jekyll.
 
You can find Jekyll on GitHub at [Jekyll's GitHub repo][jekyll-gh].

[jekyll-gh]: https://github.com/jekyll/jekyll
[jekyll]:    http://jekyllrb.com

