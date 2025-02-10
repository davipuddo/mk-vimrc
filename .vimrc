"Davi Ferreira Puddo

syntax on

"set colors
hi Statement ctermfg=4
hi LineNr ctermfg=4 
hi CursorLineNr ctermfg=4
hi PreProc ctermfg=6
hi Constant ctermfg=3
hi Type ctermfg=9
hi Search ctermfg=15 ctermbg=4

set number
set relativenumber
set mouse=a
set wrap

"Tab
set tabstop=4
set shiftwidth=4

set autoindent
set smartindent

"Set search highlight
set hls

"Util
inoremap jk <esc>
vnoremap jk <esc> 

"Toggle copy
nnoremap <C-c> :call Tcopy()<CR>
let t:c = 0
fu Tcopy()
	if (t:c==#0)
		set mouse=
		set norelativenumber
		set nonumber
	else
		set mouse=a
		set number
		set relativenumber
	endif

	if (t:c==#0)
		let t:c = 1
	else
		let t:c = 0
	endif
endfu

"Toggle Hex Editor
nnoremap <S-x> :call Thex()<CR>
let t:h = 0
fu Thex()
	if (t:h==#0)
		exec "%!xxd"
	else
		exec "%!xxd -r"
	endif

	if (t:h==#0)
		let t:h = 1
	else
		let t:h = 0
	endif
endfu

"Shift
inoremap <M-Up> <esc>ddkkpi
inoremap <M-Down> <esc>ddpi
nnoremap <M-Up> ddkkp
nnoremap <M-Down> ddp

"Find-Replace
nnoremap <S-s> *Ncgn

"Java
autocmd FileType java iabbrev <buffer> boiler public class x<esc>o{<CR>public static void main(String[] args)<esc>o{<tab><CR><esc>o}<esc>o}<esc>kkkkkk<esc>wwx<BS>a
autocmd FileType java iabbrev <buffer> SYSO System.out.println ();<esc>F(a

"C
aug c_keymap
au!
autocmd FileType c,cpp iabbrev <buffer> MAINC #include<esc>ddpi<BS><esc>wwa <stdio.h><esc>pwwa <stdlib.h><esc>pwwa <stdbool.h><esc>pwwa <string.h><esc>pwwa <math.h><esc>pwwa <limits.h><esc>pwwa <time.h><esc>o<CR>int main(void)<esc>o{<esc>oreturn(0);<esc>o}<esc>k
autocmd FileType c,cpp iabbrev <buffer> println printf("\n");<esc>F\i
autocmd FileType c,cpp iabbrev <buffer> INC <esc>xa><esc>0i#include <<esc>o
aug end

"CSS
autocmd FileType css iabbrev <buffer> IMP !important

"Status line
set laststatus=2
set statusline=\ %f\ -\ %y\ %m
set statusline+=%=
set statusline+=%6l/%-4L\ \ %P\ \ 

"Save file
nnoremap <C-q> :w<CR>

"Open terminal
nnoremap <C-t> :vs a<CR>:terminal<CR><C-w><C-w>:q<CR>
nnoremap <S-t> :terminal<CR>

"Force close
nnoremap <C-x> :q!<CR>

"Set cursor
if &term =~ '^xterm'

	"Normal mode
	let &t_EI .= "\<Esc>[0 q"

	"Insert mode
	let &t_SI .= "\<Esc>[6 q"
endif
