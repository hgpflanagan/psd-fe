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
	create database bsp101;

Once you have created your database open the context.xml file found in `tomcat/conf/context.xml`
	
Line 30 - `username="USERNAME" password="PASSWORD"` replace with your local auth for your database.


**Clone Repo and Build Project**

	git clone git@github.com:perfectsense/brightspot-101.git
	cd brightspot-101
	mvn clean install
	
Once the project has built copy the war file into the webapps directory of your tomcat and name it `ROOT.war`.

	cd ../tomcat/webapps/
	cp ../../brightspot-101/target/brightspot-1.0.0-SNAPSHOT.war ROOT.war	

**Start Tomcat**

	cd tomcat
	./bin/startup.sh
	

**Access the CMS**

[http://localhost:8080/cms](http://localhost:8080/cms)

Default login UN: admin PW: brightspot


**Add Data**

Navigate to the Database tool [http://localhost:8080/_debug/db-bootstrap](http://localhost:8080/_debug/db-bootstrap)

In the resources directory of the github repo find the database.zip - unzip.

On the right hand side of the DB-Bootstrap tool choose the database txt file and import.

If the data doesn't appear in the CMS, restart Tomcat.

	
	

