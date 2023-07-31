#component=user
#source common.sh

#func_nodejs
cp user.service /etc/systemd/system/user.service
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd roboshop
rm -rf /app
mkdir /app
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
unzip /tmp/user.zip
cd /app
npm install
systemctl daemon-reload
systemctl enable user
systemctl start user
yum install mongodb-org-shell -y
mongo --host mongodb.benzdevops.online </app/schema/user.js

