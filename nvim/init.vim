syntax on
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
	"Plug 'morhetz/gruvbox'
	Plug 'arcticicestudio/nord-vim'
	Plug 'vim-airline/vim-airline'
	"Plug 'ryanoasis/vim-devicons'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	"Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'sheerun/vim-polyglot'
	Plug 'uiiaoo/java-syntax.vim'

	" Utilities
    	Plug 'preservim/nerdtree'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'pangloss/vim-javascript'
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'preservim/nerdcommenter'
	"Plug 'airblade/vim-gitgutter'
	Plug 'SirVer/ultisnips'
	Plug 'mlaursen/vim-react-snippets'

call plug#end()



" Coc extensions installation
let g:coc_global_extensions = [
            \ 'coc-json',
            \ 'coc-tsserver',
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-snippets',
            \ 'coc-prettier',
            \ 'coc-eslint',
            \ 'coc-cssmodules',
            \ 'coc-xml',
            \ 'coc-java',
            \ ]



" Appearence

set background=dark
"let g:gruvbox_contrast_dark = 'hard'
"colorscheme gruvbox
colorscheme nord
let g:NERDTreeWinSize=30

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''



" Mappings

let g:mapleader = ';'
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>n :NERDTreeFocus<CR>
let g:NERDCreateDefaultMappings = 1

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Buffers & Windows
" delete buffer without closing window
nnoremap <silent> <leader>q :lclose<bar>b#<bar>bd #<CR>



" NERDTree settings

let NERDTreeShowHidden=1
"autocmd VimEnter * NERDTree
let g:NERDTreeIgnore = ['^target$', '^.settings$', '^node_modules$', '^build$', '^.git$', '^.DS_Store$']

" sync open file with NERDTree
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
