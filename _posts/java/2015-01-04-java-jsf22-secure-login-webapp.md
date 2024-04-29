---
layout: post
lang: en
title:  "Secure logins and pages with JSF 2"
excerpt: ""
category: "Java"
date:   2015-01-04 22:45:33
tags: ["Programming Languages","Java","JavaServer Faces"]
comments: true
share: false
revision: 0
---
In this post we see how to implement a minimal login system with basic security in a Java Server Faces 2.2 application.

First we open NetBeans 8, then create an application of type `WebApplication` and specify `JSF 2.2` as the framework.
To create a project of type `WebApplication` we select from the menu `File`->`New Project`, then `Java Web` -> `WebApplication`
and finally `Next >`.

We will call our application JSFSecureLoginWebApplication for simplicity's sake

we specify the various steps as below

![](/images/post/JSF22SecureLoginWebapp/JSF22SecureLoginWebappScreenshot02.png "JSF22SecureLoginWebappScreenshot02")

set the name

![](/images/post/JSF22SecureLoginWebapp/JSF22SecureLoginWebappScreenshot03.png "JSF22SecureLoginWebappScreenshot03")

Application Server Settings

![](/images/post/JSF22SecureLoginWebapp/JSF22SecureLoginWebappScreenshot04.png "JSF22SecureLoginWebappScreenshot04")

the framework JSF 2.2

![](/images/post/JSF22SecureLoginWebapp/JSF22SecureLoginWebappScreenshot05.png "JSF22SecureLoginWebappScreenshot05")

The url Pattern and the language used for JSF pages

![](/images/post/JSF22SecureLoginWebapp/JSF22SecureLoginWebappScreenshot06.png "JSF22SecureLoginWebappScreenshot06")
We do not select anything for components
![](/images/post/JSF22SecureLoginWebapp/JSF22SecureLoginWebappScreenshot07.png "JSF22SecureLoginWebappScreenshot07")

At this point we need to create two `JavaBean` and a `Filter` which will be used to manage access to pages we define as 
secure. The pages secured by the `Filter` will be in the path/directory `/pages`.
We will call the two beans `LoginBean` and `NavigationBean`, the function of the `LoginBean` is to manage access, the function of the `NavigationBean` is navigation.
```java
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

```


The code of `NavigationBean` is shown below

```java
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

```
Both beans are annotated as `@ManagedBean` and `@SessionScoped` in that they must have session scope and be manageable in our pages with their properties and methods (which carry out the actions to associate with the buttons or links).

A separate discussion deserves `LoginFilter`, it's a `Filter` so it's basically a `Servlet`, and as such it will behave in a way that allows us to check the path called and discriminate between accessible pages or resources in relation to whether or not one is accredited to the system. 

Accreditation is obviously linked to the correctness of the `username` and `password` given by the user. The example is deliberately simple, there is no logic of checking a database or other persistent or remote source for the `username` and `password`. For teaching purposes, we are content to check from code whether the `username` and `password` match one prefixed in the code. It is my intention to elaborate on this in a future post. The idea will allow me to show a simple table system to handle the username/password match with `JPA` and manage a simple role system. 

Let's come to the filter code
```java
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
```
At this point we create our JSF login page and our application index page, which can only be accessed if accredited

From the NetBeans menu we create a page for the login as below, the same operation we will then do for the creation of the `index.xhtml` page which will be in the path secured by Filter.

![](/images/post/JSF22SecureLoginWebapp/JSF22SecureLoginWebappScreenshot10.png "JSF22SecureLoginWebappScreenshot10")

The code for the `login.xhtml` is below, and is obviously reduced to the bone. Only what we need, we can then use the template portals to realise our complete application is obviously responsive.

```xml
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
```

And finally the one for the `index.xhtml` page.

```xml
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
```

The code of our `web.xml` is as follows

```xml
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
```
We build our web application and then launch it with run from the project context menu.



