" don't usearrowkeys
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
    Plug 'neovim/nvim-lspconfig'
    Plug 'RishabhRD/popfix'
    Plug 'RishabhRD/nvim-lsputils'
call plug#end()

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

lua <<EOF

    if vim.fn.has('nvim-0.5.1') == 1 then
        vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
        vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
        vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
        vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
        vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
        vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
        vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
        vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
    else
        local bufnr = vim.api.nvim_buf_get_number(0)

        vim.lsp.handlers['textDocument/codeAction'] = function(_, _, actions)
            require('lsputil.codeAction').code_action_handler(nil, actions, nil, nil, nil)
        end

        vim.lsp.handlers['textDocument/references'] = function(_, _, result)
            require('lsputil.locations').references_handler(nil, result, { bufnr = bufnr }, nil)
        end

        vim.lsp.handlers['textDocument/definition'] = function(_, method, result)
            require('lsputil.locations').definition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
        end

        vim.lsp.handlers['textDocument/declaration'] = function(_, method, result)
            require('lsputil.locations').declaration_handler(nil, result, { bufnr = bufnr, method = method }, nil)
        end

        vim.lsp.handlers['textDocument/typeDefinition'] = function(_, method, result)
            require('lsputil.locations').typeDefinition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
        end

        vim.lsp.handlers['textDocument/implementation'] = function(_, method, result)
            require('lsputil.locations').implementation_handler(nil, result, { bufnr = bufnr, method = method }, nil)
        end

        vim.lsp.handlers['textDocument/documentSymbol'] = function(_, _, result, _, bufn)
            require('lsputil.symbols').document_handler(nil, result, { bufnr = bufn }, nil)
        end

        vim.lsp.handlers['textDocument/symbol'] = function(_, _, result, _, bufn)
            require('lsputil.symbols').workspace_handler(nil, result, { bufnr = bufn }, nil)
        end
    end


    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        -- Enable completion triggered by <c-x><c-o>
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        local opts = { noremap=true, silent=true }

        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        buf_set_keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
        buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    end

    local nvim_lsp = require('lspconfig')
    nvim_lsp['tsserver'].setup {
        on_attach = on_attach,
        flags = { 
            debounce_text_changes = 150
        }
    }

EOF

