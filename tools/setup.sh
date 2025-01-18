#!/bin/bash

echo "Configure dovecot"
LDAPBASE=$(/usr/sbin/crx_get_dn.sh)
registerpw=$( /usr/bin/grep de.cranix.dao.User.Register.Password= /opt/cranix-java/conf/cranix-api.properties | sed 's/de.cranix.dao.User.Register.Password=//' )
doveadminpw=$(/usr/bin/mktemp XXXXXXXXXX)
/usr/bin/rsync -a /usr/share/cranix/templates/mailserver/dovecot/ /etc/dovecot/
/usr/bin/sed -i s/#DOVEADMIPW#/${doveadminpw}/  /etc/dovecot/master-users
/usr/bin/sed -i s/#REGISTERPW#/${registerpw}/  /etc/dovecot/master-users
/usr/bin/sed -i s/#LDAPBASE#/${LDAPBASE}/  /etc/dovecot/dovecot-ldap.conf.ext

echo "Configure postfix"
/usr/sbin/postconf mailbox_transport=lmtp:unix:private/lmtp-dovecot
