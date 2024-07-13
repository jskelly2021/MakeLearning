.PHONY: all list_src list_obj list_build list_inc lsit_lib clean

# Compiler
CXX = g++

# Compiler Flags
CFLAGS = -std=c++17 -Wall

# Executable to be created
EXE := run.exe

BUILD_PATH := ./build
SRC_PATH := ./src
INC_PATHS := $(SRC_PATH) ./include
LIB_PATHS := ./lib
OBJ_PATHS := $(BUILD_PATH)

# Directories to search in
INC_DIRS := $(shell find $(INC_PATHS) -type d)
LIB_DIRS := $(shell find $(LIB_PATHS) -type d)

# Searches search for givin file type in list of given list of directories
SRC_FILES := $(shell find $(SRC_PATH) -name "*.cpp")
OBJ_FILES = $(shell find $(OBJ_PATHS) -name "*.o")

# Creates a list of object files for each source file in SRC_FILES
BUILD_OBJS := $(patsubst %.cpp, $(BUILD_PATH)/%.o, $(notdir $(SRC_FILES)))

INCFLAGS := $(addprefix -I, $(INC_DIRS))
LIBFLAGS := $(addprefix -L, $(LIB_DIRS)) -lraylib -lgdi32 -lwinmm

# Look for given file type in given list of directories when needed as a prereqs
vpath %.cpp $(INC_DIRS)

all: $(BUILD_PATH) $(BUILD_OBJS) $(EXE)

# Ensure the build directory is created
$(BUILD_PATH):
	@mkdir -p $(BUILD_PATH)

# For every object file in BUILD_PATH, make searches vpath for src file that matches
$(BUILD_PATH)/%.o: %.cpp
	$(CXX) -c $^ -o $@ $(CFLAGS) $(INCFLAGS) 

# Link objects and create an executable
$(EXE):
	$(CXX) -o $(EXE) $(OBJ_FILES) $(LIBFLAGS)

list_src: ; @echo $(SRC_FILES)
list_obj: ; @echo $(OBJ_FILES)
list_build: ; @echo $(BUILD_OBJS)
list_inc: ; @echo $(INC_DIRS)
list_lib: ; @echo $(LIB_DIRS)

clean:
	@echo "Cleaning project..."
	@rm -f $(wildcard $(BUILD_PATH)/*.o) 
	@rm -f $(wildcard *.exe)
	@echo "Done"
