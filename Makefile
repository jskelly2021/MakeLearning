.PHONY: all list_src clean

CC = g++
CFLAGS = -std=c++17 -Wall

BUILD_DIR := ./bin
SRC_DIRS := ./src
INC_DIRS := $(shell find $(SRC_DIRS) -type d) 
OBJ_DIRS := $(BUILD_DIR)

SRC_FILES := $(shell find $(SRC_DIR) -name *.cpp)
OBJ_FILES := main.o help.o

INCFLAGS := $(addprefix -I, $(INC_DIRS))

all: $(BUILD_DIR) $(OBJ_FILES)
	$(CC) -o run.exe $(OBJ_FILES)

$(OBJ_FILES): %.o: %.cpp
	$(CC) $(CFLAGS) $(INCFLAGS) -c $^

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

list_src:
	@echo $(SRC)

clean:
	@echo "Cleaning project..."
	@rm -f $(wildcard *.o) 
	@rm -f $(wildcard *.exe)
	@echo "Done"
