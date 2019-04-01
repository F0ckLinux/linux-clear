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