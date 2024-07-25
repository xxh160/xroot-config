" === Vim Plug ===

call plug#begin()
Plug 'tpope/vim-surround'
" Use `gcc` to comment/uncomment code
Plug 'tpope/vim-commentary'
Plug 'zivyangll/git-blame.vim'
" Enhanced vim mark
Plug 'kshenoy/vim-signature'
" Fly with <leader><leader>w/b!
Plug 'Lokaltog/vim-easymotion'
Plug 'mileszs/ack.vim'
call plug#end()

" Ack.vim, use ag
if executable('ag')
    let g:ackprg = "ag --vimgrep"
endif

" === Base ===

" Syntax highlighing
syntax on
set background=dark
" Uncomment the following to have vim load indentation rules and plugins
" according to detected filetype
filetype plugin indent on
" Command-line completion operates in an enhanced mode
set wildmenu
" Show matching brackets
set showmatch
" Do case insentitive matching
set ignorecase
" Do smart case matching
set smartcase
" Incremental search
set incsearch
" Hide buffers when they are adandoned
set hidden
" Do not generate swap files
set noswapfile
" Show line number
set number
" Normal regex
set magic
" When there is a previous search pattern, highlight all its matches
set hlsearch
" Alawys show status line
set laststatus=2
" Status line info
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ Ln\ %l,\ Col\ %c/%L%)
" Highlight the screen line of the cursor with CursorLine
" set cursorline
" When on, Vim will change the current working directory whenever you
" open a file, switch buffers, delete a buffer or open/close a window
set autochdir
" Enable fold
set foldenable
" Syntax highlighting items specify folds
set foldmethod=syntax
set foldcolumn=0
set foldlevel=1
" This is useful if you want to cut or copy some text from one window and paste it in Vim
set paste
" Number of spaces that a <Tab> in the file counts for
set tabstop=4
" Number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <BS>
set softtabstop=4
" Length of >> and <<
set shiftwidth=4
" Do smart autoindenting when starting a new line
set smartindent
" In Insert mode: Use the appropriate number of spaces to insert a <Tab>
set expandtab

" === Shortcuts ===

" Leader
let mapleader="\<space>"
" Window
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k
nnoremap <leader>wh <c-w>h
nnoremap <leader>wl <c-w>l
nnoremap <leader>ws <c-w>s
nnoremap <leader>wv <c-w>v
nnoremap <leader>wd <c-w>c
" Buffer
nnoremap <leader>bl :buffers<cr>
nnoremap <leader>bp :bprev<cr>
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bk :bdelete<cr>
nnoremap <leader>bb :buffer
" Jump
nnoremap <leader>jo <c-o>
nnoremap <leader>ji <c-i>
" Ctags and Cscope
nnoremap <leader>cd <c-]>
nnoremap <leader>cu yiw:cs find c <c-r>"<cr>
" Register
nnoremap <leader>rl :reg<cr>
" Mark
nnoremap <leader>ml :call signature#mark#List(0, 0)<cr>
nnoremap <leader>mn ]`
nnoremap <leader>mp [`
" Search
nnoremap <leader>sr :%s/<c-r>"/
nnoremap <leader>ss "ayiw:Ack! <c-r>a<cr>
" Git
nnoremap <leader>gs :<c-u>call gitblame#echo()<cr>
