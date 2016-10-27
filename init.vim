" Neovim config
"
" Neovim has sensible defaults: https://github.com/neovim/neovim/issues/2676
" Vim differences: https://neovim.io/doc/user/vim_diff.html#vim-differences

"" Plug
call plug#begin('~/.config/nvim/plugged/')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gosukiwi/vim-atom-dark'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()



"" Stuff

let mapleader=","



"" Colors

set t_Co=256

colorscheme atom-dark-256

" Color for line numbers
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Color for fold column
highlight foldcolumn term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Color for vertical splits ("border")
highlight VertSplit ctermfg=bg ctermbg=bg

" Color for cursor column
highlight CursorColumn term=reverse cterm=NONE ctermbg=236 ctermfg=none gui=NONE guibg=#293739 guifg=fg

" Color for cursor line
highlight CursorLine term=NONE cterm=NONE ctermbg=235 ctermfg=NONE gui=NONE guibg=#293739 guifg=fg



"" UI

" Lines to the cursor when scrolling with j/k
set scrolloff=5

" Highlight current line.
set cursorline

" Highlight current column
set cursorcolumn

" Show (relative) lines numbers
set number
set relativenumber
set numberwidth=6

"Absolute numbers in insert mode, relative numbers in normal mode
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber



"" Navigation

" Easier split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l



"" Search

" Search as you type
set incsearch

" Ignore case
set ignorecase

" Do not ignore case if we input a capital letter
set smartcase

" Show matching brackets on cursor hover
set showmatch



"" NERDTree

" Toggle
map <F2> :NERDTreeToggle<CR>

" Open NERDTree if vim starts without any files specified
autocmd vimenter * if !argc() | NERDTree | endif

"Show hidden files in NERDTree
let NERDTreeShowHidden=1



"" CtrlP

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_custom_ignore = '\vnode_modules/|vendor/'

nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>



"" vim-airline

" Use powerline fonts to show powerline symbols. Needs a patched font
let g:airline_powerline_fonts = 1

" Set airline theme. Default behavior is to match the colorscheme.
let g:airline_theme='molokai'
