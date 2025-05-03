CC      = g++
CPPFLAGS = -O3 -c -std=c++11 -fopenmp -mno-avx -w -march=native -D_GLIBCXX_PARALLEL 
LDFLAGS = -fopenmp -m64 -lpthread  -lboost_timer -lboost_system -lboost_program_options

SOURCES = main.cpp 
OBJECTS = $(SOURCES:.cpp=.o)

all: $(SOURCES) frontorder

frontorder : $(OBJECTS)  
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@

.cpp.o : 
	$(CC) $(CPPFLAGS) $(OMP) $< -o $@

clean:
	rm -f *.o frontorder dump*

