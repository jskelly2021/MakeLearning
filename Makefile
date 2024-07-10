SRC_DIR := src/main.cpp

all: main.o
	g++ -o run.exe main.o

main.o: src/main.cpp
	g++ -c $(SRC_DIR)

clean:
	rm -f $(wildcard *.o) $(wildcard *.exe)
