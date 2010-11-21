
PROGRAMS=postmark

all: $(PROGRAMS)

CC=gcc -O2 -g -Wall -pipe

MAINSRC=postmark-1.51.c

postmark: $(MAINSRC)
	$(CC) $(MAINSRC) $(OBJS) -o postmark $(LFLAGS)

install:
	mkdir -p $(DESTDIR)/usr/bin
	strip postmark
	cp $(PROGRAMS) $(DESTDIR)/usr/bin

%.o: %.cpp %.h
	$(CC) -c $< -o $@

clean:
	rm -f $(PROGRAMS) build-stamp install-stamp build
	rm -rf debian/tmp err out
