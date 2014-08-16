
CPP = g++
CPPFLAGS = -Wall -Wextra -Werror -pedantic -g -O3 -fopenmp
BINS = heat
BINDIR = ../bin


.PHONY: all clean


heat: heat.cc
	$(CPP) $(CPPFLAGS) -o $@ $<
	mv $@ $(BINDIR)

all: heat

clean:
	rm -f $(BINDIR)/$(BINS)
