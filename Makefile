gcc `pkg-config wayland-client --cflags --libs` -I. -I./libweston -I/usr/include/cairo -g -O2 -c -o term.o term.c

gcc `pkg-config wayland-client --cflags --libs` -g -fvisibility=hidden -I/usr/include/cairo -O2 -Wl,-z -Wl,relro -o term term.o  ./.libs/libtoytoolkit.a -lwayland-client -lxkbcommon -lwayland-cursor -lpixman-1 -lcairo -lpng16 -ljpeg -lm -lutil
