---
layout: post
lang: it
title:  "Facili le dropdownbox con le JSF 2.2!"
excerpt: ""
category: Java
date:   2014-12-16 22:45:33
tags: [Italian,Java Server Faces]
comments: true
share: true
---

Un anno speso nell'intelligenza artificiale è abbastanza perchè una persona creda in Dio.
*(Alan Perlis)*

Realizzare mappature dirette tra una `Map` e una dropdown box con le Java Server Faces 2.3 è immediato e facile. 
Dato un Session Bean di esempio riportato sotto

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
Il codice nel file jsf xhtml si riduce a ben poche righe

```xml
<h:selectOneMenu  value="#{thatBean .thatId}">
    <f:selectItems value="#{thatBean.thatMap}" />
</h:selectOneMenu>
```

la mappatura è automatica con key e value (occhio è invertito) del tag option del tag select. 
L'automatismo però ci può condizionare un bel pò modo di popolare la nostra `Map`.
Per un controllo più fine possiamo utilizzare la seguente forma

```xml
<h:selectOneMenu  value="#{thatBean.thatId}">
   <f:selectItems 
      value="#{thatBean.thatMap.entrySet()}" 
      var="entry"
      itemValue="#{entry.key}" 
      itemLabel="#{entry.value}" />
</h:selectOneMenu>
```

Nei casi più semplici, se non abbiamo necessità di una `Map` e posso mettere i valori hard coded

```xml
<h:selectOneMenu  value="#{thatBean.thatId}">
   <f:selectItem itemValue="Key1" itemLabel="Label1” />
   <f:selectItem itemValue="Key2" itemLabel="Label2" />
</h:selectOneMenu>
```

Ecco il testo completo della pagina di esempio.

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

Una precisazione, le annotazioni `@SessionScoped` e `@Named` sostituiscono i vecchi e deprecati `@ManagedBean` e `@SessionScoped`
che ovviamente possiamo continuare ad utilizzare per il momento.
