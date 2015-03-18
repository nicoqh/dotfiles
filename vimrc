"" Vundle



set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required!
Bundle 'gmarik/Vundle.vim'

" My Bundles here:
"
" original repos on github
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tomasr/molokai'
Bundle 'groenewege/vim-less'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-surround'
Bundle 'bling/vim-airline'
" Problematic when used together with SnipMate?
" Bundle 'ervandew/supertab'
Bundle 'xsbeats/vim-blade'
" Required by snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
" Required by snipmate
Bundle "tomtom/tlib_vim"
" SnipMate
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

Bundle "vim-scripts/loremipsum"

"Bundle "spf13/vim-autoclose"
" ...
call vundle#end()            " required
filetype plugin indent on     " required!
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
""" END VUNDLE



"" Stuff

set ffs=unix
let mapleader=","
if has("syntax")
  "syntax on
endif
" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" Set utf8 as standard encoding
set encoding=utf8
" Undo levels
set undolevels=1000
" Enable mouse support
set mouse=a



"" Syntax highlighting

" Enable syntax
syntax enable



"" Colors
colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1
"colorscheme xoria256
set t_Co=256



"" Swap and backup

set nobackup
set swapfile

" Don't pollute my project with swap files
set directory=~/.vimswap



"" Sessions

" Don't store global and local values in sessions
set ssop-=options

" Don't store folds
set ssop-=folds



"" Navigation

" Highlight current line.
set cursorline

" Highlight current column
set cursorcolumn

" Lines to the cursor when scrolling with j/k
set scrolloff=5

" Underscores denote words
set iskeyword-=_

" Easier window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Next/prev tab with ctrl+left/right
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" New tab abbreviation
ca tn tabnew

" Quick exit to normal mode
inoremap jj <ESC>
inoremap jk <ESC>

" Quick save and quick exit
nnoremap <leader>s :update<CR>
nnoremap <leader>q :q<CR>


"" Splits
" Open split panes to right and bottom
set splitbelow
set splitright



"" Search
" Highlight search results
set hlsearch
highlight Search cterm=underline
" Search as you type
set incsearch
" Ignore case
set ignorecase
" Do not ignore case if we input a capital letter
set smartcase
" Show matching brackets on cursor hover
set showmatch
" Clear search highlighting
nnoremap <leader>/ :nohlsearch<CR>
nnoremap <leader>7 :nohlsearch<CR>



"" Line numbers

" Show (relative) lines numbers
set number
set relativenumber
set numberwidth=6
" Toggle absolute and relative line numbers
function! NumberToggle()
	if(&relativenumber == 1)
		set number
		set norelativenumber
	else
		set number
		set relativenumber
	endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>
"Toggle line numbers with CTRL+n x 2
":nmap <C-N><C-N> :set invnumber<CR>
"Absolute numbers in insert mode, relative numbers in normal mode
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
" Color for line numbers
" :highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE



"" File name completion and tabbing

set wildmode=longest:full
set wildmenu



"" Tabs

" Dont expand tabs to spaces, and set tab size
set noexpandtab
set tabstop=8



"" UI

" Always show the status line
set laststatus=2
" Show non-text characters
set list lcs=tab:·\ ,trail:·,nbsp:%



"" Folding

" Don't fold by default
set nofoldenable
" Fold based on indent
set foldmethod=indent

" Deepest fold is 10 levels
set foldnestmax=10
set foldlevel=1
set foldcolumn=2



"" CtrlP

nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>



"" NERDTree

" Toggle
map <F2> :NERDTreeToggle<CR>
" Open NERDTree if vim starts without any files specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if NERDTree is the only window left open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"Show hidden files in NERDTree
let NERDTreeShowHidden=1



"" NERDCommenter

let NERDSpaceDelims = 1
" Blade comments
let g:NERDCustomDelimiters = {
	\ 'blade': { 'left': '{{--', 'right': '--}}','leftAlt': '<!--', 'rightAlt': '-->' }
\ }



"" SnipMate

let g:snipMate = {}
let g:snipMate.no_default_aliases=1



"" Laravel

"Ignore these when calling CtrlP
"set wildignore+=*/vendor/**



" Indentation

" Autoindent
set autoindent



"" Paste

" Toggle paste mode
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
"set showmode



"" vim-airline

" Use powerline fonts to show powerline symbols
" Needs a patched font
let g:airline_powerline_fonts = 1


"" Misc
" Create/edit file in the current directory
nmap :ed :edit %:p:h/

" Auto-remove trailing slashes
"autocmd BufWritePre *.php :%s/\s\+$//e

