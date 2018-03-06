if !has('g:syntax_on')|syntax enable|endif
set number
set background=dark
set synmaxcol=120
colorscheme paramount
set ignorecase
set smartcase
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab
set laststatus=2
set showtabline=1
set guioptions-=e
set wildignore+=tmp,.bundle,.sass-cache,.git,.svn,.hg,doc,coverage,vendor,node_modules,deps,_build,elm-stuff,ios,android
set fillchars=vert:│
set listchars=tab:\·\ ,trail:·,eol:¬
set numberwidth=4
set splitright
set splitbelow
set nowrap

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set list

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

autocmd FileType ruby,html,haml,css,js,vim autocmd BufWritePre <buffer> :call StripTrailingWhitespace()
