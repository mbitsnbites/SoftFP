CC=gcc
CFLAGS=-O2 -Wall -g -Werror -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -MMD
CFLAGS+=-DCONFIG_VERSION=\"$(shell cat VERSION)\"
LDFLAGS=

PROGS=softfptest

all: $(PROGS)

softfptest: softfptest.o softfp.o softfloat.o
	$(CC) $(LDFLAGS) -o $@ $^ -lm

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f *.o *.d *~ $(PROGS)

-include $(wildcard *.d)

