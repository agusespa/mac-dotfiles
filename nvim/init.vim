syntax on
set termguicolors
set textwidth=0
set ruler
set number
set relativenumber
set cc=80
set formatoptions+=o
set nohlsearch
set showcmd
set showmode
set noswapfile
set nobackup
set encoding=utf-8
set mouse=a

set ignorecase
set smartcase

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set exrc
set hidden
set noerrorbells
set incsearch
set scrolloff=12

" Indents word-wrapped lines as much as the 'parent' line
set breakindent
" Ensures word-wrap does not split words
set formatoptions=l
set lbr

set signcolumn=yes



" Plug-ins installation

call plug#begin('~/.config/nvim/plugged')

	" Appearance
	Plug 'doums/darcula'
	Plug 'vim-airline/vim-airline'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'sheerun/vim-polyglot'
	Plug 'uiiaoo/java-syntax.vim'
	Plug 'norcalli/nvim-colorizer.lua'

	" Utilities
    	Plug 'preservim/nerdtree'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'pangloss/vim-javascript'
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'preservim/nerdcommenter'
	Plug 'SirVer/ultisnips'
	Plug 'mlaursen/vim-react-snippets'

call plug#end()



" Appearence

set background=dark
colorscheme darcula
let g:NERDTreeWinSize=30

lua require'colorizer'.setup()

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''



" Mappings
"
" esc in insert & visual mode
inoremap kj <esc>
"vnoremap kj <esc>

let g:mapleader = "'"
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>n :NERDTreeFocus<CR>
let g:NERDCreateDefaultMappings = 1


" Buffers & Windows
" delete buffer without closing window
nnoremap <silent> <leader>q :lclose<bar>b#<bar>bd #<CR>


" NERDTree settings

let NERDTreeShowHidden=1
"autocmd VimEnter * NERDTree
let g:NERDTreeIgnore = ['^target$', '^.settings$', '^.idea$', '^node_modules$', '^build$', '^.git$', '^.DS_Store$', '\.class$']

" sync open file with NERDTree
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
