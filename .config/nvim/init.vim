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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'jwalton512/vim-blade'

" Colorschemes
" Plug 'tomasr/molokai'
Plug 'gosukiwi/vim-atom-dark'

call plug#end()



"" Stuff

let mapleader=","



"" Misc mappings

" Quick exit to normal mode
inoremap jj <ESC>
inoremap jk <ESC>

" Quick save and quick exit
nmap <CR> :update<CR>
nnoremap <leader>s :update<CR>
nnoremap <leader>q :q<CR>



"" Splits and tabs

" Open split panes to right and bottom
set splitbelow
set splitright

" Increase tab limit for the -p command option
set tabpagemax=50



"" Indenting"

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4



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

" Next/prev tab with ctrl+left/right
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>



"" Search

" Search as you type
set incsearch

" Ignore case
set ignorecase

" Do not ignore case if we input a capital letter
set smartcase

" Show matching brackets on cursor hover
set showmatch

" Clear search highlighting
nnoremap <leader><space> :nohlsearch<CR>



"" NERDTree

" Toggle
map <F2> :NERDTreeToggle<CR>

" Open NERDTree if vim starts without any files specified
"autocmd vimenter * if !argc() | NERDTree | endif

"Show hidden files in NERDTree
let NERDTreeShowHidden=1



"" CtrlP

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_custom_ignore = '\vnode_modules/|vendor/'

nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>



"" Syntastic"

" PHP
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args="--standard=psr2"

" let g:syntastic_loc_list_height = 5
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '∆'
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_style_warning_symbol = '≈'

let g:syntastic_cursor_column = 0



"" vim-airline

" Use powerline fonts to show powerline symbols. Needs a patched font
let g:airline_powerline_fonts = 1

" Set airline theme. Default behavior is to match the colorscheme.
let g:airline_theme='molokai'



"" deocomplete

" Enable deocomplete
let g:deoplete#enable_at_startup = 1

" Cycle completions with tab when the popup menu is visible
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
