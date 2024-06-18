---
layout: post
lang: en
title:  "GlassFish V3: console administration taking too long to load."
excerpt: ""
category: "Java"
tags: ["Programming Languages","Java",""GlassFish"]
permalink: /java/glassfish/v3/
date: 2014-02-11 22:45:33
comments: true
share: false
published: false
---

Is the GlassFish V3 administration console taking too long to load?

1. Open the file `%GLASSFISH_HOME/glassfish/domains/domain1/config/domain.xml`.

 ```xml
<java-config>. 
     <jvm-options>-Dcom.sun.enterprise.tools.admingui.NO_NETWORK=true</jvm-options>
</java-config> 
```

Adding this property can also be done from the administration panel in the section for JVM parameters 

This property to `true` blocks news, registration notifications, etc.

2. Remove the update tool jar (remove and do not rename the extension, back it up first)
File name and path are given below

```bash
%GLASSFISH_HOME/glassfish/modules/console-updatecenter-plugin.jar
```

Then also delete the following directories

```bash
%GLASSFISH_HOME/glassfish/domains/domain1/osgi-cache
%GLASSFISH_HOME/glassfish/domains/domain1/generated
```

You can now restart the server with `bin/asadmin start-domain` .

