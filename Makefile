.PHONY: all list_src list_obj list_inc clean

CXX = g++
CFLAGS = -std=c++17 -Wall
EXE := run.exe 

BUILD_DIR := ./bin
SRC_DIR := ./src
INC_DIRS := $(shell find $(SRC_DIR) -type d) 
OBJ_DIRS := $(BUILD_DIR)

SRC_FILES := $(shell find $(SRC_DIR) -name "*.cpp")
BUILD_OBJS := $(patsubst %.cpp, %.o, $(SRC_FILES))
OBJ_FILES = $(shell find $(OBJ_DIRS) -name "*.o")

INCFLAGS := $(addprefix -I, $(INC_DIRS))

all: $(BUILD_DIR) $(BUILD_OBJS) $(EXE)

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

#TODO: Compiler thinks .o file doesn't exist because it isn't looking in the ./bin directory
%.o: %.cpp
	$(CXX) $(CFLAGS) $(INCFLAGS) -c -o $(BUILD_DIR)/$(notdir $@) $^

$(EXE): 
	$(CXX) -o $(EXE) $(OBJ_FILES)

list_src: ; @echo $(SRC_FILES)
list_obj: ; @echo $(OBJ_FILES)
list_build: ; @echo $(BUILD_OBJS)
list_inc: ; @echo $(INC_DIRS)

clean:
	@echo "Cleaning project..."
	@rm -f $(wildcard $(BUILD_DIR)/*.o) 
	@rm -f $(wildcard *.exe)
	@echo "Done"
