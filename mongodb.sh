echo -e "\e[36m>>>>>>>>>>>>>>>> Creating Mongo Repo File >>>>>>>>> \e[0m"
cp mongo.repo /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>>>> Installing Mongodb  >>>>>>>>> \e[0m"
yum install mongodb-org -y &>>/tmp/roboshp.log

echo -e "\e[36m>>>>>>>>>>>>>>>> Update listen address from 127.0.0.1 to 0.0.0.0 in /etc/mongod.conf >>>>>>>>> \e[0m"
sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf

echo -e "\e[36m>>>>>>>>>>>>>>>> Enabling Mongod >>>>>>>>> \e[0m"
systemctl enable mongod &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>>>> Restart  Mongod >>>>>>>>> \e[0m"
systemctl restart mongod &>>/tmp/roboshop.log