echo -e "\e[36m>>>>>>>>>>>>>>>>> Creating Component Cart Service >>>>>>>>>\e[om"
cp cart.service /etc/systemd/system/cart.service &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>>>>> Downloading Nodejs >>>>>>>>>>\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>>>> Installing Nodejs >>>>>>>>\e[om"
yum install nodejs -y &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>>>>> Adding User To Application >>>>>>>>>>>\e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>> Removing The Directory >>>>>>>>>>\e[om"
rm -rf /app &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>>>> Creating Directory >>>>>>>>>>>>>\e[0m"
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>> Downloading Application Content >>>>>>>>>>\e[om"
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>> Changing Directory  >>>>>>>>>>\e[om"
cd /app &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>> Unzipping Cart File   >>>>>>>>>>\e[om"
unzip /tmp/cart.zip &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>> Changing Directory >>>>>>>>>>\e[om"
cd /app &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>> Downloading Dependencies >>>>>>>>>>\e[om"
npm install &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>> Reloading The Cart File >>>>>>>>>>\e[om"
systemctl daemon-reload &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>> Enabling The cart File >>>>>>>>>>\e[om"
systemctl enable cart &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>> Changing Directory >>>>>>>>>>\e[om"
systemctl restart cart &>>/tmp/roboshop.log