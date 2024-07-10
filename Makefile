SRC_DIR := ./src
SRC := $(shell find $(SRC_DIR) -name *.cpp)

#OBJ_DIR :=
#OBJ :=

all: main.o
	g++ -o run.exe main.o

main.o: src/main.cpp
	g++ -c $(SRC_DIR)

list_src:
	@echo $(SRC)

clean:
	rm -f $(wildcard *.o) $(wildcard *.exe)
