---
layout: post
lang: en
title:  "Dropdownboxes are easy with JSF 2.2!"
excerpt: ""
category: "Java"
date:   2014-12-16 22:45:33
tags: ["Programming Languages","Java","JavaServer Faces"]
comments: true
share: false
revision: 0
---



Making direct mappings between a `Map` and a dropdown box with Java Server Faces 2.3 is immediate and easy.
Given a sample Session Bean below

```java
import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;

@SessionScoped
@Named
public class ThatBean implements Serializable {
    //stuff...
    private static final Map<String, Object> thatMap;
    //stuff...
    private String thatId;
    //stuff...
    static {
        thatMap = new LinkedHashMap<>();
        thatMap.put("TheDesc1", "TheKey1");
        thatMap.put("TheDesc2", "TheKey2");
    }
    //stuff...
    public Map<String, Object> getThatMap() {
        return this.thatMap;
    }
    //stuff...
    public String getThatId() {
        return thatId;
    }
    //stuff...
    public void setThatId(String thatId) {
        this.thatId = thatId;
    }
}
```
The code in the jsf xhtml file is reduced to just a few lines

```xml
<h:selectOneMenu  value="#{thatBean .thatId}">
    <f:selectItems value="#{thatBean.thatMap}" />
</h:selectOneMenu>
```

the mapping is automatic with key and value (eye is inverted) of the option tag of the select tag.
However, the automation can influence quite a bit the way we populate our `Map`.
For finer control we can use the following form

```xml
<h:selectOneMenu  value="#{thatBean.thatId}">
   <f:selectItems 
      value="#{thatBean.thatMap.entrySet()}" 
      var="entry"
      itemValue="#{entry.key}" 
      itemLabel="#{entry.value}" />
</h:selectOneMenu>
```

In the simplest cases, if we don't need a `Map` and I can hard code the values

```xml
<h:selectOneMenu  value="#{thatBean.thatId}">
   <f:selectItem itemValue="Key1" itemLabel="Label1” />
   <f:selectItem itemValue="Key2" itemLabel="Label2" />
</h:selectOneMenu>
```

Here is the full text of the example page.

```html
<?xml version='1.0' encoding='UTF-8' ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
xmlns:h="http://xmlns.jcp.org/jsf/html"
xmlns:f="http://xmlns.jcp.org/jsf/core">
   <h:head>
      <title>Dropdown box examples</title>
   </h:head>
   <h:body>
	   Dropdown box examples
	   <h:form>
		   Select 1
		   <h:selectOneMenu value="#{thatBean .thatId}">
		   	<f:selectItems value="#{thatBean.thatMap}" />
		   </h:selectOneMenu>
		   Select 2
		   <h:selectOneMenu value="#{thatBean.thatId}">
		   	<f:selectItems
		   	value="#{thatBean.thatMap.entrySet()}"
		   	var="entry"
		   	itemValue="#{entry.key}"
		   	itemLabel="#{entry.value}" />
		   </h:selectOneMenu>
		   Select 3
		   <h:selectOneMenu value="#{thatBean.thatId}">
		   	<f:selectItem itemValue="Key1" itemLabel="Label1" />
		   	<f:selectItem itemValue="Key2" itemLabel="Label2" />
		   </h:selectOneMenu>
	   </h:form>
   </h:body>
</html>
```
One clarification, the `@SessionScoped` and `@Named` annotations replace the old and deprecated `@ManagedBean` and `@SessionScoped`
which we can obviously continue to use for the moment.
