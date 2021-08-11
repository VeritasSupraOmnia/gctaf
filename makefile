test: gctaf.c
	@gcc -xc hello.c -S -masm=intel -o /dev/stdout | ./gctaf.c add
