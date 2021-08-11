#!/bin/tcc -run
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
//get compiled to assembly function
char *func_name;
int fnsz;//func name size
int flsz=0,tsz;//file size

int main(int argc, char **argv){
	//to replace my very basic vim bind with an actual program that doesn't
	//break on extra functional dependencies. Vim will compile the whole program
	//using gcc in pure pipe mode and pipe said disassembled code into this
	//program's stdin with the function name provided, by vim, in the programs
	//argument list.

	//get function name into useful format
	if (argc<2) return 1;
	func_name=argv[1];
	fnsz=strlen(func_name);//matters later on

	//Read in from stdin the file
	char *data=malloc(4096);
	do{
		tsz=read(0,data,4096),
		tsz	
			?flsz+=tsz,
			data=realloc(data,flsz):0;
	}while(tsz>0);

	if (fnsz>8){
		printf
	}else
	return 0;
}
