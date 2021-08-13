gctaf:	gctaf.c
	gcc -O3 gctaf.c -o gctaf
test:	gctaf
	gcc -xc -O3 hello.c -S -masm=intel -o /dev/stdout | ./gctaf add
	gcc -xc -O3 hello.c -S -masm=intel -o /dev/stdout | ./gctaf sub
	gcc -xc -O3 hello.c -S -masm=intel -o /dev/stdout | ./gctaf testextern
install:	gctaf
	cp ./gctaf /bin/
uninstall:
	rm /bin/gctaf
assembly:
	gcc -O3 ./gctaf.c -S -masm/intel -o gctaf.s
debug:	assembly
	gcc gctaf.c -Og -g -o gctaf-debug
	dbg gctaf-debug
vim-append:
	printf "\n\t\"These mappings assemble C functions and files using GCC.\n" >> ~/.vimrc
	printf "\t\"F6 does functions. Put it on the function name line to assemble it.\n" >> ~/.vimrc
	printf "\t\"F7 does the whole file.\n" >> ~/.vimrc
	printf "\t\"C-F6 and C-F7 assemble c++ source instead of C source.\n" >> ~/.vimrc
	cat gctaf.vim | grep :nmap >> ~/.vimrc
	printf "\n\t\"This visual mode mapping allows you to assemble a function that uses no non-function-local data without\n" >> ~/.vimrc
	printf "\t\"assembling the whole file, which might speed things up greatly if the function is in a large file.\n" >> ~/.vimrc
	printf "\t\"Select the whole function, initialization to end bracket, in visual mode then press F6.\n" >> ~/.vimrc
	printf "\t\"This will move this to a new buffer to compile it.\n" >> ~/.vimrc
	cat gctaf.vim | grep :vmap >> ~/.vimrc
vim-include:
	cp gctaf.vim ~/.vim/
	printf "\n\t\"Get C to Assembly Function git@github.com:VeritasSupraOmnia/gctaf.git\n" >> ~/.vimrc
	printf "\t:source ~/.vim/gctaf.vim" >> ~/.vimrc
