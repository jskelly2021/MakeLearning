
CC = g++
objs = main.o help.o

all: $(objs)
	$(CC) -o run.exe $^

main.o: main.cpp
	$(CC) -c main.cpp 

help.o: help.cpp
	$(CC) -c help.cpp 

clean: 
	rm $(wildcard *.o) $(wildcard *.exe)