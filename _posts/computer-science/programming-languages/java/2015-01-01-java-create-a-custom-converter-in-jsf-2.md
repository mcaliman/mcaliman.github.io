---
layout: post
lang: en
title:  "Creating a Custom Converter in JSF 2.2"
excerpt: ""
category: "Programming Languages"
date:   2015-01-01 22:45:33
tags: [Java Server Faces]
comments: true
share: true
revision: 0
---



If the property of the bean we want to display is of type boolean what we will get in the page are the strings `true` and `false`, to 
replace the representation with something more user-oriented we need to render the values true and false with Yes or No, 
True and False, Active or Disabled, and so on. To do this we need to create a `Converter` and associate it with our `outputText` element.
The example code below creates a simple `Converter` to render Boolean values with the strings Yes,No.


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

The code in the xhtml file for our Java Server Faces is simply the one below

```xml
<h:form>
   <h:outputText value="#{true}" title="" converter="booleanToYesNoConverter"/>
</h:form>
```

If I do not need the fine control level of a converter, I can solve this with a ternary operator and the use of EL.

```xml
<h:form>
   <h:outputText value="#{false ? 'Yes' : 'No'}" />
</h:form>
```
The use of this form is optimal if the need for conversion is localised to a single page or a few occurrences.
The form with the converter allows us to centralise the decoding model in one place, and if we wanted to replace Yes,No with the Enabled,Disabled representation we would simply make the change in our `BooleanToYesNoConverter` code.


