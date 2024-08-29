# tested with: g++-11
CC 		= gcc
CFLAGS  = -mavx2 -O5
SRC 	= src
TARGET 	= life.bin

life.bin:
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)/main.c

all: life.bin

clean:
	$(RM) $(TARGET)