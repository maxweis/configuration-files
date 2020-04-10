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
"set completeopt=menu,preview
set pumheight=20
set concealcursor=vin
set showcmd
set showmatch
set ignorecase
set smartcase
set smarttab
set smartindent
set undofile
set undodir=$HOME/.vim/undo
set incsearch
set hlsearch
set autoread
au FocusGained,BufEnter * :checktime "check file updates on focus gain and buffer enter
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
set lazyredraw
set backspace=2 "Backspace normal functionality
let &t_ut=''

"highlight if over 80 characters long
let &colorcolumn=join(range(81,999),",")

"status bar
"set laststatus=2
set noshowmode
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "purify"


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
noremap <Leader>y "+y
noremap <Leader>p "+p
set mouse=a

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
let g:ycm_global_ycm_extra_conf = '/home/max/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_rust_src_path = '~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']

"coc
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:coc_global_extensions = ['coc-clangd', 'coc-cmake', 'coc-css', 'coc-cssmodules', 'coc-explorer', 'coc-git', 'coc-highlight', 'coc-java', 'coc-json', 'coc-python', 'coc-rust-analyzer', 'coc-texlab', 'coc-yaml', 'coc-yank', 'coc-go', 'coc-snippets', 'coc-pairs']

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"indent guides
let g:indent_guides_exclude_filetypes = ['help', 'text']
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=black

"ultisnips
let g:UltiSnipsExpandTrigger = "<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips']

"MISC
let g:jedi#goto_command = ""
let g:session_autoload = 'no'
let g:session_autosave = 'no'
map <Leader> <Plug>(easymotion-prefix)
let g:go_def_mapping_enabled = 0
let g:echodoc#enable_at_startup = 1

"VIM-PLUG
call plug#begin()

"PLUGINS
Plug 'scrooloose/nerdcommenter'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/goyo.vim'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'markonm/traces.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/echodoc.vim'
"THEMES
Plug 'sjl/badwolf'
Plug 'altercation/vim-colors-solarized'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
"Plug 'haya14busa/vim-easyoperator-line'
"Plug 'jiangmiao/auto-pairs'
"Plug 'rstacruz/vim-closer'
"Plug 'whatyouhide/vim-lengthmatters'
"Plug 'romainl/vim-qf'
"Plug 'unblevable/quick-scope'
"Plug 'mhinz/vim-startify'
"Plug 'thaerkh/vim-indentguides'
"Plug 'Raimondi/delimitMate'
"Plug 'scrooloose/syntastic'
"Plug 'lervag/vimtex'
"Plug 'Valloric/YouCompleteMe'
"Plug 'suan/vim-instant-markdown'
"Plug 'tpope/vim-sleuth'
"Plug 'dag/vim2hs'
"Plug 'rust-lang/rust.vim'
"Plug 'rdnetto/YCM-Generator'
"Plug 'ervandew/supertab'
"Plug 'Rip-Rip/clang_complete'
"Plug 'davidhalter/jedi-vim'
"Plug 'racer-rust/vim-racer'
"Plug 'Shougo/neocomplete.vim'
"Plug 'vim-scripts/AutoComplPop'
"Plug 'justmao945/vim-clang'
"Plug 'ctjhoa/spacevim'
"Plug 'mbbill/code_complete'
"Plug 'brookhong/cscope.vim'
"Plug 'xolog/vim-easytags'
"Plug 'derekwyatt/vim-fswitch'
"Plug 'Chiel92/vim-autoformat'
"Plug 'Lokaltog/vim-powerline'
"Plug 'Lokaltog/powerline'

call plug#end()

"THEME
colorscheme solarized
set background=dark
