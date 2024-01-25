set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" vim syntax highlight
Plugin 'tomlion/vim-solidity'
Plugin 'hashivim/vim-terraform'


" comment utility
Plugin 'preservim/nerdcommenter'

" statusbar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" nerdtree
Plugin 'preservim/nerdtree'

" ALE dense analysis
"Plugin 'dense-analysis/ale'

" vim-gitgutter
Plugin 'airblade/vim-gitgutter'

" CoPilot
Plugin 'github/copilot.vim'

" Markdown
Plugin 'instant-markdown/vim-instant-markdown'

" Black
Plugin 'psf/black'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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

inoremap jk <ESC>
let mapleader = "'"
syntax on " syntax
set number " relative line numbers
"set rnu " relative line numbers
set noswapfile " disable the swapfile
set hlsearch " highlight all results
set ignorecase " ignore case in search
set incsearch " show search results as you type
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
autocmd FileType yaml setlocal ai ts=2 sw=2 et

let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 40
let g:NERDTreeQuitOnOpen = 0
let NERDTreeShowHidden=1
let g:tagbar_left = 1
let g:tagbar_width = 40
let g:tagbar_autoclose = 0
let g:tagbar_autofocus = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_SplitWidth = 40

" ALE analysis
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"let g:ale_sign_error = '✘'
"let g:ale_sign_warning = '⚠'
"let g:ale_lint_on_text_changed = 'never'


let g:sidebars = {
  \ 'nerdtree': {
  \     'position': 'left',
  \     'check_win': {nr -> getwinvar(nr, '&filetype') ==# 'nerdtree'},
  \     'open': 'NERDTree',
  \     'close': 'NERDTreeClose'
  \ },
  \ 'tagbar': {
  \     'position': 'left',
  \     'check_win': {nr -> bufname(winbufnr(nr)) =~ '__Tagbar__'},
  \     'open': 'TagbarOpen',
  \     'close': 'TagbarClose'
  \ },
  \ 'undotree': {
  \     'position': 'left',
  \     'check_win': {nr -> getwinvar(nr, '&filetype') ==# 'undotree'},
  \     'open': 'UndotreeShow',
  \     'close': 'UndotreeHide'
  \ }
  \ }

noremap <silent> <M-1> :call sidebar#toggle('nerdtree')<CR>
noremap <silent> <M-2> :call sidebar#toggle('tagbar')<CR>
noremap <silent> <M-3> :call sidebar#toggle('undotree')<CR>

let g:startify_session_before_save = ['call sidebar#close_all()']
set clipboard=unnamed

" Remap esc
" esc in insert & visual mode
inoremap ii <esc>
vnoremap ii <esc>

" esc in command mode 
cnoremap ii <C-C>

" disable arrow keys 
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>
map <C-n> :NERDTreeToggle<CR>

" remap ctrl + w to F10 like tmux
:nnoremap <F10> <C-w>



set rtp+=/usr/local/opt/fzf

" comments start with these quotes for some reason
syn on	" turn on syntax highlighting
set tabstop=4	" set tab width
set nu	" show line numbers to left of text
set ruler	" show row, col in lower-right corner
set ignorecase	" case-insensitive search (/ and ?)
set spell	" use spell-checking
set nocompatible	" vim-specific mode
set backspace=2	" set backspace key to work like most other editors
set scrolloff=5	" keep at least 5 lines above/below
set nohls	" don't highlight the search
set hlsearch	" highlight the search
set directory=c:\\temp\\ " location of swap files

" restore cursor to last position in file:
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

" vim: set ts=17:

"let g:vim_json_warnings=0

" markdown preview
filetype plugin on
"Uncomment to override defaults:
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
let g:instant_markdown_open_to_the_world = 1
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_allow_external_content = 0
let g:instant_markdown_mathjax = 1
let g:instant_markdown_mermaid = 1
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_autoscroll = 0
let g:instant_markdown_port = 8888
let g:instant_markdown_python = 1
let g:instant_markdown_theme = 'dark'

" from NerdTree open file in existing open file with o
let NERDTreeHijackNetrw=1

" ctags for finding functions definition
set tags+=tags;$HOME
set termguicolors
set nospell

