---
layout: post
lang: en
title:  "JSF 2 How to use comments"
excerpt: ""
category: programming-languages
date:   2014-11-16 22:45:33
tags: [English,Java Server Faces]
comments: false
share: true
---



Granted, it is always possible to use the classic comment tags `<!--` and `-- >` in html but these are rendered by default, and in case the commented code is a hidden feature for the released, not yet official, release or a part of EL or JSF tags this could be awkward if not a security hole.

Essentially there are two methods, let's look at them.

Set `facelets.SKIP_COMMENTS`.

In our application's `web.xml` file, we set the `facelets.SKIP_COMMENTS` parameter to `true`.

``xml
<context-param>.
   <param-name>facelets.SKIP_COMMENTS</param-name>.
   <param-value>true</param-value>
</context-param>
```

Be careful though, no html comments will be rendered, and sometimes we want to have more control over which comments to expose or not (some might be useful)
Using the `ui:remove` tag
The `ui:remove` tag is the one for me, I use it often and it gives me all the flexibility and security that enterprise applications require. The usage is trivial, and you can see an example below

```xml
<ui:remove>
  <!-- This comment will also not be rendered -->
  <h:commandButton type="button" value="#{msg.buttonLabel}" />
</ui:remove>
```

What is delimited by the tag will be treated as a comment by a compiler.