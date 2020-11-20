"" Plug

" Download Plug if it doesn't exist
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged/')

" Misc plugins
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
Plug 'honza/vim-snippets' " Used with coc-snippets
Plug 'sjl/gundo.vim'
Plug 'Lenovsky/nuake'
Plug 'machakann/vim-sandwich'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

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
Plug 'hzchirs/vim-material'

Plug 'unblevable/quick-scope'
let g:qs_buftype_blacklist = ['terminal', 'nofile']

" DevIcons (should be last). Adds glyph icons to various plugins.
" Needs a Nerd Font compatible font.
Plug 'ryanoasis/vim-devicons'

call plug#end()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Stuff
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Misc mappings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Splits and tabs
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open split panes to right and bottom
set splitbelow splitright

" Increase tab limit for the -p command option
set tabpagemax=50



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Indenting
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Colors
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256

set termguicolors
colorscheme one
let g:edge_current_word = 'underline'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" UI
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Sessions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't store global and local values in sessions
set ssop-=options

" Don't store folds
set ssop-=folds



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Search
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Folding
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't fold by default
set nofoldenable

" Fold based on indent
set foldmethod=indent

" Deepest fold is 10 levels
set foldnestmax=10
set foldlevel=1
set foldcolumn=2



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Swap and backup
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" backup
set nobackup

" swap
set swapfile
set directory=~/.local/share/nvim/swap

" undo directory
set undodir=~/.local/share/nvim/undo



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" JavaScript
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Color the 81st column
autocmd FileType javascript,javascript.jsx,typescript set colorcolumn=81

" Indent two spaces
autocmd FileType javascript,javascript.jsx,typescript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" HTML
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Indent two spaces
autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" JSON
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Indent two spaces
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" PHP
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Color the 81st column
autocmd FileType php set colorcolumn=81

" Indent four spaces
autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" CSS
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Indent two spaces
autocmd FileType css,scss setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Python
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Git commit messages
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Force the cursor onto a new line after 72 characters
autocmd FileType gitcommit set textwidth=72

" Color the 73rd column
autocmd FileType gitcommit set colorcolumn=73



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Markdown
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Force the cursor onto a new line after 80 characters
autocmd FileType markdown set textwidth=80

" Color the 81rd column
autocmd FileType markdown set colorcolumn=81



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" NERDTree
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Custom icons for expandable/expanded directories
let g:NERDTreeDirArrowExpandable = "\u00a0" " Non-breaking space. Alt: '⬏'
let g:NERDTreeDirArrowCollapsible = "\u00a0" " Non-breaking space. Alt: '⬎'

" Toggle
map <F2> :NERDTreeToggle<CR>

" Open NERDTree on launch, unless we're opening a file or a session
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif

" Open NERDTree if opening a directory (`vim .`)
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Close vim if NERDTree is the only window left open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Show hidden files
let NERDTreeShowHidden=1

" Ignore certain files and folders
let NERDTreeIgnore=['.git$']

" Automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeAutoDeleteBuffer = 1




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" NERDCommenter
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let NERDSpaceDelims = 1



" vim-nerdtree-syntax-highlight

" Disable everything, then add what you need
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxDisableDefaultExactMatches = 1
let g:NERDTreeSyntaxDisableDefaultPatternMatches = 1
let g:NERDTreeSyntaxEnabledExtensions = [
            \ 'css',
            \ 'html',
            \ 'jpg',
            \ 'js',
            \ 'js',
            \ 'json',
            \ 'jsx',
            \ 'md',
            \ 'php',
            \ 'png',
            \ 'py',
            \ 'scss'
            \ ]



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" CtrlP
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use Git as an external scanner, which will ignore files in
" .gitignore. Note: ag automatically respects .gitignore.
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:ctrlp_match_window = 'bottom,order:ttb'

nnoremap <leader>ff :CtrlP<CR>
nnoremap <leader>fb :CtrlPBuffer<CR>
nnoremap <leader>fm :CtrlPMRU<CR>

if executable('ag')
  " Use Ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " NB: ctrlp_custom_ignore is not used, but Ag respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" vim-startify
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:startify_session_dir = '~/.local/share/nvim/sessions'
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



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" vim-airline
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use powerline fonts to show powerline symbols. Needs a patched font
let g:airline_powerline_fonts = 1

" Set airline theme. Default behavior is to match the colorscheme.
let g:airline_theme='edge'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" AutoPairs
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Flymode: if(a[3) results in: if(a[3])
let g:AutoPairsFlyMode = 1

" https://github.com/jiangmiao/auto-pairs/issues/88
let g:AutoPairsShortcutFastWrap=''



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Gundo
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:gundo_width = 60
let g:gundo_preview_height = 20

if has('python3')
    let g:gundo_prefer_python3 = 1
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" vim-markdown
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" disable concealing
let g:vim_markdown_conceal = 0



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Nuake
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" CoC
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Snippet expansion
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Unsorted/tmp
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if executable('ag')
  let g:ackprg = 'ag --vimgrep'

  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

:tnoremap <Esc> <C-\><C-n>
