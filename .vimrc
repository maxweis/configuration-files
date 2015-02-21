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

"COMMANDS
command Rp execute "!python %"
command Cp execute "!sudo g++ % & ./a.out"

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
map <leader>p ;args *.py <bar> tab all <CR>
"map <leader>c ;args *.c <bar> tab all <CR> 
"map <leader>h ;args *.h <bar> tab all <CR>
map <leader>v ;tabe  ~/.vimrc<CR>
"map <leader>n ;NERDTreeToggle<CR>
map <leader>g ;Goyo<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap j gj
nnoremap k gk
nnoremap <leader>u  :nohl <CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <C-x><C-o> <leader>f
map <F1> <Esc>
imap <F1> <Esc>

"two column view 
noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>


"resize splits
map <S-k> ;resize -5 <CR>
map <S-h> ;vertical resize -5 <CR>
map <S-l> ;vertical resize +5 <CR>
map <S-j> ;resize +5 <CR>


set backup
set backupdir=/home/max/.vim/backup
set directory=/home/max/.vim/tmp
set noswapfile

"CLANG_COMPLETE
set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_snippets_engine='clang_complete'
let g:clang_library_path='/usr/lib'

"CLANG-VIM
"let g:clang_auto = 1
"let g:clang_c_options = '-std=gnu11'

"Goyo settings
let g:goyo_width=120 "defaults: 80
let g:goyo_margin_top=4 " 4
let g:goyo_margin_bottom=4 "4
let g:goyo_linenr=0 "0

" Complete options (disable preview scratch window, longest removed to aways show menu)
set completeopt=menu,menuone

"ycm
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" Limit popup menu height
set pumheight=20

" SuperTab completion fall-back 
let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'

" NERDTREE preferences
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Status bar
set laststatus=2
set noshowmode
"let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "kalisi"

"VUNDLE
set rtp+=/home/max/builds/vundle/Vundle.vim
call vundle#begin()

    "PLUGINS
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/SearchComplete'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'bling/vim-airline'
Plugin 'junegunn/goyo.vim'
Plugin 'Rip-Rip/clang_complete'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic' 
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'brookhong/cscope.vim'
"Plugin 'vim-scripts/AutoComplPop'
"Plugin 'xolog/vim-easytags'
"Plugin 'xolox/vim-misc'
"Plugin 'derekwyatt/vim-fswitch'
"Plugin 'scrooloose/nerdtree'
"Plugin 'justmao945/vim-clang'
"Plugin 'Chiel92/vim-autoformat'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'Lokaltog/vim-powerline'
"Plugin 'Lokaltog/powerline'
"Plugin 'mbbill/code_complete'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'fatih/vim-go'

call vundle#end()            " required
