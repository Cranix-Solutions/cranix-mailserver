HERE            = $(shell pwd)
PACKAGE         = cranix-mailserver
DESTDIR         = /
DATE            = $(shell date "+%Y%m%d")
INSTUSER        =
REPO            = /home/OSC/home:pvarkoly:CRANIX/

install:
	mkdir -p $(DESTDIR)/usr/share/cranix/templates/mailserver
	mkdir -p $(DESTDIR)/usr/share/cranix/tools/mailserver
	rsync -a tools/ $(DESTDIR)/usr/share/cranix/tools/mailserver/
	rsync -a dovecot/ $(DESTDIR)/usr/share/cranix/templates/mailserver/dovecot/

