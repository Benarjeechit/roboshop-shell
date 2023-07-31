echo -e "\e[36m>>>>>>>>>>>>>>>> Installing NGINX >>>>>>>>> \e[0m"
yum install nginx -y &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>>>> Creating  NGINX File >>>>>>>>> \e[0m"
cp nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>>>> Cleaning UP NGINX >>>>>>>>> \e[0m"
rm -rf /usr/share/nginx/html/* &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>>>> Downloading Application Data >>>>>>>>> \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>>>> Unzipping  NGINX >>>>>>>>> \e[0m"
cd /usr/share/nginx/html &>>/tmp/roboshop.log
unzip /tmp/frontend.zip &>>/tmp/roboshop.log

echo -e "\e[36m>>>>>>>>>>>>>>>> Enabling Component >>>>>>>>> \e[0m"
systemctl enable nginx &>>/tmp/roboshop.log
systemctl restart nginx &>>/tmp/roboshop.log