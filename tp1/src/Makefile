
CPP = g++
CPPFLAGS = -Wall -Wextra -Werror -pedantic -g -O3
BINS = heat


all: $(BINS)


heat: heat.cc
	$(CPP) $(CPPFLAGS) -fopenmp -o $@ $<

clean:
	rm -rf $(BINS)
