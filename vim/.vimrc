" Basics
if !has('g:syntax_on')|syntax enable|endif
set synmaxcol=120
set number
set enc=utf8
set history=1000
set nobackup
set noswapfile

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
set wildmode=longest:full,full
set wildignore=*.swp,*.bak,*.pyc,*.class

" Programmy
set tabstop=8
set expandtab
set shiftwidth=2
set softtabstop=0
set smarttab
set autoindent

" Splits
set fillchars=vert:│
set splitright
set splitbelow

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch
highlight Search ctermbg=black ctermfg=yellow term=underline

" Leader Bois
let g:mapleader = ","
nnoremap <leader>pp :setlocal paste!<cr>
nnoremap <silent> <leader><cr> :noh<cr>
nmap <leader>w :w<cr>
nnoremap <leader>i :set list!<CR>

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
