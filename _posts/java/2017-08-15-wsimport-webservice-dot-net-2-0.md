--- 
layout: post
lang: en
title: "wsimport and Webservice .Net 2.0"
excerpt: ""
category: "Java"
date:   2015-08-15 22:45:33
modified: 2017-08-15 22:45:33
tags: ["Programming Languages","Java"]
comments: true
share: true
revision: 0
---

Update 2017: With NetBeans 8.2 the problem below seems to be handled completely transparently by the class generation procedure from the wsdl (wizard of NB8.2).

I love webservices.
Dealing with application integration, B2B applications and, more generally, SOA architectures, I often have to create systems whose functionalities are the result of the interaction of various web services, some developed by me others by third parties or available on the market.
I love webservices but...
I love them a little less when from Java EE applications I have to deal with webservices made in .NET 2.0 . At the time of writing this post, the frameworks have been up to version 4 and beyond for quite a while now, and with those there are no longer any major problems.  The magic word is "backward compatibility, we must remain backward compatible sorry" I have heard it many times, and if I put myself in the shoes of those who develop applications in the Microsoft world I understand it perfectly. 

In this case, the problems that arise are still more or less the same and my favourite IDE NetBeans no longer makes my life any easier, so better to arm myself with a terminal and rediscover the JDK (Java Development Kit) and its tools such as wsimport.

Error type 1

When the NetBeans 8 wizard is creating our client classes, it returns error lines of the following type

[ERROR] A class/interface with the same name X is already in use. Use a class customization to resolve this conflict.
  line NNN of file:/Y:/NetBeansProjects/Application/xml-resources/web-service-references/service/wsdl/service.wsdl

There is a naming conflict..
NetBeans just launches wsimport and all it does is tell us that it might be better to use the -B-XautoNameResolution option. Doing it from the IDE is not straightforward, you can also try fiddling with the webservice reference attributes (WebService Reference / Edit WebService Attribute) and see if you can set the option in the WsImport Option (in fact if you find a way post/write I'll be happy to integrate the post with your observations), if instead you are not so adventurous and the nerd pride resurfaces open the terminal and type

wsimport -d e:\mydir -extension -Xnocompile -Xendorsed -B-XautoNameResolution -keep -s e:\mydir -encoding UTF-8 -verbose E:/mydir/service.wsdl -wsdllocation file:/E:/mydir/service.wsdl

Then import the generated classes into your favourite IDE and get on with the job.

A tip the -p <mycustompackage> option is not present for a very specific reason and you can always refactor the code later.
Error type 2

Another problem manifests itself with the error


[ERROR] undefined element declaration 's:schema'

preceded by the warning

[WARNING] src-resolve: Cannot resolve the name 's:schema' to a(n) 'element declaration' component.

When NetBeans calls wsimport in the form

 wsimport -d E:\NetBeansProjects\JavaApplication18\build\generated\jax-wsCache\WebService -extension -Xnocompile -Xendorsed -keep -s E:\NetBeansProjects\JavaApplication18\build\generated\jax-wsCache\WebService -encoding UTF-8 -catalog E:\NetBeansProjects\JavaApplication18\catalog. xml -verbose E:\NetBeansProjects\JavaApplication18\xml-resources\web-service-references\WebService\wsdl\xx.yy.zz\WebService.asmx.wsdl -wsdllocation http://xx.yy.zz/webservice.asmx?WSDL
WSDL parsing...

One solution is to tell wsimport how to treat that definition and reference s:schema

wsimport -b http://www.w3.org/2001/XMLSchema.xsd -b E:/tmp/customization.xjb E:/tmp/webservice.wsdl

The contents of the customisation.xjb file are shown below
```xml
<?xml version="1.0" encoding="UTF-8"?>
<bindings xmlns="http://java.sun.com/xml/ns/jaxb"
          xmlns:xsd="http://www.w3.org/2001/XMLSchema"
          xmlns:xjc="http://java.sun.com/xml/ns/jaxb/xjc"
          version="2.0">

  <globalBindings>
    <xjc:simple />
  </globalBindings>

  <bindings scd="~xsd:complexType">
    <class name="ComplexTypeType"/>
  </bindings>

  <bindings scd="~xsd:simpleType">
    <class name="SimpleTypeType"/>
  </bindings>

  <bindings scd="~xsd:group">
    <class name="GroupType"/>
  </bindings>

  <bindings scd="~xsd:attributeGroup">
    <class name="AttributeGroupType"/>
  </bindings>

  <bindings scd="~xsd:element">
    <class name="ElementType"/>
  </bindings>

  <bindings scd="~xsd:attribute">
    <class name="attributeType"/>
  </bindings>
</bindings>
```
If I've saved you a few hours googling/imagining in Klingon/denying in coffee, let me know.