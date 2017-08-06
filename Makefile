# TODO: after reinstall switch to clang

all:
	@echo NoOp

WHERE=$(shell echo `whereami` | tr [a-z] [A-Z])

term: term.c
	gcc -D$(WHERE) `pkg-config wayland-client --cflags --libs` -I$(shell ls -d /usr/local/src/weston-*/libweston) -I/usr/include/cairo -g -O2 -c -o $@.o $<
	gcc `pkg-config wayland-client --cflags --libs` -g -fvisibility=hidden -I/usr/include/cairo -O2 -Wl,-z -Wl,relro -o $@ $@.o  $(shell ls /usr/local/src/weston-*/.libs/libtoytoolkit.a) -lwayland-client -lxkbcommon -lwayland-cursor -lpixman-1 -lcairo -lpng16 -ljpeg -lm -lutil
	mv -f $@ /usr/local/bin/
