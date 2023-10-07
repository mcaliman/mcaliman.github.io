---
layout: post
lang: it
title:  "Creare un custom Converter in JSF 2.2"
excerpt: ""
category: programming-languages
date:   2015-01-01 22:45:33
tags: [Italian,Java Server Faces]
comments: true
share: true
---



Se la proprietà del bean che vogliamo visualizzare è di tipo boolean quello che otterremo nella pagina sono le stringhe `true` e `false`, per 
sostituire la rappresentazione con qualcosa di più orientato all'utente abbiamo bisogno di renderizzare i valori true e false con Yes o No, 
Vero e Falso, Attivo o Disattivato e così via. Per farlo abbiamo bisogno di creare un `Converter` e associarlo al nostro elemento `outputText`.
Il codice di esempio visibile sotto realizza un semplice `Converter` per renderizzare i valori booleani con le stringhe Yes,No.


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

Il codice nel file xhtml per la nostra Java Server Faces e semplicemente quello sotto

```xml
<h:form>
   <h:outputText value="#{true}" title="" converter="booleanToYesNoConverter"/>
</h:form>
```

Se poi non ho bisogno del livello di controllo fine di un converter posso risolvere con un operatore ternario e l'uso di EL.

```xml
<h:form>
   <h:outputText value="#{false ? 'Yes' : 'No'}" />
</h:form>
```

L'uso di questa forma si presenta ottimale nel caso l'esigenza di conversione sia localizzata in una sola pagina o per poche occorrenze.
La forma con il converter ci permette di accentrare il modello di decodifica in un solo punto, e se volessimo sostiture Yes,No con la rappresentazione Abilitato,Disabilitato sarebbe sufficiente operare la modifica nel codice del nostro `BooleanToYesNoConverter`.



