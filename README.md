## Welcome to the Brightspot 101 Project

### Introduction

This project contains an example site which you can run locally to become familiar with Brightspot.

### Installation

**Download and install Tomcat**

    cd ~/
    mkdir workspace
    cd workspace
    curl -LOk http://psddev.com/brightspot-101/tomcat.zip
    unzip tomcat.zip


**Create MySQL Database**

    mysql -u username -p
    create database psd-fe;

Once you have created your database open the context.xml file found in `tomcat/conf/context.xml`

Line 30 - `username="USERNAME" password="PASSWORD"` replace with your local auth for your database.


**Clone Repo and Build Project**

    git clone https://github.com/trhoppe/psd-fe.git
    cd psd-fe
    mvn clean install

Once the project has built copy the war file into the webapps directory of your tomcat and name it `ROOT.war`.

    cd ../tomcat/webapps/
    cp ../../brightspot-101/target/psd-fe-1.0.0-SNAPSHOT.war ROOT.war

**Start Tomcat**

    cd tomcat
    ./bin/startup.sh


**Access the styleguide**

[http://localhost:8080/assets/styleguide](http://localhost:8080/assets/styleguide)
