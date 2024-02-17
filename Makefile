#Name: Sydney Marshall
#Filename: Makefile
#LDoM: 2/16/24
#Purpose: To practice writing Makefiles for a given project. 

CC = g++

CFLAGS = -c -Wall -Wextra

TARGET = employee

SRCS = main.cpp Employee.cpp Officer.cpp Supervisor.cpp

OBJS = $(SRCS:.cpp=.o)

HEADERS = Employee.h Officer.h Supervisor.h

all: $(TARGET)

%.o: %.cpp $(HEADERS)
	$(CC) $(CFLAGS) $< -o $@

$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET)

main.o: main.cpp $(HEADERS)
	$(CC) $(CFLAGS) $< -o $@

Employee.o: Employee.cpp Employee.h
	$(CC) $(CFLAGS) $< -o $@

Officer.o: Officer.cpp Officer.h
	$(CC) $(CFLAGS) $< -o $@

Supervisor.o: Supervisor.cpp Supervisor.h
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS) *~ $(TARGET)
