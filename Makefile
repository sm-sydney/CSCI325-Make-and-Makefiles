#Name: Sydney Marshall
#Filename: Makefile
#LDoM: 2/16/24
#Purpose: To practice writing Makefiles for a given project. 

#Compiler
CC = g++


# Compiler flags to compile with all errors and warnings 
CFLAGS = -c -Wall -Wextra

# Target executable name
TARGET = employee

# Source files 
SRCS = main.cpp Employee.cpp Officer.cpp Supervisor.cpp

# Object files 
OBJS = $(SRCS:.cpp=.o)

# Header files 
HEADERS = Employee.h Officer.h Supervisor.h

# default target- target is only dependency 
all: $(TARGET)

# compiles object files 
%.o: %.cpp $(HEADERS)
	$(CC) $(CFLAGS) $< -o $@

# this links the .o files and makes the binary 
$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET)

# compiles files from their source 
main.o: main.cpp $(HEADERS)
	$(CC) $(CFLAGS) $< -o $@

Employee.o: Employee.cpp Employee.h
	$(CC) $(CFLAGS) $< -o $@

Officer.o: Officer.cpp Officer.h
	$(CC) $(CFLAGS) $< -o $@

Supervisor.o: Supervisor.cpp Supervisor.h
	$(CC) $(CFLAGS) $< -o $@

# removes unwanted files 
clean:
	rm -f $(OBJS) *~ $(TARGET)
