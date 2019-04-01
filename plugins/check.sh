#!/bin/bash
ggplot 'load' "deepcheck";
deepcheck() {
    echo -n "found and delete or only found [y/other]:${UNDERLINE}"
    read FOUND_DELE
    echo  "${REST} check"
    for f in $(grep -Ilr "$my_ip" /var/log/);do
        ggplot "Ip exists in $f , clear"
        sed -ie "/$my_ip/d" $f;
    done
}
ggplot 'load' 'ss-check to check if open ss'
ss-check() {
    ggplot "searching config file for ss"
    grep -nIr "server_port" /etc/  2>/dev/null
    ggplot "searching log file for ss"
    find /var/log -name "*shadowsocks*"
    if [ $(( $(ps aux | grep shadowsocks | grep -v 'grep' | wc -l) )) -gt 0 ];then
        ggplot "this server running shadowsocks"
    fi
}