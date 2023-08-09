--- 
layout: post
lang: en
title: "How can I include external jar on my Netbeans project"
excerpt: ""
category: "Computer Science"
date:   2017-09-16 22:45:33
modified: 2017-09-16 22:45:33
tags: [English,NetBeans,Java]
comments: true
share: true
---

> “Measuring programming progress by lines of code is like measuring aircraft building 
progress by weight.”
>
> – Bill Gates



An example of build.xml file

{% highlight xml %} 
<?xml version="1.0" encoding="UTF-8"?>
<!-- You may freely edit this file. See commented blocks below for -->
<!-- some examples of how to customize the build. -->
<!-- (If you delete it and reopen the project it will be recreated.) -->
<!-- By default, only the Clean and Build commands use this build script. -->
<!-- Commands such as Run, Debug, and Test only use this build script if -->
<!-- the Compile on Save feature is turned off for the project. -->
<!-- You can turn off the Compile on Save (or Deploy on Save) setting -->
<!-- in the project's Project Properties dialog box.-->
<project name="MyCommand" default="default" basedir=".">
    <description>Builds, tests, and runs the project MyCommand.</description>
    <import file="nbproject/build-impl.xml"/>
    
    <target name="-post-jar">

    <!-- Change the value to the name of the final jar without .jar -->
    <property name="store.jar.name" value="MyCommand"/>

    <!-- don't edit below this line -->
    <property name="store.dir" value="dist"/>
    <property name="temp.dir" value="temp"/>
    <property name="store.jar" value="${store.dir}/${store.jar.name}.jar"/>

    <echo message="Packaging ${application.title} into a single JAR at ${store.jar}"/>

    <delete dir="${temp.dir}"/>
    <mkdir dir="${temp.dir}"/>

    <jar destfile="${temp.dir}/temp_final.jar" filesetmanifest="skip">
        <zipgroupfileset dir="dist" includes="*.jar"/>
        <zipgroupfileset dir="dist/lib" includes="*.jar"/>

        <manifest>
            <attribute name="Main-Class" value="${main.class}"/>
        </manifest>
    </jar>

    <delete dir="${store.dir}"/>

    <zip destfile="${store.jar}">
        <zipfileset src="${temp.dir}/temp_final.jar"
        excludes="META-INF/*.SF, META-INF/*.DSA, META-INF/*.RSA"/>
    </zip>

    <delete dir="${temp.dir}"/>

    </target>
    
    <!--

    There exist several targets which are by default empty and which can be 
    used for execution of your tasks. These targets are usually executed 
    before and after some main targets. They are: 

      -pre-init:                 called before initialization of project properties
      -post-init:                called after initialization of project properties
      -pre-compile:              called before javac compilation
      -post-compile:             called after javac compilation
      -pre-compile-single:       called before javac compilation of single file
      -post-compile-single:      called after javac compilation of single file
      -pre-compile-test:         called before javac compilation of JUnit tests
      -post-compile-test:        called after javac compilation of JUnit tests
      -pre-compile-test-single:  called before javac compilation of single JUnit test
      -post-compile-test-single: called after javac compilation of single JUunit test
      -pre-jar:                  called before JAR building
      -post-jar:                 called after JAR building
      -post-clean:               called after cleaning build products

    (Targets beginning with '-' are not intended to be called on their own.)

    Example of inserting an obfuscator after compilation could look like this:

        <target name="-post-compile">
            <obfuscate>
                <fileset dir="${build.classes.dir}"/>
            </obfuscate>
        </target>

    For list of available properties check the imported 
    nbproject/build-impl.xml file. 


    Another way to customize the build is by overriding existing main targets.
    The targets of interest are: 

      -init-macrodef-javac:     defines macro for javac compilation
      -init-macrodef-junit:     defines macro for junit execution
      -init-macrodef-debug:     defines macro for class debugging
      -init-macrodef-java:      defines macro for class execution
      -do-jar:                  JAR building
      run:                      execution of project 
      -javadoc-build:           Javadoc generation
      test-report:              JUnit report generation

    An example of overriding the target for project execution could look like this:

        <target name="run" depends="MyCommand-impl.jar">
            <exec dir="bin" executable="launcher.exe">
                <arg file="${dist.jar}"/>
            </exec>
        </target>

    Notice that the overridden target depends on the jar target and not only on 
    the compile target as the regular run target does. Again, for a list of available 
    properties which you can use, check the target you are overriding in the
    nbproject/build-impl.xml file. 

    -->
</project>
{% endhighlight %}