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
  set fileformats=unix,mac,dos
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

" Syntax
Plugin 'othree/html5.vim'
Plugin 'othree/html5-syntax.vim'
Plugin 'isRuslan/vim-es6'
Plugin 'hallison/vim-markdown'

" Html tools
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-ragtag'
Plugin 'MatchTag'
Plugin 'maksimr/vim-jsbeautify'

" Helper tools
Plugin 'vim-scripts/matchit.zip'
Plugin 'Raimondi/delimitMate'

if has("win64")
  Bundle 'snakeleon/YouCompleteMe-x64'
elseif has("win32")
  Bundle 'snakeleon/YouCompleteMe-x86'
else
  Bundle 'Valloric/YouCompleteMe'
endif

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

" Customize status bar
:set statusline=%F%m%r%h%w\ %l:%v\ %{&ff}\ %p%%
set laststatus=2 " 默认显示状态栏

"set nocursorline
set guifont=Source\ Code\ Pro:h14
"set guifont=YaHei\ Mono:h12

syntax on " hight syntax
set nobackup " Close backup
set nowritebackup
"set autochdir
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

" display extra whitespace
set list listchars=tab:\|\ ,extends:>,precedes:<

" Nerdtree
" {{{ NERDtree 文件管理器
" 让Tree把自己给装饰得多姿多彩漂亮点
let NERDChristmasTree=1
" 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
let NERDTreeAutoCenter=1
" 指定书签文件
let NERDTreeBookmarksFile=$VIMFILES.'\NERDTree_bookmarks'
" 指定鼠标模式(1.双击打开 2.单目录双文件 3.单击打开)
let NERDTreeMouseMode=2
" 是否默认显示书签列表
let NERDTreeShowBookmarks=1
" 是否默认显示文件
let NERDTreeShowFiles=1
" 是否默认显示行号
let NERDTreeShowLineNumbers=0
" 窗口位置（'left' or 'right'）
let NERDTreeWinPos='left'
" 窗口宽度
let NERDTreeWinSize=31
nnoremap <Leader>tt :NERDTree<CR>
"}}}

" {{{ The-NERD-Commenter 注释代码用的，以下映射已写在插件中
let NERDMenuMode = 0
" <Leader>ca 在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
" <Leader>cc 注释当前行
" <Leader>cs 以”性感”的方式注释
" <Leader>cA 在当前行尾添加注释符，并进入Insert模式
" <Leader>cu 取消注释
" <Leader>cm 添加块注释
" }}}

" {{{ vim-jsbeautify  need nodejs 优化html/js/js代码，并不是简单的缩进噢
let g:config_Beautifier = {
			\ 'js' : {
				\ 'indent_size' : 4,
				\ 'indent_style' : 'tab',
				\ },
			\ 'css' : {
				\ 'indent_size' : 4,
				\ 'indent_style' : 'tab',
				\ },
			\ 'html' : {
				\ 'indent_size' : 4,
				\ 'indent_style' : 'tab',
				\ }
			\ }
autocmd FileType javascript noremap <silent> <Leader>js :call JsBeautify()<cr>
autocmd FileType html noremap <silent> <Leader>js :call HtmlBeautify()<cr>
autocmd FileType css,less noremap <silent> <Leader>js :call CSSBeautify()<cr>
" }}}

" YouCompleteMe 
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p', '<Up>']

" Key mappings
:imap jj <Esc>
