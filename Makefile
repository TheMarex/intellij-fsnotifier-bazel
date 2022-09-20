SRCS=main.c inotify.c util.c
HDRS=fsnotifier.h
DESTDIR=/usr/share/idea/bin

fsnotifier: $(SCRS) $(HDRS)
	cc -O3 -Wall -Wextra -Wpedantic -Wno-unknown-pragmas -std=c11 $(SRCS) -o $@;

.PHONY: install
install: fsnotifier
	test -f $(DESTDIR)/fsnotifier.orig && echo "Already existing backup of fsnotifier" || true
	test ! -f $(DESTDIR)/fsnotifier.orig && echo "Creating a backup of fsnotifier" && mv $(DESTDIR)/fsnotifier $(DESTDIR)/fsnotifier.orig || true
	install -m 755 fsnotifier $(DESTDIR)/fsnotifier

.PHONY: uninstall
uninstall:
	mv $(DESTDIR)/fsnotifier.orig $(DESTDIR)/fsnotifier
