OBJECTS= main.o draw.o display.o matrix.o parser.o gmath.o stack.o
CFLAGS= -Wall
LDFLAGS= -lm
CC= gcc

NUMBERS = 0 1 2 3 4 5 6 7

run: all
	rm *.o
	$(foreach var,$(NUMBERS),./main scripts/0$(var).script;)
	rm pics/*.ppm
	convert -delay 20 -loop 0 pics/*.png pics.gif

all: $(OBJECTS)
	$(CC) -o main $(OBJECTS) $(LDFLAGS)

main.o: main.c display.h draw.h ml6.h matrix.h parser.h stack.h
	$(CC) -g -c main.c

draw.o: draw.c draw.h display.h ml6.h matrix.h gmath.h
	$(CC) $(CFLAGS) -c draw.c

dsiplay.o: display.c display.h ml6.h matrix.h
	$(CC) $(CFLAGS) -c display.c

matrix.o: matrix.c matrix.h
	$(CC) $(CFLAGS) -c matrix.c

parser.o: parser.c parser.h matrix.h draw.h display.h ml6.h stack.h
	$(CC) $(CFLAGS) -c parser.c

gmath.o: gmath.c gmath.h matrix.h
	$(CC) $(CFLAGS) -c gmath.c

stack.o: stack.c stack.h matrix.h
	$(CC) $(CFLAGS) -c stack.c

clean:
	rm *.o *~
