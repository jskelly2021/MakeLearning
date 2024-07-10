.PHONY: all clean

CC = g++
CFLAGS = -std=c++17 -Wall

SRC_DIR := ./src
SRC := $(shell find $(SRC_DIR) -name *.cpp)

#OBJ_DIR :=
OBJ := main.o help.o

all: $(OBJ)
	$(CC) -o run.exe $^

$(OBJ): %.o: %.cpp
	$(CC) $(CFLAGS) -c $^

list_src:
	@echo $(SRC)

clean:
	rm -f $(wildcard *.o) $(wildcard *.exe)
