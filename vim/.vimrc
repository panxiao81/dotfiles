set nocp
set nobackup
set conceallevel=0
set fileencoding=utf-8
set number
set ai
set cursorline
set bg=dark
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set mouse=a
set clipboard=unnamedplus
set showtabline=2
syntax enable
set ignorecase
set smartcase
set incsearch
set noundofile
set cindent
set autoindent
set smartindent
set nowritebackup
set laststatus=2
set norelativenumber
set numberwidth=4
set noswapfile
set updatetime=300
colorscheme industry
set t_Co=256
au FileType markdown set warp
au FileType text set warp
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let mapleader = "\<space>"
nmap <S-l> :bnext<CR>
nmap <S-h> :bprevious<CR>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

vmap < <gv
vmap > >gv

" vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline#extensions#tabline#enabled = 1

set noshowmode
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
nmap <leader>e :NERDTreeToggle<CR>

Plug 'edkolev/tmuxline.vim'
Plug 'preservim/tagbar'

call plug#end()
