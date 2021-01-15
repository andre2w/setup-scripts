" don't use arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" really, just don't
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

call plug#begin('~/.nvim/plugged')
     Plug 'neoclide/coc.nvim', {'branch': 'release'}
     Plug 'vim-airline/vim-airline'
     Plug 'vim-airline/vim-airline-themes'
     Plug 'lifepillar/vim-gruvbox8'
     Plug 'morhetz/gruvbox'
     Plug 'preservim/nerdtree'
     Plug 'preservim/nerdcommenter'
     Plug 'tpope/vim-surround'
call plug#end()

" Configure for coc.nvim - Path must be absolute
source ~/.config/nvim/cocconfig.vim

" NERDCommeter configurations
filetype plugin on
let g:NERDCreateDefaultMappings = 1

" Vim themes
colorscheme gruvbox8
let g:airline_theme='gruvbox'

" This change will make the code you copy in vim 
" available in the clipboard
set clipboard+=unnamedplus

" UI Personal Prefrences
set number
