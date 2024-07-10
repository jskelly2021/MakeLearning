all: compile link run

compile: 
	g++ -c -std=c++17 -Wall *.cpp

link:
	g++ -o run *.o -lm

run:
	./run

clean:
	@echo "Cleaning up..."
	del *.o *.exe /s
