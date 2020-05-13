"" Plug

" Download Plug if it doesn't exist
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" Plugins

call plug#begin('~/.config/nvim/plugged/')

" Misc plugins
Plug 'preservim/nerdtree' " { 'on': 'NERDTreeToggle' } Only if you don't start NERDTree on launch
Plug 'ivalkeen/nerdtree-execute', { 'on': 'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'mileszs/ack.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sjl/gundo.vim'
Plug 'Lenovsky/nuake'
Plug 'machakann/vim-sandwich'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin' " requires NERDTreee

" Syntax
Plug 'sheerun/vim-polyglot'

" Colorschemes
" Some nice colorschemes from awesome-vim-colorschemes:
" iceberg, nord, one, pinkymoon, sierra, two-firewatch
Plug 'rafi/awesome-vim-colorschemes'
Plug 'sainnhe/edge'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'chuling/vim-equinusocio-material'

Plug 'unblevable/quick-scope'
let g:qs_buftype_blacklist = ['terminal', 'nofile']

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

" Scroll 2 lines with space
nnoremap <Space> 2<C-e>

" Quick save and quick exit
nmap <CR> :update<CR>
nnoremap <leader>s :update<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qall<CR>

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

" Buffers
nnoremap <leader>bd :bdelete<cr> " Delete buffer
nnoremap <leader>bc :bdelete<cr> " Delete buffer
nnoremap <leader>bn :enew<cr> " New buffer (in current window)

" Tabs
nnoremap <leader>tn :tabnew<cr> " New tab
nnoremap <leader>td :tabclose<cr> " Delete (close) tab
nnoremap <leader>tc :tabclose<cr> " Delete (close) tab

" Easier split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Adjust split sizes
noremap <silent> <C-Left> :vertical resize -3<CR>
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Next buffer with Tab
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprev<CR>



"" Splits and tabs

" Open split panes to right and bottom
set splitbelow splitright

" Increase tab limit for the -p command option
set tabpagemax=50



"" Indenting

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4



"" Colors

set t_Co=256

set termguicolors
colorscheme edge
let g:edge_current_word = 'underline'

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
set directory=~/.local/share/nvim/swap

" undo directory
set undodir=~/.local/share/nvim/undo



"" JavaScript

" Color the 81st column
autocmd FileType javascript,javascript.jsx set colorcolumn=81

" Indent two spaces
autocmd FileType javascript,javascript.jsx setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2



"" HTML

" Indent two spaces
autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2



" JSON

" Indent two spaces
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2



"" PHP

" Color the 81st column
autocmd FileType php set colorcolumn=81

" Indent four spaces
autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4



"" CSS

" Indent two spaces
autocmd FileType css,scss setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2



"" Python

autocmd FileType python set
    \ expandtab
    \ shiftwidth=4
    \ tabstop=4
    \ softtabstop=4
    \ autoindent
    \ fileformat=unix
    \ colorcolumn=81

" Find and set the system Python for Neovim (don't use the virtual environment's bin)
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif



"" Git commit messages

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

" Custom icons for expandable/expanded directories
" let g:NERDTreeDirArrowExpandable = '⬏'
" let g:NERDTreeDirArrowCollapsible = '⬎'

" Toggle
map <F2> :NERDTreeToggle<CR>

" Open NERDTree on launch, unless we're opening a file or a session
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif

" Close vim if NERDTree is the only window left open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeAutoDeleteBuffer = 1

" File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('js', 'yellow', 'none', '#f7df1e', 'transparent')
call NERDTreeHighlightFile('jsx', 'yellow', 'none', '#f7df1e', 'transparent')
call NERDTreeHighlightFile('php', 'blue', 'none', '#8892be', 'transparent')
call NERDTreeHighlightFile('py', 'blue', 'none', '#4b8bbe', 'transparent')
call NERDTreeHighlightFile('json', 'lightyellow', 'none', 'lightyellow', 'transparent')
call NERDTreeHighlightFile('md', 'green', 'none', '#68D391', 'transparent')
call NERDTreeHighlightFile('yml', 'cyan', 'none', 'cyan', 'transparent')
call NERDTreeHighlightFile('conf', 'cyan', 'none', 'cyan', 'transparent')
call NERDTreeHighlightFile('config', 'cyan', 'none', 'cyan', 'transparent')
call NERDTreeHighlightFile('css', 'lightblue', 'none', 'lightblue', 'transparent')
call NERDTreeHighlightFile('scss', 'lightblue', 'none', 'lightblue', 'transparent')
call NERDTreeHighlightFile('html', 'lightred', 'none', '#f06529', 'transparent')



"" NERDCommenter

let NERDSpaceDelims = 1



"" Leaderf

let g:Lf_ShortcutF = "<leader>ff" " or <c-p>

noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" Open in vertical split with C-V
let g:Lf_CommandMap = {'<C-]>': ['<C-V>']}

" Popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1

" Use a patched font for separators
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }



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

" Only run linters named in ale_linters settings.
" let g:ale_linters_explicit = 1

" Specify linters (i.e. don't run all). Will look in the ale_linters directory.
" php:
"  - php: the php executable
"  - phpcs: https://github.com/squizlabs/PHP_CodeSniffer
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'php': ['php', 'phpcs'],
\   'python': ['flake8', 'pylint'],
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
let g:syntastic_php_checkers=['php', 'phpcs'] " The php executable and https://github.com/squizlabs/PHP_CodeSniffer
let g:syntastic_php_phpcs_args="--standard=psr2"

" JavaScript
let g:syntastic_javascript_checkers = ['eslint']



"" vim-airline

" Use powerline fonts to show powerline symbols. Needs a patched font
let g:airline_powerline_fonts = 1

" Set airline theme. Default behavior is to match the colorscheme.
let g:airline_theme='edge'



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

if executable('ag')
  let g:ackprg = 'ag --vimgrep'

  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

:tnoremap <Esc> <C-\><C-n>
