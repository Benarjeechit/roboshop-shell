echo -e "\e[36m>>>>>>>>>>>>>>>>> Creating Component Cart Service >>>>>>>>>\e[om" | tea -a Cart File
cp cart.service /etc/systemd/system/cart.service

echo -e "\e[36m>>>>>>>>>>>>>>>>> Downloading Nodejs >>>>>>>>>>\e[0m" | tea -a Cart File
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[36m>>>>>>>>>>>>>>>> Installing Nodejs >>>>>>>>\e[om" | tea -a Cart File
yum install nodejs -y

echo -e "\e[36m>>>>>>>>>>>>>>>>> Adding User To Application >>>>>>>>>>>\e[0m" | tea -a Cart File
useradd roboshop

echo -e "\e[36m>>>>>>>>>>>>>> Removing The Directory >>>>>>>>>>\e[om" | tea -a Cart File
rm -rf app

echo -e "\e[36m>>>>>>>>>>>>>>>> Creating Directory >>>>>>>>>>>>>\e[0m" | tea -a Cart File
mkdir /app

echo -e "\e[36m>>>>>>>>>>>>>> Downloading Application Content >>>>>>>>>>\e[om" | tea -a Cart File
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip

echo -e "\e[36m>>>>>>>>>>>>>> Changing Directory  >>>>>>>>>>\e[om" | tea -a Cart File
cd /app

echo -e "\e[36m>>>>>>>>>>>>>> Unzipping Cart File   >>>>>>>>>>\e[om" | tea -a Cart File
unzip /tmp/cart.zip

echo -e "\e[36m>>>>>>>>>>>>>> Changing Directory >>>>>>>>>>\e[om" | tea -a Cart File
cd /app

echo -e "\e[36m>>>>>>>>>>>>>> Downloading Dependencies >>>>>>>>>>\e[om" | tea -a Cart File
npm install

echo -e "\e[36m>>>>>>>>>>>>>> Reloading The Cart File >>>>>>>>>>\e[om" | tea -a Cart File
systemctl daemon-reload

echo -e "\e[36m>>>>>>>>>>>>>> Enabling The cart File >>>>>>>>>>\e[om" | tea -a Cart File
systemctl enable cart

echo -e "\e[36m>>>>>>>>>>>>>> Changing Directory >>>>>>>>>>\e[om" | tea -a Cart File
systemctl restart cart