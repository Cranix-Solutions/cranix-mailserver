#!/bin/bash

for u in $( /usr/sbin/crx_get_all_user.sh )
do
	role=$( /usr/sbin/crx_api_text.sh GET users/byUid/${u}/role )
	if [ ${role} = "workstations" ]; then
		continue
	fi
	echo "==================================="
        echo "migrate $u"
        ./cyrus2dovecot $u
done
