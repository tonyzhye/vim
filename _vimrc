set nocompatible              " be iMproved, required
filetype off                  " required

" set leader
let mapleader=","
let maplocalleader=","

" remove pre auto cmd
autocmd!

" vimfile settings
if has("unix")
  set fileformats=unix,mac,dos
  let $VIMFILES= $HOME."/.vim"
else
  set fileformats=dos,unix,mac
  let $VIMFILES = $VIM."/vimfiles"
end


" set the runtime path to include Vundle and initialize
set rtp+=$VIMFILES/bundle/Vundle.vim
call vundle#begin($VIMFILES.'/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My plugins 
Plugin 'jellybeans.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" set colorscheme
colorscheme jellybeans
let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \ 'component': {
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
  \ },
  \ 'component_visible_condition': {
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ },
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
  \ }
  \ }

" set default tab to 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set backspace=indent,eol,start  " 让退格键和 Delete 键支持删除回车符


" disable swap files
set noswapfile

" highlight the current line
set cursorline

" disable mode line since lightline takes care of it
" set noshowmode

" encode
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,cp950,latin1

" font
set linespace=0
language messages zh_CN.UTF-8

set vb t_vb= "关闭响铃和闪屏
set guioptions-=T "gui的工具栏
set guioptions-=r "gui的右边的滑动条
set guioptions-=L "gui的左边的滑动条
" set guioptions-=m "gui的菜单
" set showtabline=0 "Tab栏
set laststatus=2 " 默认显示状态栏

"set nocursorline
set guifont=Source\ Code\ Pro:h14
"set guifont=YaHei\ Mono:h12

syntax on " hight syntax
set nobackup " Close backup
set nowritebackup
set autochdir
set ignorecase " ignore case on search
set nowrapscan
set incsearch 
set hlsearch
set mouse=a

" Style
set number " show line number
set hidden    " 允许在有未保存的修改时切换缓冲区
set wildmenu " 开启命令行补全
set smartindent " 智能自动缩进
set scrolloff=3  " 上下可视行数
set showmatch  "显示括号配对情况
set shortmess=atl  "启动时不显示 捐赠提示


" Key mappings
:imap jj <Esc>
