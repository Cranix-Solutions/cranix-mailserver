#!/bin/bash

grep 'Cannot parse' nohup.out > not-parsed
for i in $( cat not-parsed )
do
        user=$( echo "$i" | sed 's/.*\[//' | sed 's/\].*//' )
        echo "migrate $user"
        pth=$( echo "$i" | gawk '{  print $6 }' | sed 's/\.$//' )
        rm $pth
        ./cyrus2dovecot $user
done
chown -R mail:maildrop /var/spool/dovecot/
