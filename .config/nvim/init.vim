" Neovim has sensible defaults: https://github.com/neovim/neovim/issues/2676
" Vim differences: https://neovim.io/doc/user/vim_diff.html#vim-differences

"" Plug

" Download Plug if it doesn't exist
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

"" Plugins

call plug#begin('~/.config/nvim/plugged/')

" Misc plugins
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ivalkeen/nerdtree-execute', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
"Plug 'scrooloose/syntastic'
"Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sjl/gundo.vim'
Plug 'Lenovsky/nuake'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin' " requires NERDTreee

" Languages
Plug 'StanAngeloff/php.vim'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'styled-components/vim-styled-components', { 'branch': 'main' } " styled-components, emotion
Plug 'elzr/vim-json', { 'for': ['json', 'jsonp'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'posva/vim-vue'
Plug 'jwalton512/vim-blade'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Colorschemes
Plug 'joshdick/onedark.vim'
" Plug 'tomasr/molokai'
" Plug 'gosukiwi/vim-atom-dark'
" Plug 'mhartington/oceanic-next'

call plug#end()



"" Stuff

set ffs=unix
let mapleader=","
set undolevels=1000
set encoding=utf8
set hidden " It's OK to have an unwritten buffer that's not visible

" Enable mouse support
set mouse=a

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Enable modelines
set modelines=1



"" Misc mappings

" Quick exit to normal mode
inoremap jj <ESC>
inoremap jk <ESC>

" Quick save and quick exit
nmap <CR> :update<CR>
nnoremap <leader>s :update<CR>
nnoremap <leader>q :q<CR>

" highlight last inserted text
nnoremap gV `[v`]

" Move lines up and down (normal and visual mode)
" Is this any better? https://github.com/matze/vim-move
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Write as sudo
cnoremap w!! w !sudo tee > /dev/null %



"" Splits and tabs

" Open split panes to right and bottom
set splitbelow
set splitright

" Increase tab limit for the -p command option
set tabpagemax=50

" New tab abbreviation
ca tn tabnew



"" Indenting

" Tabs for indenting

" Dont expand tabs to spaces, and set tab size
"set noexpandtab
"set tabstop=8

" Spaces for indenting

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4



"" Colors

set t_Co=256

colorscheme onedark
set termguicolors

" Color for line numbers
" highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Color for fold column
" highlight foldcolumn term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Color for vertical splits ("border")
" highlight VertSplit ctermfg=bg ctermbg=bg

" Color for cursor column
" highlight CursorColumn term=reverse cterm=NONE ctermbg=236 ctermfg=none gui=NONE guibg=#293739 guifg=fg

" Color for cursor line
" highlight CursorLine term=NONE cterm=NONE ctermbg=235 ctermfg=NONE gui=NONE guibg=#293739 guifg=fg

" Color for syntax errors
" highlight Error term=NONE cterm=NONE ctermbg=88 ctermfg=231 gui=NONE guibg=#870000 guifg=#ffffff



"" UI

" Lines to the cursor when scrolling with j/k
set scrolloff=5

" Highlight current line.
set cursorline

" Highlight current column
set cursorcolumn

" Color the 101st column. See language-specific overrides below.
set colorcolumn=101

" Show (relative) lines numbers
set number
set relativenumber
set numberwidth=6

" Absolute numbers in insert mode, relative numbers in normal mode
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Show non-text characters
set list lcs=tab:·\ ,trail:∑,nbsp:%,extends:>

" Disable cursor-shape. No Terminator support.
set guicursor=

" File name completion and tabbing

set wildmode=longest:full,full
set wildmenu



"" Sessions

" Don't store global and local values in sessions
set ssop-=options

" Don't store folds
set ssop-=folds



"" Navigation

" Easier split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Next/prev tab with ctrl+left/right
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Next buffer with Tab
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprev<CR>



"" Search

" Highlight search results
set hlsearch

" Search as you type
set incsearch

" Ignore case
set ignorecase

" Do not ignore case if we input a capital letter
set smartcase

" Show matching brackets on cursor hover
set showmatch

" Clear search highlighting
nnoremap <BS> :noh<CR>

" Center the search result vertically
nnoremap n nzz
nnoremap N Nzz



"" Folding

" Don't fold by default
set nofoldenable

" Fold based on indent
set foldmethod=indent

" Deepest fold is 10 levels
set foldnestmax=10
set foldlevel=1
set foldcolumn=2



"" Swap and backup

" backup
set nobackup

" swap
set swapfile
set directory=~/.local/share/nvim/swap " this is the default location

" undo directory
set undodir=~/.local/share/nvim/undo " this is the default directory



"" JavaScript

" Indent two spaces
autocmd FileType javascript,javascript.jsx setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2



" JSON

" Indent two spaces
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2



"" PHP

" Color the 101st column
autocmd FileType php set colorcolumn=101

" Indent four spaces
autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4



"" Python

autocmd FileType python set
    \ expandtab
    \ shiftwidth=4
    \ tabstop=4
    \ softtabstop=4
    \ autoindent
    \ fileformat=unix
    \ colorcolumn=80



"" Git commits

" Force the cursor onto a new line after 72 characters
autocmd FileType gitcommit set textwidth=72

" Color the 73rd column
autocmd FileType gitcommit set colorcolumn=73



"" Markdown

" Force the cursor onto a new line after 80 characters
autocmd FileType markdown set textwidth=80

" Color the 81rd column
autocmd FileType markdown set colorcolumn=81



"" NERDTree

" Toggle
map <F2> :NERDTreeToggle<CR>

" Open NERDTree if vim starts without any files specified
" autocmd vimenter * if !argc() | NERDTree | endif

" Close vim if NERDTree is the only window left open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Show hidden files in NERDTree
let NERDTreeShowHidden=1

" File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('js', 'yellow', 'none', '#f7df1e', '#151515')
call NERDTreeHighlightFile('jsx', 'yellow', 'none', '#f7df1e', '#151515')
call NERDTreeHighlightFile('php', 'blue', 'none', '#8892be', '#151515')
call NERDTreeHighlightFile('py', 'blue', 'none', '#4b8bbe', '#151515')
call NERDTreeHighlightFile('json', 'lightyellow', 'none', 'lightyellow', '#151515')
call NERDTreeHighlightFile('md', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('yml', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('conf', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('config', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'lightblue', 'none', 'lightblue', '#151515')
call NERDTreeHighlightFile('scss', 'lightblue', 'none', 'lightblue', '#151515')
call NERDTreeHighlightFile('html', 'lightred', 'none', '#f06529', '#151515')



"" NERDCommenter

let NERDSpaceDelims = 1



"" CtrlP

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_custom_ignore = '\vnode_modules/|vendor/'

nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

if executable('ag')
  " Use Ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " NB: ctrlp_custom_ignore is not used, but Ag respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif



"" vim-startify

let g:startify_session_dir = '~/vimsessions'
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_custom_header = [
            \ '     ________  ___       __   _______   ________  ________  _____ ______   _______        ',
            \ '    |\   __  \|\  \     |\  \|\  ___ \ |\   ____\|\   __  \|\   _ \  _   \|\  ___ \       ',
            \ '    \ \  \|\  \ \  \    \ \  \ \   __/|\ \  \___|\ \  \|\  \ \  \\\__\ \  \ \   __/|      ',
            \ '     \ \   __  \ \  \  __\ \  \ \  \_|/_\ \_____  \ \  \\\  \ \  \\|__| \  \ \  \_|/__    ',
            \ '      \ \  \ \  \ \  \|\__\_\  \ \  \_|\ \|____|\  \ \  \\\  \ \  \    \ \  \ \  \_|\ \   ',
            \ '       \ \__\ \__\ \____________\ \_______\____\_\  \ \_______\ \__\    \ \__\ \_______\  ',
            \ '        \|__|\|__|\|____________|\|_______|\_________\|_______|\|__|     \|__|\|_______|  ',
            \ '                                          \|_________|                                    ',
            \ ]



"" ALE

" Specify linters (don't run all). Will look in the ale_linters directory.
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'php': ['php', 'phpcs'],
\}

let g:ale_php_phpcs_standard = 'PSR2'

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '∆'
let g:ale_sign_style_error = '✠'
let g:ale_sign_style_warning = '≈'

" Don't lint while typing
let g:ale_lint_on_text_changed = 'normal' " always|normal|never|insert
let g:ale_lint_delay = 300
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1

" Format echo messages
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'



"" Syntastic

" let g:syntastic_loc_list_height = 5
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '∆'
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_style_warning_symbol = '≈'

let g:syntastic_cursor_column = 0

" PHP
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args="--standard=psr2"

" JavaScript
let g:syntastic_javascript_checkers = ['eslint']



"" vim-airline

" Use powerline fonts to show powerline symbols. Needs a patched font
let g:airline_powerline_fonts = 1

" Set airline theme. Default behavior is to match the colorscheme.
let g:airline_theme='molokai'



"" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"



"" AutoPairs

" Flymode: if(a[3) results in: if(a[3])
let g:AutoPairsFlyMode = 1

" https://github.com/jiangmiao/auto-pairs/issues/88
let g:AutoPairsShortcutFastWrap=''



"" Gundo
let g:gundo_width = 60
let g:gundo_preview_height = 20



"" vim-jsx

" Enable JSX syntax highlighting for .js files
let g:jsx_ext_required = 0



"" vim-multiple-cursors

" Prevent deoplete functions until multiple cursor editing is finished
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction



"" deoplete

" Enable deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 50

" Cycle completions with tab when the popup menu is visible
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"



"" vim-markdown

" disable concealing
let g:vim_markdown_conceal = 0



"" Nuake

nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>



" nerdtree-git-plugin

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "~",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }



" Unsorted/tmp
