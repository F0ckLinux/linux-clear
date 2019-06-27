INSTALL='yum'
if [ $(test_cmd $INSTALL) -eq 0 ];then
    $INSTALL install - y curl;
else
    apt-get install -y curl;
fi
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall
