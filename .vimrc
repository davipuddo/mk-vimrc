"Davi Ferreira Puddo

"Enable syntax
syntax on

"Define colors
hi Statement ctermfg=4
hi LineNr ctermfg=4 
hi CursorLineNr ctermfg=4
hi PreProc ctermfg=6
hi Constant ctermfg=3
hi Type ctermfg=9
hi Search ctermfg=15 ctermbg=4

"Define cursor
if &term =~ '^xterm'

	"Normal mode
	let &t_EI .= "\<Esc>[0 q"

	"Insert mode
	let &t_SI .= "\<Esc>[6 q"

endif

"Set search highlight
nnoremap <C-h> :set hls!<CR>

"Define UI
set number
set relativenumber
set mouse=a
set wrap

"Define tab
set tabstop=4
set shiftwidth=4

"Define indentation
set autoindent
set smartindent

"Map <esc> key
inoremap jk <esc>
vnoremap jk <esc> 

"Define status line
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

"Shift
inoremap <M-Up> <esc>ddkkpi
inoremap <M-Down> <esc>ddpi
nnoremap <M-Up> ddkkp
nnoremap <M-Down> ddp

"Find-Replace
nnoremap <S-s> *Ncgn

"Toggle copy
nnoremap <C-c> :call Tcopy()<CR>
fu! Tcopy()

	"Read mouse value
	if (&mouse == 'a')
		set mouse=
	else
		set mouse=a
	endif

	"Invert 
	set relativenumber!
	set number!

endfu

"Toggle Hex Editor
nnoremap <S-x> :call Thex()<CR>
let t:h = 0
fu! Thex()
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

