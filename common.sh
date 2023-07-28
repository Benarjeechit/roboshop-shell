func_apppreq() { cp ${component}.service /etc/systemd/system/${component}.service
                 useradd roboshop
                 rm -rf /app
                 mkdir /app
}

func_systemd() { systemctl daemon-reload
                 systemctl enable ${component}
                 systemctl restart ${component}
}

func_nodejs() { cp mongo.repo /etc/yum.repos.d/mongo.repo
                curl -sL https://rpm.nodesource.com/setup_lts.x | bash
                yum install nodejs -y
                func_apppreq
                curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip  &>>/tmp/roboshop.log
                cd /app
                unzip /tmp/${component}.zip
                cd /app
                npm install
                yum install mongodb-org-shell -y
                mongo --host mongodb.benzdevops.online </app/schema/${component}.js &>>/tmp/roboshop.log
                func_systemd
}

func_python() { yum install python36 gcc python3-devel -y
                func_apppreq
                curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip
                cd /app
                unzip /tmp/${component}.zip
                cd /app
                pip3.6 install -r requirements.txt
                func_systemd
}

func_java() { yum install maven -y
              func_apppreq
              curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip
              cd /app
              unzip /tmp/${component}.zip
              cd /app
              mvn clean package
              mv target/${component}-1.0.jar ${component}.jar
              yum install mysql -y
              mysql -h mysql.benzdevops.online -uroot -pRoboShop@1 < /app/schema/${component}.sql
              func_systemd
}

func_golang() { yum install golang -y
               func_apppreq
               curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip
               cd /app
               unzip /tmp/${component}.zip
               cd /app
               go mod init dispatch
               go get
               go build
               func_systemd
}