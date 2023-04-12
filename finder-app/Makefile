CC=$(CROSS_COMPILE)gcc
CFLAGS=-g -Wall

default: writer

writer.o: writer.c
	$(CC) $(CFLAGS) -c writer.c -o writer.o

writer: writer.o
	$(CC) $(CFLAGS) writer.o -o writer

clean:
	rm -f writer.o
	rm -f writer

