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
     Plug 'kassio/neoterm'
     Plug 'junegunn/fzf',  { 'do': { -> fzf#install() } }
     Plug 'junegunn/fzf.vim'
     Plug 'editorconfig/editorconfig-vim'
call plug#end()

" Configure for coc.nvim - Path must be absolute
source ~/.config/nvim/cocconfig.vim
" Remove this for now because it's messing up with react
" command! -nargs=0 Prettier :CocCommand prettier.formatFile " Setup prettier for CoC

" Make fzf respect gitignore
let g:fzf_default_command = 'rg --files'

" Add Ctrl - P to search files like vscode
nnoremap <C-p> :Files<Cr>

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

" Set formatting to 4 spaces
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line

set autoread " This will update the file when there's an external change
