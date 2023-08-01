#log=&>>/tmp/roboshop-shell
#func_apppreq() { echo -e "\e[36m>>>>>>>>>>>>>>>>> Creating Component  Service >>>>>>>>>\e[om"
#                 cp ${component}.service /etc/systemd/system/${component}.service ${log}

 #                echo -e "\e[36m>>>>>>>>>>>>>>>>> Adding User To Component >>>>>>>>>\e[om"
  #               useradd roboshop ${log}
   #              rm -rf /app ${log}
    #             mkdir /app ${log}
#}

#func_unzip() { echo -e "\e[36m>>>>>>>>>>>>>>>>> Unzipping Component >>>>>>>>>\e[om"
 #              cd /app ${log}
  #             unzip /tmp/${component}.zip ${log}
   #            cd /app ${log}
#}

#func_systemd() { echo -e "\e[36m>>>>>>>>>>>>>>>>> Enabling Component >>>>>>>>>\e[om"
 #                systemctl daemon-reload ${log}
  #               systemctl enable ${component} ${log}
   #              systemctl restart ${component} ${log}
#}

#func_nodejs() { echo -e "\e[36m>>>>>>>>>>>>>>>>> Creating Mongodb Repo File >>>>>>>>>\e[om"
 #               cp mongo.repo /etc/yum.repos.d/mongo.repo ${log}
#
 #               echo -e "\e[36m>>>>>>>>>>>>>>>>> Downloading Nodejs >>>>>>>>>\e[om"
  #              curl -sL https://rpm.nodesource.com/setup_lts.x | bash ${log}
#
 #               echo -e "\e[36m>>>>>>>>>>>>>>>>> Installing Nodejs >>>>>>>>>\e[om"
  #              yum install nodejs -y ${log}

   #             echo -e "\e[36m>>>>>>>>>>>>>>>>> Creating Component Service >>>>>>>>>\e[om"
    #            func_apppreq ${log}

     #           echo -e "\e[36m>>>>>>>>>>>>>>>>> Downloading Data To The Component >>>>>>>>>\e[om"
      #          curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip  &>>/tmp/roboshop.log ${log}

       #         echo -e "\e[36m>>>>>>>>>>>>>>>>> Unzipping Commponent >>>>>>>>>\e[om"
        #        func_unzip ${log}

         #       echo -e "\e[36m>>>>>>>>>>>>>>>>> Downloading Dependencies >>>>>>>>>\e[om"
          #      npm install ${log}

           #     echo -e "\e[36m>>>>>>>>>>>>>>>>> Instaliing Mongodb >>>>>>>>>\e[om"
            #    yum install mongodb-org-shell -y ${log}

             #   echo -e "\e[36m>>>>>>>>>>>>>>>>> Adding Schema To Database >>>>>>>>>\e[om"
              #  mongo --host mongodb.benzdevops.online </app/schema/${component}.js &>>/tmp/roboshop.log ${log}
               #  echo -e "\e[36m>>>>>>>>>>>>>>>>> Enabling Component >>>>>>>>>\e[om"
                #func_systemd ${log}
#}

#func_python() { echo -e "\e[36m>>>>>>>>>>>>>>>>> Installing Python >>>>>>>>>\e[om"
               # yum install python36 gcc python3-devel -y ${log}

              #  echo -e "\e[36m>>>>>>>>>>>>>>>>> Creating Component Service >>>>>>>>>\e[om"
             #   func_apppreq ${log}

            #    echo -e "\e[36m>>>>>>>>>>>>>>>>> Downloading Data To The Component >>>>>>>>>\e[om"
           #     curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip ${log}

                #echo -e "\e[36m>>>>>>>>>>>>>>>>> Unzipping Component>>>>>>>>>\e[om"
                #func_unzip ${log}
                #echo -e "\e[36m>>>>>>>>>>>>>>>>> Downloading dependencies >>>>>>>>>\e[om"
                #pip3.6 install -r requirements.txt ${log}
               # func_systemd ${log}
#}

#func_java() { echo -e "\e[36m>>>>>>>>>>>>>>>>> Installing Maven >>>>>>>>>\e[om"
           #   yum install maven -y ${log}
          #    func_apppreq ${log}
         #     echo -e "\e[36m>>>>>>>>>>>>>>>>> Downloading Data To The Component  >>>>>>>>>\e[om"
        #      curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip ${log}
       #       func_unzip ${log}
        #      echo -e "\e[36m>>>>>>>>>>>>>>>>> Creating Jar File >>>>>>>>>\e[om"
       #       mvn clean package ${log}
      #       mv target/${component}-1.0.jar ${component}.jar ${log}
     #         echo -e "\e[36m>>>>>>>>>>>>>>>>> Installing Mysql Database >>>>>>>>>\e[om"
    #          yum install mysql -y ${log}
   #           echo -e "\e[36m>>>>>>>>>>>>>>>>> Adding User Password >>>>>>>>>\e[om"
  #            mysql -h mysql.benzdevops.online -uroot -pRoboShop@1 < /app/schema/${component}.sql ${log} ${log}
 #             func_systemd
#}

#func_golang() { echo -e "\e[36m>>>>>>>>>>>>>>>>> Installing Golang >>>>>>>>>\e[om"
          #     yum install golang -y ${log}
         #      func_apppreq ${log}
        #       echo -e "\e[36m>>>>>>>>>>>>>>>>> Downlading Data To The Application >>>>>>>>>\e[om"
       #        curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip ${log}
      #         func_unzip ${log}
     #          echo -e "\e[36m>>>>>>>>>>>>>>>>> Ready For Dispatch >>>>>>>>>\e[om"
    #           go mod init dispatch ${log}
   #            go get ${log}
  #             go build ${log}
 #              func_systemd
#}