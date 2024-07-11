---
layout: post
title:  "JSF 2 forcing tag-generated ids"
excerpt: ""
category: "Java"
date:   2014-11-09 22:45:33
comments: true
share: false
modified: 2024-07-11
published: true
---

When using tags like `inputHidden` or `form`, i.e. standard HTML components of the JSF, the `id` attributes of the corresponding 
HTML tag are automatically generated according to precise rules.

e.g.

``xml
<h:form id="form1">
   <t:inputHidden id="field1"/>
</h:form>
```

gives rise to this HTML code

``html
<input type="hidden" name="form:field1"/>
```

Obviously we don't have to value the `id` attribute, the Java Server Faces rendering takes care of automatically generating appropriate and unique ones.

However, when we want to reference a given component by its `id`, whether in CSS or Javascript, this behaviour prevents us from doing so (at the very least, it makes life difficult, think of referencing something like `#form:field1` with JQuery, escape?).

In cases like this we can declare the `id` and at the `form` level specify the `prependId="false"` attribute. Applied to the code seen above we have

``xml
<h:form id="form1" prependId="false">.
   <t:inputHidden id="field1"/>
</h:form>
```

which will result in 

``html
<input type="hidden" name="field1"/>
```


It would be tempting to use it all the time, even if it is not necessary for interactions with js or css. The attribute should be used with care, you may get a duplicate `id` error if you use it too often. In other words, if not strictly necessary, let JSF take care of these details and generate unique `ids` for our tags.