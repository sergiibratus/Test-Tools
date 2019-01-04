set nocompatible   " Disable vi-compatibility

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'fatih/vim-go'
Plugin 'lokaltog/vim-powerline'
" Plugin 'flazz/vim-colorschemes'
Plugin 'brookhong/cscope.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/gv.vim'
" Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
call vundle#end()

set timeout timeoutlen=2000

inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

set t_Co=256
set linespace=0

filetype off
filetype plugin indent on

set ff=unix
set showmode                    " always show what mode we're currently editing in
" set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set autowrite  "Save on buffer switch
set mouse=a

" set clipboard=unnamed

"Show (partial) command in the status line
set showcmd

"set guifont=Inconsolata\ for\ Powerline:h15
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
" set cursorline

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
set statusline+=%{fugitive#statusline()}

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:go_fmt_command = "goimports"
let g:Powerline_symbols = 'fancy'
let g:cscope_silent = 1

syntax on

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nmap <C-n> :NERDTreeToggle<cr>
nmap vs :vsplit<cr>
nmap sp :split<cr>
nmap bn :bn<cr>

" handy searching hotkey
map <C-f> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" highlight the searh results
highlight Search cterm=underline
" don't highlight when cursor doesn't move
" and vice versa
autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch

" Powerline (Fancy thingy at bottom stuff)
let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

" colorscheme molokai

" mapping Cscope hotkeys
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

