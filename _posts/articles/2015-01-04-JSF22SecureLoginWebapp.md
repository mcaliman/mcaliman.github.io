---
layout: post
title:  "Login e pagine sicure con JSF 2"
category: articles
date:   2015-01-04 22:45:33
tags: [Articoli disponibili in lingua italiana,lang_it,Java,Java7,JSF 2.2]
comments: true
share: true
---


In questo post vediamo come realizzare un sistema minimo di login con sicurezza di base in una applicazione Java Server Faces 2.2.

Per prima cosa aprimo NetBeans 8, quindi creiamo una applicazione di tipo `WebApplication` e specifichiamo come framework `JSF 2.2`
Per creare un progetto di tipo `WebApplication` selezioniamo dal menu `File`->`New Project`, Poi `Java Web` -> `WebApplication`
ed infine `Next >`

Chiameremo per semplicita la nostra applicazione JSFSecureLoginWebApplication

specifichiamo come sotto i vari passaggi


![](/images/post/JSF22SecureLoginWebapp/JSF22SecureLoginWebappScreenshot02.png "JSF22SecureLoginWebappScreenshot02")

Impostiamo il nome

![](/images/post/JSF22SecureLoginWebapp/JSF22SecureLoginWebappScreenshot03.png "JSF22SecureLoginWebappScreenshot03")

Le impostazioni dell'Application Server

![](/images/post/JSF22SecureLoginWebapp/JSF22SecureLoginWebappScreenshot04.png "JSF22SecureLoginWebappScreenshot04")

Il framework JSF 2.2

![](/images/post/JSF22SecureLoginWebapp/JSF22SecureLoginWebappScreenshot05.png "JSF22SecureLoginWebappScreenshot05")

L'url Pattern e il linguaggio utilizzato per le pagine JSF 

![](/images/post/JSF22SecureLoginWebapp/JSF22SecureLoginWebappScreenshot06.png "JSF22SecureLoginWebappScreenshot06")

Per i componenti non selezioniamo nulla
![](/images/post/JSF22SecureLoginWebapp/JSF22SecureLoginWebappScreenshot07.png "JSF22SecureLoginWebappScreenshot07")


A questo punto abbiamo bisogno di creare due `JavaBean` e un `Filter` che servirà per gestire l'accesso alle pagine che definiremo 
sicure. Le pagine messe in sicurezza dal `Filter` si troveranno nel percorso/directory `/pages`.
Chiameremo i due bean `LoginBean` e `NavigationBean`, la funzione di `LoginBean` è quella di gestire l'accesso, quella di `NavigationBean` la navigazione.

{% highlight java %}
package org.caliman.jsfsecurewebapp.login;

import java.io.Serializable;
import java.util.logging.Logger;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

@ManagedBean
@SessionScoped
public class LoginBean implements Serializable {

    private static final long serialVersionUID = 1L;
    protected final static Logger logger = Logger.getLogger(LoginBean.class.getName());

    private String username;
    private String password;

    private boolean loggedIn;

    @ManagedProperty(value = "#{navigationBean}")
    private NavigationBean navigationBean;

    public void validate(String username, String password) {
        loggedIn = false;
        if (username != null && password != null && username.trim().equals("admin")
                && password.trim().equals("secret!")) {
            loggedIn = true;
        }

        //logged ok stuff...
        if (this.loggedIn) {
            //TODO
        }
    }
    public String doLogin() {
        validate(username, password);
        if (loggedIn) {
            return navigationBean.redirectToIndex();
        }
        FacesMessage msg = new FacesMessage("Login error: the user name or password for this app is incorrect!", 
                                            "The user name or password for this app is incorrect!");
        msg.setSeverity(FacesMessage.SEVERITY_ERROR);
        FacesContext.getCurrentInstance().addMessage(null, msg);
        return navigationBean.toLogin();
    }
    public String doLogout() {
        loggedIn = false;
        //logout stuff..        
        FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
        return navigationBean.toLogin();
    }
    public String getUsername() {
        return this.username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return this.password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public boolean isLoggedIn() {
        return this.loggedIn;
    }
    public void setLoggedIn(boolean loggedIn) {
        this.loggedIn = loggedIn;
    }
    public void setNavigationBean(NavigationBean navigationBean) {
        this.navigationBean = navigationBean;
    }
}

{% endhighlight %}


Il codice di `NavigationBean` è riportato sotto

{% highlight java %}
package org.caliman.jsfsecurewebapp.login;

import java.io.Serializable;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class NavigationBean implements Serializable {

    private static final long serialVersionUID = 2L;

    public String redirectToLogin() {
        return "/login.xhtml?faces-redirect=true";
    }

    public String toLogin() {
        return "/login.xhtml";
    }

    public String redirectToIndex() {
        return "/pages/index.xhtml?faces-redirect=true";
    }

    public String toIndex() {
        return "/pages/index.xhtml";
    }

}

{% endhighlight %}

Entrambi i bean sono annotati come `@ManagedBean` e `@SessionScoped` in quando devono avere scope di sessione ed essere gestibili nelle nostre pagine con le relative proprietà e metodi (che realizzano le azioni da associare ai pulsanti o link).

Un discorso a parte merita `LoginFilter`, è un `Filter` quindi è fondalmentalmente una `Servlet` e come tale si comporterà permettendoci di verificare il percorso chiamato e discriminare tra le pagine o risorse accessibili in relazione al fatto che si sia accreditati o meno al sistema. 

L'accreditamento è ovviamente legato alla correttezza dell'`username` e `password` imputati dall'utente. L'esempio è volutamente semplice, non v'è logica di controllo su un database o altra fonte persistente o remota riguardo all'`username` e la `password`. Ai fini didattici ci accontentiamo di verificare da codice se l'`username` e la `password` corrispondono ad una prefissata nel codice. E' mia intenzione approfondire questo aspetto in uno dei prossimi post. L'idea mi permettarà di mostrare un semplice sistema di tabelle per gestire con `JPA` la corrispondenza username/password e gestire un semplice sistema di ruoli. 

Veniamo al codice della filter

{% highlight java %}
package org.caliman.jsfsecurewebapp.login;

import java.io.IOException;
import javax.faces.application.ResourceHandler;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        LoginBean auth = (LoginBean) ((session != null) ? session.getAttribute("loginBean") : null);
        String loginURL = request.getContextPath() + "/login.xhtml";

