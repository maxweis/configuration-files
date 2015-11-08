"DEFAULTS
runtime! debian.vim
if has("syntax")
syntax on
endif
com! -complete=file -nargs=* Edit silent! exec "!vim --servername " . v:servername . " --remote-tab-silent <args>"
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
if has("autocmd")
filetype plugin indent on
endif
if filereadable("/etc/vim/vimrc.local")
source /etc/vim/vimrc.local
endif
set nocompatible
filetype plugin on

"PREFERENCES
let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'
set completeopt=menu,menuone
set pumheight=20
set conceallevel=2
set concealcursor=vin
set splitbelow
set splitright
set showcmd
set showmatch
set ignorecase
set smartcase
set smarttab
set incsearch
set hlsearch
set autowrite
set hidden	
set mouse=a
set tabstop=8
set shiftwidth=8
set softtabstop=8
set expandtab
set number
set tw=79
set nowrap
set fo-=t
set wildmenu
set lazyredraw
set backspace=2 "Backspace normal functionality
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

"THEME
colorscheme torte
set background=dark
"highlight if over 80 characters long
highlight ColorColumn ctermbg=blue
call matchadd('ColorColumn','\%81v',100)
set t_Co=256

"status bar
set laststatus=2
set noshowmode
"let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "kalisi"

"KEY BINDINGS
noremap ; :
noremap : ;
noremap ; :
let mapleader=","
map <leader>a ;tabp <CR>
map <leader>d ;tabn <CR>
map <leader>t ;tabe 
map <leader>q ;tab q! <CR> 
map <leader>m ;center 
map <leader>s ;split 
map <leader>S ;vsplit 
map <leader>v ;tabe  ~/.vimrc<CR>
map <leader>n ;NERDTreeToggle<CR>
map <leader>g ;Goyo<CR>
imap <leader>f <C-x><C-f>
vnoremap < <gv
vnoremap > >gv
nnoremap j gj
nnoremap k gk
nnoremap <leader>u  :nohl <CR>

"switch splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"resize splits
map <S-k> ;resize -5 <CR>
map <S-h> ;vertical resize -5 <CR>
map <S-l> ;vertical resize +5 <CR>
map <S-j> ;resize +5 <CR>

"BACKUP
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set noswapfile

"MISC
let g:session_autoload = 'no'
let g:session_autosave = 'no'

"VUNDLE
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"PLUGINS
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'bling/vim-airline'
Plugin 'junegunn/goyo.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'Rip-Rip/clang_complete'
"Plugin 'rust-lang/rust.vim'
"Plugin 'scrooloose/nerdtree'
"Plugin 'brookhong/cscope.vim'
"Plugin 'vim-scripts/AutoComplPop'
"Plugin 'xolog/vim-easytags'
"Plugin 'xolox/vim-misc'
"Plugin 'derekwyatt/vim-fswitch'
"Plugin 'vim-scripts/SearchComplete'
"Plugin 'justmao945/vim-clang'
"Plugin 'Chiel92/vim-autoformat'
"Plugin 'Lokaltog/vim-powerline'
"Plugin 'Lokaltog/powerline'
"Plugin 'mbbill/code_complete'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'fatih/vim-go'

call vundle#end()            " required
