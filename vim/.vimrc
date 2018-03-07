" Basics
set nocompatible
set synmaxcol=200
set encoding=utf-8
set history=1000
set undofile
set nobackup
set noswapfile
set modelines=0

" Disable Help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Undo
if !isdirectory($HOME."/.vim")
  call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
  call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

" Theme
set t_Co=256
set background=dark
colorscheme paramount
set laststatus=2
set showbreak=↪\
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set numberwidth=4
set showmatch

" Wildmenu
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=go/pkg                           " Go static files
set wildignore+=go/bin                           " Go bin files
set wildignore+=go/bin-vagrant                   " Go bin-vagrant files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files


" Programmy
syntax enable
set scrolloff=5
set sidescroll=1
set sidescrolloff=10
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=0
set smarttab
set autoindent

" Long Lines
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=85

" Splits
set fillchars=vert:│
set splitright
set splitbelow

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" Makes my highlighting work for some goddamn reason
highlight Search ctermbg=black ctermfg=yellow term=underline

" Happy Remappy
let g:mapleader = ","

" Toggle paste
nnoremap <leader>pp :setlocal paste!<cr>

" No highlight
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

" Save
nnoremap s :w<cr>

" Kill
nnoremap K :q<cr>

" Toggle list
nnoremap <leader>i :set list!<CR>

" EZ COLON
nnoremap ; :

" ACKAKAJCKKKAC
nnoremap <leader>a :Ack

" garbage
nnoremap <leader>v V`]

" EZESC
inoremap jj <ESC>

" Always search with very magic mode enabled
nnoremap / /\v
vnoremap / /\v

" Do not jump over 'real' lines, only over screen lines
nnoremap j gj
nnoremap k gk

" Simplify window navigation by removing the need for the W key
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

function! StripTrailingWhitespace()
  silent exe "normal ma<CR>"
  let saved_search = @/
  %s/\s\+$//e
  silent exe "normal `a<CR>"
  let @/ = saved_search
endfunction

autocmd FileType go,ruby,html,haml,css,js,vim autocmd BufWritePre <buffer> :call StripTrailingWhitespace()
