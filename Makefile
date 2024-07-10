.PHONY: all clean

# Compiler
CC := g++

# Object Files
objs := main.o help.o


# link all obj files into an executable
all: $(objs)
	$(CC) -o run.exe $^


# Compile all src files into obj files
$(objs): %.o: %.cpp
	$(CC) -c $^


# Remove all files with .o or .exe extensions
clean: 
	rm -f $(wildcard *.o) $(wildcard *.exe)
