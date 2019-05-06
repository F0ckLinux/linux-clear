gglog 'load recent to see changed file recently'

f2(){
   gglog "in $1: "
   if [[ $2 == "" ]];then
       T="1"
   else
       T="$2";
   fi
   find $1  -maxdepth 2 -type d -newerct "$T week ago" -exec echo -e $ColorBlue {} \;
}

Res(){
    gglog $1 " week ..."
    find /etc/ -newerct "$1 week ago " -type f;
    f2 /var $1;
    if [ -d /home ];then
      f2 /home $1
    fi
    gglog "run ..."
    ls /var/run;
}
