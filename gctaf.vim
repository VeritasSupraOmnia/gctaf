"Include this file or put these nmaps in your .vimrc for vim integration and 
"remember to change they keys if you already use <F6> vel <F7>.

	"assembles a single C function on 03 and cleans off redundant text
	:nmap <F6> mngg"fyG'n0t(byiw:vnew<CR>"fPggVG:!gcc -O3 -xc - -S -masm=intel -o /dev/stdout \| gctaf <C-R>"<CR>
	"assembles a whole C file on 03
	:nmap <F7> gg"fyG:vnew<CR>"fPggVG:!gcc -O3 -xc - -S -masm=intel -o /dev/stdout<CR>

	"assembles a single C++ function
	:nmap <C-F6> mngg"fyG'n0t(byiw:vnew<CR>"fPggVG:!g++ -O3 -xc - -S -masm=intel -o /dev/stdout \| gctaf <C-R>"<CR>
	"assembles a whole C++ file
	:nmap <C-F7> gg"fyG:vnew<CR>"fPggVG:!g++ -O3 -xc - -S -masm=intel -o /dev/stdout<CR>

	"Assembles a single function that's independent of global state
	:vmap <F6> y:vnew<CR>pggVG:'<,'>!gcc -xc - -S -masm=intel -O3 -o /dev/stdout<CR>gg/:\n<CR>kdggG?.LFE<CR>dGgg/.LFB<CR>dd
	"This is useful if you want to quickly see what a small function does in a
	"very large C file and you don't want the compiler to take a literal second
	"just to do so.

"This is slow and bad and I want to improve it but don't know vim script.
"If you know vim script and have a better way to do this, I will include it and 
"credit you in both the source and readme

"TODO: Look into directing the cmd output directly into a buffer to copy the file one less time for greater speed.
