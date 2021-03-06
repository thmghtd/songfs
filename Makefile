all: topartists songfs

songfs: main.c
	gcc -g -O0 -c `pkg-config --cflags fuse` -o songfs.o $?
	g++ -g -O0 `pkg-config --libs fuse` `curl-config --libs` -lexpat topartists.o songfs.o -o songfs

topartists: topartists.cpp
	gcc -g -O0 -c -o topartists.o `curl-config --cflags` $?
