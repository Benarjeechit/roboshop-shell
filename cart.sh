echo -e "\e[36m>>>>>>>>>>>>>>>>> Creating Component Cart Service >>>>>>>>>\e[om" | tea -a /tmp/roboshop.log
cp cart.service /etc/systemd/system/cart.service

echo -e "\e[36m>>>>>>>>>>>>>>>>> Downloading Nodejs >>>>>>>>>>\e[0m" | tea -a /tmp/roboshop.log
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[36m>>>>>>>>>>>>>>>> Installing Nodejs >>>>>>>>\e[om" | tea -a /tmp/roboshop.log
yum install nodejs -y

echo -e "\e[36m>>>>>>>>>>>>>>>>> Adding User To Application >>>>>>>>>>>\e[0m" | tea -a /tmp/roboshop.log
useradd roboshop

echo -e "\e[36m>>>>>>>>>>>>>> Removing The Directory >>>>>>>>>>\e[om" | tea -a /tmp/roboshop.log
rm -rf app

echo -e "\e[36m>>>>>>>>>>>>>>>> Creating Directory >>>>>>>>>>>>>\e[0m" | tea -a /tmp/roboshop.log
mkdir /app

echo -e "\e[36m>>>>>>>>>>>>>> Downloading Application Content >>>>>>>>>>\e[om" | tea -a /tmp/roboshop.log
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip

echo -e "\e[36m>>>>>>>>>>>>>> Changing Directory  >>>>>>>>>>\e[om" | tea -a /tmp/roboshop.log
cd /app

echo -e "\e[36m>>>>>>>>>>>>>> Unzipping Cart File   >>>>>>>>>>\e[om" | tea -a /tmp/roboshop.log
unzip /tmp/cart.zip

echo -e "\e[36m>>>>>>>>>>>>>> Changing Directory >>>>>>>>>>\e[om" | tea -a /tmp/roboshop.log
cd /app

echo -e "\e[36m>>>>>>>>>>>>>> Downloading Dependencies >>>>>>>>>>\e[om" | tea -a /tmp/roboshop.log
npm install

echo -e "\e[36m>>>>>>>>>>>>>> Reloading The Cart File >>>>>>>>>>\e[om" | tea -a /tmp/roboshop.log
systemctl daemon-reload

echo -e "\e[36m>>>>>>>>>>>>>> Enabling The cart File >>>>>>>>>>\e[om" | tea -a /tmp/roboshop.log
systemctl enable cart

echo -e "\e[36m>>>>>>>>>>>>>> Changing Directory >>>>>>>>>>\e[om" | tea -a /tmp/roboshop.log
systemctl restart cart