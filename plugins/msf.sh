
gglog "try to install metasploit in this server"
install_msf(){
INSTALL='yum'
if [ $(test_cmd $INSTALL) -eq 0 ];then

yum update -y
yum install -y epel-release
yum update -y 
yum install -y httpd-devel openssl-devel zlib-devel gcc gcc-c++ curl-devel expat-devel gettext-devel sqlite-devel libxslt-devel libxml2-devel java-1.7.0-openjdk libpcap-devel nano openssl-devel zlib-devel ibffi-devel gdbm-devel readline-devel nano wget nmap  postgresql-devel postgresql-server tmux mosh

wget http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz && tar zxf yaml-0.1.4.tar.gz && cd yaml-0.1.4 && ./configure --prefix=/usr/local && make && make install 

curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
curl -L get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm reload
rvm requirements run
rvm install 2.6
rvm use 2.6 --default
gem update --system
gem install  wirble pg sqlite3 msgpack activerecord redcarpet rspec simplecov yard bundler

cd /opt/ && git clone https://github.com/rapid7/metasploit-framework.git && cd metasploit-framework/

for MSF in $(ls msf*); do
    ln -s /opt/metasploit-framework/$MSF /usr/local/bin/$MSF; 
done
bundle install

adduser msf
usermod -a -G root,msf, postgres
service postgresql start
chmod -R 777 /var/run/postgresql
if [ -d /var/www ]; then
	chmod -R 777 /var/www/html
fi
echo "source /etc/profile.d/rvm.sh" >> /home/msf/.bashrc

chown -R msf:msf /opt/metasploit-framework

firewall-cmd --zone=public --permanent --add-port=60000-61000/udp
firewall-cmd --zone=public --permanent --add-port=4444/tcp
firewall-cmd --zone=public --permanent --add-port=443/udp
firewall-cmd --zone=public --permanent --add-port=443/tcp
firewall-cmd --zone=public --permanent --add-port=80/tcp
firewall-cmd --reload

mosh-server

fi
}
