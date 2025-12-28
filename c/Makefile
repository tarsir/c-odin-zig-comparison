CC = gcc
CFLAGS = -I../raylib-5.5_linux_amd64/include -L../raylib-5.5_linux_amd64/lib -lraylib -O2

main: main.c 
	$(CC) -o main main.c $(CFLAGS)

build_o0:
	$(CC) -o main_o0 main.c $(CFLAGS) -O0

build_o3:
	$(CC) -o main_o3 main.c $(CFLAGS) -O3

build_o_size:
	$(CC) -o main_size main.c $(CFLAGS) -Os

build_o_fast:
	$(CC) -o main_fast main.c $(CFLAGS) -Ofast

build_o_debug:
	$(CC) -o main_debug main.c $(CFLAGS) -Og

clean: 
	rm -f main
