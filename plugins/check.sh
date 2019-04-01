#!/bin/bash
gglog 'load' "deepcheck";
deepcheck() {
    echo -ne "found and delete or only found [y/other]:${UNDERLINE}"
    read FOUND_DELE
    echo -e "${REST} check"
    for f in $(grep -Ilr "$my_ip" /var/log/);do
        gglog "Ip exists in $f , clear"
        sed -ie "/$my_ip/d" $f;
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