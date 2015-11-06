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
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Html tools
Plugin 'tpope/vim-ragtag'
Plugin 'MatchTag'

" Helper tools
Plugin 'vim-scripts/matchit.zip'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'vim-scripts/mru.vim'
Plugin 'vim-scripts/FavEx'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

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
set autoindent
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

"set nocursorline
set guifont=Source\ Code\ Pro:h14
"set guifont=YaHei\ Mono:h12

syntax on " hight syntax
set nobackup " Close backup
set nowritebackup
"set autochdir
set ignorecase " ignore case on search
set nowrapscan
set nowrap
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
let NERDTreeWinSize=25
nnoremap <Leader>tt :NERDTree<CR>

let NERDMenuMode = 0

" YouCompleteMe 
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p', '<Up>']

" session
let g:session_autoload = 'no'
let g:session_autosave = 'no'

" Allow JSX in normal JS files
let g:jsx_ext_required = 0 

"statusline setup
"set statusline =%#identifier#
set statusline+=[%t]    "tail of the filename
set statusline+=%*

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype

"read only flag
"set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
"set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

set statusline+=%{fugitive#statusline()}

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{StatuslineTrailingSpaceWarning()}

set statusline+=%{StatuslineLongLineWarning()}

set statusline+=%#warningmsg#
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
  if !exists("b:statusline_trailing_space_warning")
    if !&modifiable
      let b:statusline_trailing_space_warning = ''
      return b:statusline_trailing_space_warning
    endif

    if search('\s\+$', 'nw') != 0
      let b:statusline_trailing_space_warning = '[\s]'
    else
      let b:statusline_trailing_space_warning = ''
    endif
  endif
  return b:statusline_trailing_space_warning
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
  if !exists("b:statusline_tab_warning")
    let b:statusline_tab_warning = ''

    if !&modifiable
      return b:statusline_tab_warning
    endif

    let tabs = search('^\t', 'nw') != 0

    "find spaces that arent used as alignment in the first indent column
    let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

    if tabs && spaces
      let b:statusline_tab_warning =  '[mixed-indenting]'
    elseif (spaces && !&et) || (tabs && &et)
      let b:statusline_tab_warning = '[&et]'
    endif
  endif
  return b:statusline_tab_warning
endfunction

"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
  if !exists("b:statusline_long_line_warning")

    if !&modifiable
      let b:statusline_long_line_warning = ''
      return b:statusline_long_line_warning
    endif

    let long_line_lens = s:LongLines()

    if len(long_line_lens) > 0
      let b:statusline_long_line_warning = "[" .
            \ '#' . len(long_line_lens) . "," .
            \ 'm' . s:Median(long_line_lens) . "," .
            \ '$' . max(long_line_lens) . "]"
    else
      let b:statusline_long_line_warning = ""
    endif
  endif
  return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
  let threshold = (&tw ? &tw : 80)
  let spaces = repeat(" ", &ts)
  let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
  return filter(line_lens, 'v:val > threshold')
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
  let nums = sort(a:nums)
  let l = len(nums)

  if l % 2 == 1
    let i = (l-1) / 2
    return nums[i]
  else
    return (nums[l/2] + nums[(l/2)-1]) / 2
  endif
endfunction

" Key mappings
nnoremap <f1> :BufExplorer<cr>
nnoremap <f2> :NERDTreeToggle<cr>
nnoremap <f3> :MRU<cr>
let favex_fs='<f4>'

:imap jj <Esc>
