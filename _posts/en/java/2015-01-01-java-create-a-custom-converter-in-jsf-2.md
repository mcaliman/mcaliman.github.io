---
layout: post
title: "Creating a Custom Converter in JSF 2.2"
excerpt: "Creating and registering a custom type converter in JSF 2.2"
category: Java
date: 2015-01-01
comments: true
share: false
modified: 2024-07-11
published: true
tags: [java, jsf, en, code]
permalink: /java/creating-custom-converter-jsf/
---


If a bean property is of type `boolean`, the page will display the strings `true` and `false`. To replace the representation with something more user-oriented, we need to render the values `true` and `false` with Yes and No, True and False, Active or Disabled, and so on. To do this, we need to create a `Converter` and associate it with our `outputText` element.
The example code below creates a simple `Converter` to render Boolean values with the strings Yes and No:

```java
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;
import javax.faces.convert.FacesConverter;

@FacesConverter("booleanToYesNoConverter")
public class BooleanToYesNoConverter implements Converter {

    public BooleanToYesNoConverter() {
    }

    @Override
    public Object getAsObject(FacesContext facesContext, UIComponent uiComponent, String param) {
        try {
            Boolean result = Boolean.parseBoolean(param);
            return result;
        } catch (Exception exception) {
            throw new ConverterException(exception);
        }
    }

    @Override
    public String getAsString(FacesContext facesContext, UIComponent uiComponent, Object obj) {
        try {
            if (obj != null && ((Boolean) obj)) {
                return "Yes";
            } else {
                return "No";
            }
        } catch (Exception exception) {
            throw new ConverterException(exception);
        }
    }
}

```

The code in the JSF XHTML file is shown below:

```xml
<h:form>
   <h:outputText value="#{true}" title="" converter="booleanToYesNoConverter"/>
</h:form>
```

If I do not need the fine control level of a converter, I can solve this using a ternary operator and EL:

```xml
<h:form>
   <h:outputText value="#{false ? 'Yes' : 'No'}" />
</h:form>
```
The use of this form is optimal if the need for conversion is localised to a single page or a few occurrences.
The form with the converter allows us to centralise the decoding model in one place, and if we wanted to replace Yes, No with the Enabled, Disabled representation we would simply make the change in our `BooleanToYesNoConverter` code.

