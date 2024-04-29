---
layout: post
lang: en
title:  "Secure httpbase tomcat authentication"
excerpt: ""
category: "Java"
tags: ["Programming Languages","Java","Tomcat"]
date:   2014-08-15 22:45:33
comments: true
share: true
revision: 0
---

To set up basic authentication in a java application in tomcat, we can only intervene in two files


In tomcat-users.xml setting, where we will configure the users.


```XML
<!--?xml version='1.0' encoding='utf-8'?-->
<tomcat-users>
<role rolename="tomcat">
<role rolename="role1">
<user password="tomcat" roles="tomcat" username="tomcat">
<user password="tomcat" roles="role1" username="role1">
<user password="tomcat" roles="tomcat,role1" username="both">
</user>
</user>
</user>
</role>
</role>
</tomcat-users>
```


While in the web.xml file of our application, we add the lines as below.

```XML
<!--?xml version="1.0" encoding="ISO-8859-1"?-->  
<web-app>    
<!-- Define a Security Constraint on this Application -->
<security-constraint>
<web-resource-collection>
<web-resource-name>Entire Application</web-resource-name>      
<url-pattern>/*</url-pattern>
</web-resource-collection>
<auth-constraint>
<role-name>tomcat</role-name>
</auth-constraint>
</security-constraint>


<!-- Define the Login Configuration for this Application -->
<login-config>
<auth-method>BASIC</auth-method>
<realm-name>Application</realm-name>
</login-config>


<!-- Security roles referenced by this web application -->
<security-role>
<description>
The role that is required to log in to the Manager Application
</description>
<role-name>tomcat</role-name>
</security-role>


</web-app>
```
