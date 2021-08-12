gctaf: gctaf.c
	gcc -O3 gctaf.c -o gctaf
test: gctaf
	gcc -xc -O3 hello.c -S -masm=intel -o /dev/stdout | ./gctaf add
install: gctaf
	cp ./gctaf /bin/
uninstall:
	rm /bin/gctaf
debug: 
	gcc gctaf.c -Og -g -o gctaf-debug
	dbg gctaf-debug
