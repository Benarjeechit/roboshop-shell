echo -e "\e[36m>>>>>>>>>>>>>>>>> Creating Component Cart Service >>>>>>>>>\e[om" | tea -a /tmp/roboshop.log
cp cart.service /etc/systemd/system/cart.service &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>>>>> Downloading Nodejs >>>>>>>>>>\e[0m" | tea -a /tmp/roboshop.log
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>>>> Installing Nodejs >>>>>>>>\e[om" | tea -a /tmp/roboshop.log
yum install nodejs -y &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>>>>> Adding User To Application >>>>>>>>>>>\e[0m" | tea -a /tmp/roboshop.log
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>> Removing The Directory >>>>>>>>>>\e[om" | tea -a /tmp/roboshop.log
rm -rf /app &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>>>> Creating Directory >>>>>>>>>>>>>\e[0m" | tea -a /tmp/roboshop.log
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>> Downloading Application Content >>>>>>>>>>\e[om" | tea -a /tmp/roboshop.log
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>> Changing Directory  >>>>>>>>>>\e[om" | tea -a /tmp/roboshop.log
cd /app &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>> Unzipping Cart File   >>>>>>>>>>\e[om" | tea -a /tmp/roboshop.log
unzip /tmp/cart.zip &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>> Changing Directory >>>>>>>>>>\e[om" | tea -a /tmp/roboshop.log
cd /app &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>> Downloading Dependencies >>>>>>>>>>\e[om" | tea -a /tmp/roboshop.log
npm install &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>> Reloading The Cart File >>>>>>>>>>\e[om" | tea -a /tmp/roboshop.log
systemctl daemon-reload &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>> Enabling The cart File >>>>>>>>>>\e[om" | tea -a /tmp/roboshop.log
systemctl enable cart &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>> Changing Directory >>>>>>>>>>\e[om" | tea -a /tmp/roboshop.log
systemctl restart cart &>>/tmp/roboshop.log