        boolean loggedIn = auth != null && auth.isLoggedIn();
        boolean loginRequest = request.getRequestURI().equals(loginURL);
        boolean resourceRequest = request.getRequestURI().startsWith(request.getContextPath() + "/" + ResourceHandler.RESOURCE_IDENTIFIER);

        if (loggedIn || loginRequest || resourceRequest) {
            if (!resourceRequest) {
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
                response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
                response.setDateHeader("Expires", 0); // Proxies.
            }
            chain.doFilter(request, response);
        } else {
            response.sendRedirect(loginURL);
        }

    }

    @Override
    public void init(FilterConfig config) throws ServletException {
        // Nothing to do here!
    }

    @Override
    public void destroy() {
        // Nothing to do here!
    }

}
{% endhighlight %}

A questo punto creiamo la nostra pagina JSF per la login e quella dell'indice della nostra applicazione a cui si potra accedere solo se accreditati

Dal menu di NetBeans creiamo una pagina per la login come sotto, la stessa operazione poi effettueremo per la creazione della pagina `index.xhtml` che si troverà nel path messo in sicurezza dalla Filter. 

![](/images/post/JSF22SecureLoginWebapp/JSF22SecureLoginWebappScreenshot10.png "JSF22SecureLoginWebappScreenshot10")

Il codice per la `login.xhtml` è riportato sotto, ed è ovviamente ridotto all'osso. Solo ciò che ci servirà, potremo poi utilizzare i template a modelli di portali per realizzare la nostra applicazione completa è ovviamente responsiva.

{% highlight xml %}
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"   
      xmlns:h="http://java.sun.com/jsf/html">
    <h:head>
        <meta charset="utf-8"/>
        <title>JSFSecureLoginWebApplication:login</title>
    </h:head>
    <h:body>
        <h:form id="loginForm">
            <h1>Access</h1>                            
            Username:<h:inputText   value="#{loginBean.username}" required="true" id="username"/><br/>
            Password:<h:inputSecret  value="#{loginBean.password}" required="true" id="password"/><br/>
            <h:commandButton value="Login" action="#{loginBean.doLogin}" id="loginButton"/><br/>                                                
        </h:form>                    
    </h:body>
</html>
{% endhighlight %}

Ed infine quello per la pagina `index.xhtml`.

{% highlight xml %}
<?xml version='1.0' encoding='UTF-8' ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html">
    <h:head>
        <title>JSFSecureLoginWebApplication:index</title>
    </h:head>
    <h:body>
        <h1>Hello JSFSecureLoginWebApplication, username and password are correct.</h1>
        <h:form>                           
            <h:commandLink action="#{loginBean.doLogout}" value="">Logout</h:commandLink>                            
        </h:form>
    </h:body>
</html>
{% endhighlight %}

Il codice della nostra `web.xml` è quello sotto
{% highlight xml %}
<?xml version="1.0" encoding="UTF-8"?>
<web-app version="3.1" xmlns="http://xmlns.jcp.org/xml/ns/javaee" 
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd">
    <context-param>
        <param-name>javax.faces.PROJECT_STAGE</param-name>
        <param-value>Development</param-value>
    </context-param>
    <filter>
        <filter-name>LoginFilter</filter-name>
        <filter-class>org.caliman.jsfsecurewebapp.login.LoginFilter</filter-class>
    </filter>
    <filter-mapping>
        <filter-name>LoginFilter</filter-name>
        <url-pattern>/pages/*</url-pattern>
    </filter-mapping>
    <servlet>
        <servlet-name>Faces Servlet</servlet-name>
        <servlet-class>javax.faces.webapp.FacesServlet</servlet-class>
        <load-on-startup>1</load-on-startup>
    </servlet>
    <servlet-mapping>
        <servlet-name>Faces Servlet</servlet-name>
        <url-pattern>/faces/*</url-pattern>
        <url-pattern>*.xhtml</url-pattern>
    </servlet-mapping>
    <session-config>
        <session-timeout>
            30
        </session-timeout>
    </session-config>
    <welcome-file-list>
        <welcome-file>pages/index.xhtml</welcome-file>
    </welcome-file-list>
</web-app>
{% endhighlight %}


Effettuaiamo il build della nostra applicazione web e poi lanciamola con run dal menu contestuale di progetto.



