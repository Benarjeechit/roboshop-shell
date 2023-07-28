yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
yum module enable redis:remi-6.2 -y
yum install redis -y
echo -e "\e[36m>>>>>>> Update listen address from 127.0.0.1 to 0.0.0.0 in /etc/redis.conf & /etc/redis/redis.conf >>>\e[0m"
echo -e "\e[36m>>>>>>>>>>>>>>>>> Downloading Nodejs >>>>>>>>>>\e[0m"
sed -i 's/127.0.0.1/0.0.0.0/'
systemctl enable redis
systemctl restart redis