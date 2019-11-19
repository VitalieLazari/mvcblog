######ON DEV-MACHINE SIDE
##
##In order to build the project, on Dev machine you need to be installed (software used to create project):
##JDK (Java version: 1.8)
##Maven(version: 3.6.2)
##Postgresql (version: 10.4-1)
##
##Download project files from github  and open in IDE
##which are available on the following address: 
##https://github.com/VitalieLazari/mvcblog.git
##
##before starting configuring server environment, 
##a ssh key should be generated to let us interact with server without any obstacles
##
##steps to follow
##
########1. From IDEA's terminal run 
bash --login

##2. 
ssh-keygen                              
##agree with all

##3. 
cat ~/.ssh/id_rsa.pub

##4. 
scp ~/.ssh/id_rsa.pub [user]@[ipAddr]:/home/[user]/

##5. authorize on server 
ssh [user]@[ipAddr]

##6. 
mkdir .ssh

##7. 
cd .ssh/

##8. 
mv ~/id_rsa.pub ./authorized_keys

##9. 
exit
########




########CONFIGURING SERVER
##server environment:
##Java, to run the application
##Postgresql, to store our data
##NGINX, to handle web requests
##
sudo apt-get install -y nginx postgresql defaut-jdk
sudo -u postgres psql
alter user postgres with password '123'; 
create database esempla-blog;
##
##
##
##a service should be created which will allow our app to run forever in the background 
/etc/systemd/system/esemplaBlog.service
##
##esemplaBlog.service content
##
[Unit]
Description= EsemplaBlog
After=syslog.target
After=network.target[Service]
User= [user] # Define a user account that will own our app
Type=simple

[Service]
ExecStart=/usr/bin/java -jar /home/[user]/mvc-blog-1.0-SNAPSHOT.jar
Restart=always
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier= 'esemplaBlog'

[Install]
WantedBy=multi-user.target
##
##
##
##
##and also regarding proxy requests, some work should be done in confguration file of NGINX, 
##in "location" section 
##
##
sudo nano /etc/nginix/sites-enabled/default
##
##replace with 
##
location / {
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_pass http://localhost:8080;
}
##save and run command
sudo nginx -s reload
##
##
##

########
##Being logged in bash from terminal in IDEA, run deploy script
./scripts/deploy.sh

##Now we can access blog from computers which are in the same LAN 
##by entering ip address of our server in web-browsers address bar.
##User: admin
##Passwprd: Pass4admin
