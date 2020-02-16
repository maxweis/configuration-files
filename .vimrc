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
"let g:supertabdefaultcompletiontype='<c-x><c-o>'
let g:supertabdefaultcompletiontype='<c-Space>'
let g:SuperTabContextDefaultCompletionType='<C-n>'
let g:SuperTabRetainCompletionType=2
let g:clang_snippets=1
let g:clang_snippets_engine='clang_complete'
let g:neocomplete#enable_at_startup=1
set wildmode=longest,list,full
set wildmenu
set completeopt=menu,preview
set pumheight=20
set concealcursor=vin
set showcmd
set showmatch
set ignorecase
set smartcase
set smarttab
set smartindent
set incsearch
set hlsearch
set autowrite
set hidden	
set expandtab
set number
set tw=79
set nowrap
set fo-=t
set tabstop=4
set shiftwidth=4
set expandtab
set splitright
set splitbelow
"set lazyredraw
set backspace=2 "Backspace normal functionality

"THEME
colorscheme torte
set background=dark
"highlight if over 80 characters long
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9

augroup vimrc_autocmds
    autocmd!
    autocmd BufEnter,WinEnter * call matchadd('ColorColumn', '\%81v', 100)
augroup END

"status bar
"set laststatus=2
"set noshowmode
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "kalisi"

"KEY BINDINGS
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

"x11
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
set mouse=a

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"BACKUP
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set noswapfile

"PERSISTENT UNDO
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif     

"ycm
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_rust_src_path = '~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']

"MISC
let g:jedi#goto_command = ""
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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/goyo.vim'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'lervag/vimtex'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
"Plugin 'suan/vim-instant-markdown'
"Plugin 'tpope/vim-sleuth'
"Plugin 'dag/vim2hs'
"Plugin 'rust-lang/rust.vim'
"Plugin 'rdnetto/YCM-Generator'
"Plugin 'ervandew/supertab'
"Plugin 'Rip-Rip/clang_complete'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'racer-rust/vim-racer'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'vim-scripts/AutoComplPop'
"Plugin 'justmao945/vim-clang'
"Plugin 'ctjhoa/spacevim'
"Plugin 'mbbill/code_complete'
"Plugin 'brookhong/cscope.vim'
"Plugin 'xolog/vim-easytags'
"Plugin 'derekwyatt/vim-fswitch'
"Plugin 'Chiel92/vim-autoformat'
"Plugin 'Lokaltog/vim-powerline'
"Plugin 'Lokaltog/powerline'
"Plugin 'fatih/vim-go'

call vundle#end()            " required
filetype plugin indent on
