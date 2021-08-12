#include <stdio.h>

/*int main(int argc,char **argv){
	if(argc<2) return 0;
	printf("Hello, %s\n",argv[1]);
	return 0;
}*/
static int secondary=5;

int sub(int a, int b){
	return a-b;
}
 
int add(int a, int b){
	int temp=secondary;
	secondary+=a;
	return a+b+temp;
}

int mul(int a, int b){
	return a*b;
}
