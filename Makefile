SHELL = /bin/bash
INSTALL = /usr/bin/install -c
MSGFMT = /usr/bin/msgfmt
SED = /bin/sed
DESTDIR =
bindir = /usr/bin
localedir = /usr/share/locale
icons = /usr/share/pixmaps
deskdir = /usr/share/applications
mandir = /usr/share/man/man1/

all:

install: all
	$(INSTALL) -d $(DESTDIR)$(bindir)
	$(INSTALL) -d $(DESTDIR)$(icons)
	$(INSTALL) -d $(DESTDIR)$(deskdir)
	$(INSTALL) -m755 timeset $(DESTDIR)$(bindir)
	$(INSTALL) -m644 timeset.png $(DESTDIR)$(icons)
	$(INSTALL) -m644 timeset.desktop $(DESTDIR)$(deskdir)
	for file in po/*.mo; \
	do \
		lang=$$(echo $$file | $(SED) -e 's#.*/\([^/]\+\).mo#\1#'); \
		$(INSTALL) -d $(DESTDIR)$(localedir)/$$lang/LC_MESSAGES; \
		$(INSTALL) -m644 $$file  $(DESTDIR)$(localedir)/$$lang/LC_MESSAGES/timeset.mo; \
	done