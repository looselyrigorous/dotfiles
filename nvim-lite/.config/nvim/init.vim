" Bootstrap vim-plug
" Modified from:
" https://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let al_plug=expand('~/.local/share/nvim/site/autoload/plug.vim')
let plug_installed=1
if !filereadable(al_plug)
	echo "Installing vim-plug"
	echo ""
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	let plug_installed=0
endif

" Set leader key early
let mapleader=","


" --- Plugin Manager Configuration ---
call plug#begin('~/.local/share/nvim/plugged')

" Dependencies
Plug 'tpope/vim-repeat' " tpope/surround.vim

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Editor
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'triglav/vim-visual-increment'
Plug 'tpope/vim-sleuth'

" Session Management
Plug 'tpope/vim-obsession'
Plug 'moll/vim-bbye'

" Filetypes
Plug 'cespare/vim-toml'

" Themes
"Plug 'jnurmine/Zenburn'
Plug 'morhetz/gruvbox'

" Install Plugins if vim-plug wasn't installed
if !plug_installed
	:PlugInstall
endif

call plug#end()
" Automatically called:
"   filetype plugin indent on
"   syntax enable

" --- Native Behaviour Config ---

" System
set updatetime=1000 " wait less time to write to swap
set nolazyredraw
set modeline        " Check for Modeline on files
set hidden          " hide buffers instead of deleting them
set timeoutlen=1000  " Prevent lag when exiting inset mode
set ttimeoutlen=10

" Mouse
"set ttyfast         " send more characters for redrawing
set mouse=a

" Indentation
set autoindent      " always set autoindenting on
set copyindent      " copy the previous indentation on autoindenting
set smartindent     " smart autoindenting in new line
set tabstop=4       " number of spaces to use for tabulation
set shiftwidth=4    " number of spaces to use for space indenting
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab        " insert tabs on the start of a line according to shiftwidth, not tabstop
"set expandtab

" Set makeprg
if has('unix')
	if has('mac')
		set makeprg=gmake
	endif
endif

" Search
set incsearch       " show search matches as you type
set hlsearch        " highlight search terms
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is all lowercase, case-sensitive otherwise

" UI
set relativenumber  " make line numbers relative to current
set number          " always show line numbers
set showmatch       " show matching parenthesis
set showcmd         " show keystrokes on current command
set title           " change terminal title
set cursorline      " highlights current line
set noshowmode       " Do not show --MODE--
set laststatus=2    " Show Airline
set shortmess+=c    " hide completions, e.g '-- XXX completion (YYY)', 'match 1 of 2', 'The only match'
"set list
set list lcs=tab:\▸\ 
"set list lcs=tab:\┊\ 
"set list lcs=tab:\➤\ 

" Colourscheme
syntax on
set bg=dark
set termguicolors
"let base16colorspace=256  " Access colors present in 256 colorspace
let g:gruvbox_italic=1
colorscheme gruvbox

" Editor
set backspace=indent,eol,start
set scrolloff=5      " minimum number of lines to keep below the cursor
set nowrap           " Don't visually wrap lines
set textwidth=100    " Indicate 100th column on buffer
set formatoptions-=t " ...but don't physically wrap text
set colorcolumn=+1   " Colour the 101st column

" --- Key Mappings ---

" Buffer traversal
nnoremap <silent><F13> :bnext<CR>
nnoremap <silent><F14> :bprevious<CR>
inoremap <silent><F13> <Esc>:bnext<CR>
inoremap <silent><F14> <Esc>:bprevious<CR>

" Completion
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
inoremap <silent><expr><CR> pumvisible() ? "\<c-y>" : "\<CR>"

" Tagbar
nnoremap <silent><Leader>t :TagbarToggle<CR>

" FZF
nnoremap <silent><Leader>f :Files<CR>
nnoremap <silent><Leader>w :Window<CR>
nnoremap <silent><Leader>b :Buffers<CR>

" ALE
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" save as root
cnoremap :w!! w !sudo tee % > /dev/null

" Make <C-l> remove any search highlighting
nnoremap <silent> <C-l> :nohl<CR>

" --- Plugin Behaviour Config ---

" Airline / Tmuxline
"let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
"let g:airline_exclude_preview = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" vim-better-whitespace
hi link ExtraWhitespace Error
