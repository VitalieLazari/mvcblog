In order to build the project, on Dev machine you need to be installed (software used to create project):
JDK (Java version: 1.8.0_221)
Maven(version: 3.6.2)
Postgresql (version: 10.4-1)

Download project files from github 
which are available on the following address: 
https://github.com/VitalieLazari/mvcblog.git

Create a new database with name "esempla-blog" 
Run project in your IDE
After a successful compile, build project, with artifacts 
(in my case I used IntelliJ IDEA, so further steps are Build/Build artifacts/Build)  

Generated jar-file, obtained in previous step, should be placed in the working directory on server
server environment:
Java, to run the application
Postgresql, to store our data (don't forget to create database with name "esempla-blog")
NGINX, to handle web requests

a service should be created which will allow our app to run forever in the background 
and also regarding proxy requests, some work should be done in confguration file of NGINX, 
in "location" section (as far as I know)