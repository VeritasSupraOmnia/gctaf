#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
//get compiled to assembly function
#define U8 unsigned long long
#define U4 unsigned int

//converts a string pointer to a U8 pointer
#define pSU4(pointer) (U4*)(pointer)
#define pSU8(pointer) (U8*)(pointer)
#define sU4(pointer) *(U8*)(pointer)
#define sU8(pointer) *(U8*)(pointer)
//set Match Location

//TODO: Print a warning to stdin on erroneous usage

int main(int argc, char **argv){
	//to replace my very basic vim bind with an actual program that doesn't
	//break on extra functional dependencies. Vim will compile the whole program
	//using gcc in pure pipe mode and pipe said disassembled code into this
	//program's stdin with the function name provided, by vim, in the programs
	//argument list.

	//VAR
	char *func_name;	//in from argc
	int fnsz;			//func name size
	int flsz=0,tsz;		//file size

	char *data;			//asm data from gcc
	char *func_loc;		//func name location
	char *body_loc;
	int body_size;
	int i;
	char *fncap=":\n.LFB";//func name cap
	int fncsz;			//func name cap size

	//CODE
	//get function name into useful format
	if (argc<2){
		return 1;
	}
	/*
	 * FILE READING
	 */

	//setup func name checking buffer
	fnsz=strlen(argv[1]);
	fncsz=strlen(fncap);
	func_name=malloc(fnsz+fncsz+1);
	bcopy(argv[1],func_name,fnsz);
	bcopy(fncap,func_name+fnsz,fncsz);
	func_name[fnsz+fncsz]=0;
	
//	printf("%s\n",func_name);


	//Read in from stdin the file
	data=malloc(4096);
	do	tsz=read(0,data,4096),
		tsz	?flsz+=tsz,
		data=realloc(data,flsz):0;
	while(tsz>0);
	
	/*
	 * FUNCTION cleanup
	 */

	//print function label and jump past newline
	write(1,func_name,fnsz+1);
	write(1,"\n",1);
	func_loc=strstr(data,func_name)+fnsz+fncsz+2;

	//TODO:Change to print line by line for clarity's sake

	//find function body
	body_loc=strchr(strstr(func_loc,"\t.cfi_startproc")+1,'\n')+1;
	char *body_end=strstr(func_loc,"\t.cfi_endproc");
	for(char *i=body_loc;i<body_end;i++){
		if (strncmp(i,"\t.cfi",5))
			write(1,i,1+strchr(i,'\n')-i);
		i=strchr(i,'\n');
	}

	//get name mask from name size
	return 0;
}
	//can fit within one 64 bit reg including semi-colon, or it can't
