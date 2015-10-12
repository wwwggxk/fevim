"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""设置快捷键 

let mapleader=","

"map <Leader>n <Esc>:tabnew<CR>
" 窗口切换捷键
nmap <Leader>h <C-w>h
nmap <Leader>j <C-w>j
nmap <Leader>k <C-w>k
nmap <Leader>l <C-w>l

" w!!不退出文件以root权限保存文件
cmap w!! w !sudo tee % >/dev/null

" vim复制到剪贴板
vmap ,y "+y

" 剪贴板粘贴到vim
vmap ,p "+p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""基本设置 
" 显示行号
set nu

" 如果行尾有空格，设置为可见，表示为$符号
set list
set listchars=tab:>\ ,trail:$

" 显示相对行号
"set relativenumber

" 自动换行
set wrap
set textwidth=79
set colorcolumn=85

" 不使用swap临时文件，全部放到内存中，如果文件太大最好使用wap文件
set noswapfile

" 文件编码
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

"set formatoptions=qrn1
"set formatoptions-=cro

" 代码折叠
"set foldmethod=manual
" html 自动折叠
autocmd FileType html set foldmethod=indent

" 适用7.3+: 设置undofile目录, 建议不使用,
" 就让在默认当前目录下，不然会堆积undo目录大小
" 要手动删除,如果记了会占用很大空间
"if isdirectory($HOME . '/.vim/undo') == 0
    ":silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
"endif
"set undodir=./.vimundo//
"set undodir+=~/.vim/undo//
"set undofile

" 搜索设置，高亮，忽略大小写
set hlsearch
set ignorecase
" 在非#,*搜索模式时，smartcase与ignorecase同时设置
" 关键字包含大写时完全匹配，关键字包含小写时忽略大小写
set smartcase

" 文本替换时默认开启g，如果替换时再加g会取消g效果
set gdefault

" 开始输入时即搜索，而不是在按回车时
set incsearch
set showmatch

" 如果文件在其它地方修改，实时更新文件
set autoread

" 缩进设置
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

" 高亮当前位置的行列
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" 设置状态行
set cmdheight=1
set laststatus=2

set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start

" 语法高亮与自动补全
syntax enable
syntax on

" 检测文件类型，并触发FileType事件
filetype on

" compatible是为兼容vim的，如果设置了，vim一些扩展功能就会被关闭
" 如果./.vimrc存在，nocompatible是默认开启的
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""插件配置 

" NERDTree
"设置NERDTree 边框栏大小
let g:NERDTreeWinSize = 40
map <C-n> :NERDTreeToggle<CR>
 "在Visual和Normal模式下有效
set mouse=nv

" emmet
let g:user_emmet_expandabbr_key = '<c-y>'
let g:use_emmet_complete_tag = 1

" jsbeautify
map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" auto completion
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" vim-node
set runtimepath^=~/.vim/bundle/node
autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif

"vim-javascript
let b:javascript_fold=1
let javascript_enable_domhtmlcss=1

" indent-guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=240
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=8

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

let g:pymode_rope = 1
let g:pymode_rope_autoimport = 0
let g:pymode_rope_lookup_project = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""Vundle插件 
" 安装vundle
"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

" format
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}


" 设置vundle运行时目录
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 使用vundle管理vundle插件(必需)
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'

" Syntax
Plugin 'asciidoc.vim'
Plugin 'confluencewiki.vim'
Plugin 'othree/html5.vim'
Plugin 'JavaScript-syntax'
Plugin 'moin.vim'
Plugin 'python.vim--Vasiliev'
Plugin 'xml.vim'

" Color
Plugin 'desert256.vim'
Plugin 'Impact'
Plugin 'vibrantink'
Plugin 'vividchalk.vim'

" python
Bundle 'klen/python-mode'
Plugin 'python_fold'

Plugin 'IndentAnything'
Plugin 'Javascript-Indentation'
Plugin 'mako.vim--Torborg'
Plugin 'gg/python.vim'
Plugin 'AutoClose--Alves'
Plugin 'auto_mkdir'
Plugin 'cecutil'
Plugin 'FencView.vim'
Plugin 'jsbeautify'
Plugin 'Mark'
Plugin 'matrix.vim'
Plugin 'mru.vim'
Plugin 'The-NERD-Commenter'
Plugin 'restart.vim'
Plugin 'taglist.vim'
Plugin 'ZenCoding.vim'
Plugin 'css_color.vim'

Plugin 'hallettj/jslint.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'nono/jquery.vim'

" SnipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Optional:
Plugin 'honza/vim-snippets'

" only necessary if your Vim version < 7.4
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'moll/vim-node'
Plugin 'digitaltoad/vim-jade.git'
Plugin 'https://github.com/nathanaelkane/vim-indent-guides'

" 常用
Plugin 'bling/vim-airline'
Plugin 'The-NERD-tree'
Plugin 'https://github.com/ervandew/supertab'
Plugin 'git://github.com/tpope/vim-surround.git'
Plugin 'http://github.com/mattn/emmet-vim.git'
Plugin 'ctrlpvim/ctrlp.vim'


call vundle#end()
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"filetype off                  " required
