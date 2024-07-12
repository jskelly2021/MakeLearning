.PHONY: all list_src list_obj list_inc clean

CXX = g++
CFLAGS = -std=c++17 -Wall

BUILD_DIR := ./bin
SRC_DIRS := ./src
INC_DIRS := $(shell find $(SRC_DIRS) -type d) 
OBJ_DIRS := ./

SRC_FILES := $(shell find $(SRC_DIRS) -name *.cpp)
BUILD_FILES := $(patsubst %.cpp, %.o, $(SRC_FILES))
OBJ_FILES = $(shell find $(OBJ_DIRS) -name *.o)

INCFLAGS := $(addprefix -I, $(INC_DIRS))

all: $(BUILD_DIR) $(BUILD_FILES)
	$(CXX) -o run.exe $(OBJ_FILES)

$(BUILD_FILES): %.o: %.cpp
	$(CXX) $(CFLAGS) $(INCFLAGS) -c $^

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

list_src:
	@echo $(SRC_FILES)

list_obj:
	@echo $(OBJ_FILES)

list_inc:
	@echo $(INC_DIRS)

clean:
	@echo "Cleaning project..."
	@rm -f $(wildcard *.o) 
	@rm -f $(wildcard *.exe)
	@echo "Done"
