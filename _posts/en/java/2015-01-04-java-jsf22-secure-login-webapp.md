---
layout: post
title: "Secure logins and pages with JSF 2"
excerpt: "Building a secure login web application with JSF 2.2"
category: Java
date: 2015-01-04
comments: true
share: false
modified: 2024-07-11
published: true
tags: [java, jsf, en, code]
permalink: /java/secure-logins-pages-jsf/
---

In this post, we will see how to implement a minimal login system with basic security in a Java Server Faces 2.2 application.

First, we open NetBeans 8, then create a `WebApplication` project and specify `JSF 2.2` as the framework.
To create a `WebApplication` project, select from the menu `File` -> `New Project`, then `Java Web` -> `WebApplication` and finally `Next >`.

We will call our application JSFSecureLoginWebApplication for simplicity's sake.

The various steps are specified below:

![](/images/post/JSF22SecureLoginWebapp/JSF22SecureLoginWebappScreenshot02.png "JSF22SecureLoginWebappScreenshot02")

Set the name:

![](/images/post/JSF22SecureLoginWebapp/JSF22SecureLoginWebappScreenshot03.png "JSF22SecureLoginWebappScreenshot03")

Application Server Settings:

![](/images/post/JSF22SecureLoginWebapp/JSF22SecureLoginWebappScreenshot04.png "JSF22SecureLoginWebappScreenshot04")

Select the JSF 2.2 framework:

![](/images/post/JSF22SecureLoginWebapp/JSF22SecureLoginWebappScreenshot05.png "JSF22SecureLoginWebappScreenshot05")

The URL pattern and the language used for JSF pages:

![](/images/post/JSF22SecureLoginWebapp/JSF22SecureLoginWebappScreenshot06.png "JSF22SecureLoginWebappScreenshot06")
We do not select anything for components:
![](/images/post/JSF22SecureLoginWebapp/JSF22SecureLoginWebappScreenshot07.png "JSF22SecureLoginWebappScreenshot07")

At this point we need to create two JavaBeans and a `Filter` which will be used to manage access to pages we define as secure. The pages secured by the `Filter` will be in the directory `/pages`.
We will call the two beans `LoginBean` and `NavigationBean`. The function of the `LoginBean` is to manage access, while the function of the `NavigationBean` is to handle navigation.
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
        //logout stuff...        
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

The code for `NavigationBean` is shown below:

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
Both beans are annotated with `@ManagedBean` and `@SessionScoped` because they require session scope to be accessible in our pages via their properties and methods (which handle the actions associated with buttons or links).

`LoginFilter` deserves a separate discussion. It is a `Filter`, which is basically a `Servlet`; as such, it allows us to check the requested path and discriminate between accessible pages or resources based on whether the user is authenticated.

Authentication is obviously linked to the correctness of the `username` and `password` provided by the user. The example is deliberately simple; there is no database or remote source check. For teaching purposes, we will simply check if the `username` and `password` match hard-coded values. I intend to elaborate on this in a future post, showing a system to handle authentication with `JPA` and a simple role system.

Here is the filter code:
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
At this point, we create our JSF login page and our application index page, which can only be accessed if the user is authenticated.

From the NetBeans menu, we create a login page as shown below. We will follow the same steps to create the `index.xhtml` page in the directory secured by the filter.

![](/images/post/JSF22SecureLoginWebapp/JSF22SecureLoginWebappScreenshot10.png "JSF22SecureLoginWebappScreenshot10")

The code for `login.xhtml` is shown below; it is a minimal implementation. Only what is essential is included; we can then use templates to make the application responsive.

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

Finally, the code for the `index.xhtml` page:

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

The `web.xml` code is as follows:

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

