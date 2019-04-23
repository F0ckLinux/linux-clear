gglog "load \"beef-build\" to build beef : "

beef-build(){
  echo -ne "set user:{$UNDERLINE}";
  read users;
  echo -ne "${REST}set pass:{$UNDERLINE}";
  read passwd;
  if [ $(test_cmd yum ) -eq 0 ];then
    yum install -y yum-utils device-mapper-persistent-data lvm2
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo;
     yum makecache fast;
     yum install docker-ce;
    systemctl start docker.service
  else
    apt-get install -y docker.io
  fi
  if [ $? -eq 0 ];then
  docker run -itd \
           --name=beef \
           -p 3000:3000 \
           -p 6789:6789 \
           -p 61985:61985 \
           -p 61986:61986 \
           -e BEEF_USER=$users \
           -e BEEF_PASSWORD=$passwd \
           ilyaglow/beef
   gglog " beef build to see : $my_ip:3000/beef/"
  fi
}
