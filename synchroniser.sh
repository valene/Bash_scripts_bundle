#! /usr/bin/bash
#Another bash one-liner to monitor and synchronise
#change functions according to need

copy_data () {
	rsync -avh --progress "$1" username@remotehost:/path/to/synchronis
	}

restart_server () {
	systemctl stop minidlna.service && minidlnad -R && systemctl start minidlna.service
	}

send_mail () {
	echo "$1" | mail -s "new data" email_id@emailaddr  
	}

for d in "$(dirname `find $pwd -mtime -1` | sort -nr | uniq -c | rev | cut -d ' ' -f1 | rev | sed -s '|./||' )" 
do 
  rsync -avh --progress "$d" username@remotehost:/path/to/remote/host
  #copy_data $d
  #restart_server
  #send_email $d
done
