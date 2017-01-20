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
let g:unite_source_history_yank_enable = 1
try
		  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
		    call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <space><space> :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
" reset not it is <C-l> normally
nnoremap <space>r <Plug>(unite_restart)
