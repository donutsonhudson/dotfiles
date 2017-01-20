call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/unite.vim'
call plug#end()

set tabstop=4
set ruler
set number


" -- solarized personal conf
 set background=dark
 try
     colorscheme solarized
     catch
     endtry

" -- Show 80th column
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

" -- Unite stuff
