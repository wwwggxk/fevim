let mapleader=","

" 取消escape，使用输入模式下的jk代替
" inoremap <esc> <nop>
inoremap jk <esc>

" html文件不使用换行
augroup filetype_html
    autocmd!
    autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END

" 编辑.vimrc
nnoremap <leader>ev :vsplit $HOME/.vimrc<cr>
" 重新读取.vimrc
nnoremap <leader>lv :source $HOME/.vimrc<cr>
" w!!不退出文件以root权限保存文件
cnoremap w!! w !sudo tee % >/dev/null
" vim复制到剪贴板
vnoremap ,y "+y
" 剪贴板粘贴到vim
vnoremap ,p "+p
" 执行最后一个命令
nnoremap :: @:
" 切到左窗口
nnoremap <Leader>h <C-w>h
" 切到下窗口
nnoremap <Leader>j <C-w>j
" 切到上窗口
nnoremap <Leader>k <C-w>k
" 切到右窗口
nnoremap <Leader>l <C-w>l
" 顺序切换窗口
nnoremap <Leader>w <C-w>w
" 复制绝对路径到剪贴版
nmap <Leader>yf :let @+ = expand("%:p")<cr>
" 复制相对路径到剪贴版
nmap <Leader>yF :let @+ = expand("%")<cr>
nmap <Leader>yn :let @+ = expand("%:t")<cr>
nmap <Leader>yd :let @+ = expand("%:p:h")<cr>
" 转到第几个tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" 当前tab与上一个tab切换
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <Leader>T :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <Leader>T :exe "tabn ".g:lasttab<cr>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" 切换到当前操作文件目录
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
" 上翻页
nnoremap <Leader><Leader>k <C-b>
" 下翻页
nnoremap <Leader><Leader>j <C-f>
" 显示下面更多区域
nnoremap <Leader><Leader>e <C-e>
" 显示上面更多区域
nnoremap <Leader><Leader>y <C-y>
" 快速打开chrome浏览器
nnoremap <Leader><Leader>c :!open -a google\ chrome %<CR><CR>
" 粘贴模式，粘贴时不自动indent
nnoremap <silent> <leader>p :set paste<CR>"*p:set nopaste<CR>

" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 基本设置.3
" compatible是为兼容vim的，如果设置了，vim一些扩展功能就会被关闭
" 如果./.vimrc存在，nocompatible是默认开启的
set nocompatible
filetype on                                 " 检测文件类型，并触发FileType事件
set nu                                      " 显示行号
set relativenumber                          " 显示相对行号
set wrap                                    " 自动换行
set linebreak                               " 折行使单词连续
set textwidth=80                            " 文本宽度
set colorcolumn=+1                          " 显示超过最大文本宽度边界线

autocmd FileType html set foldmethod=indent " html 自动折叠

" 设置vim cache文件存放路径
set viminfo+=n~/.vim/viminfo
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" 如果行尾有空格，设置为可见，表示为$符号
set list
set listchars=tab:>\ ,trail:$

" 超过80个字符背景变为红色
highlight OverLength ctermbg=red ctermfg=white guibg=#500000
match OverLength /\%81v.\+/

set encoding=utf-8                          " 终端显示文件编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 " 文件写入编码

set hlsearch " 搜索设置，高亮，忽略大小写
" 在非#,*搜索模式时，smartcase与ignorecase同时设置
" 关键字包含大写时完全匹配，关键字包含小写时忽略大小写
set ignorecase
set smartcase
set gdefault " 文本替换时默认开启g，如果替换时再加g会取消g效果
set autoread " 如果文件在其它地方修改，实时更新文件
set incsearch " 开始输入时即搜索，而不是在按回车时

" 2个空格代替tab
set tabstop=2
set shiftwidth=2
set softtabstop=2
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

" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 插件.4
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 基础
Plugin 'VundleVim/Vundle.vim'                    "P000 使用vundle管理vundle插件(必需)
Plugin 'L9'                                      "P001 一些实用工具
Plugin 'altercation/vim-colors-solarized'        "p002 主题配色

" 目录导航
Plugin 'scrooloose/nerdtree'                     "P100 vim目录导航
Plugin 'Xuyuanp/nerdtree-git-plugin'             "P101 nerdtree显示文件git状态
Plugin 'Yggdroot/indentLine'                     "p102 显示缩进符号
Plugin 'vim-airline/vim-airline'                 "P104 状态栏
Plugin 'vim-airline/vim-airline-themes'          "P105 vim-airline主题
Plugin 'easymotion/vim-easymotion'               "P106 快速定位
Plugin 'airblade/vim-gitgutter'                  "P107 在行前显示删减行标识
Plugin 'voldikss/vim-floaterm'                   "P108 弹框命令行
Plugin 'mhinz/vim-startify'                      "P109 启动屏
Plugin 'jiangmiao/auto-pairs'                    "P110 括号绰号操作

" 常用工具
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'                        "p200 file查找, sys fzf install ***
Plugin 'mileszs/ack.vim'                         "p201 ack内容搜索，sys ack install ***
Plugin 'git://github.com/tpope/vim-surround.git' "p202 加/减操作[({等
Plugin 'terryma/vim-multiple-cursors'            "p203 多选操作
Plugin 'DrawIt'                                  "p204 ascii线条图
Plugin 'tpope/vim-abolish'                       "p205 格式转换snake_case/Mixed_case/camelCase
Plugin 'godlygeek/tabular'                       "p206 自动对齐
Plugin 'jeffkreeftmeijer/vim-numbertoggle'       "p207 切换显示相对行号还是绝对行号
Plugin 'scrooloose/nerdcommenter'                "p210 快速注释
Plugin 'mattn/emmet-vim'                         "p211 快速生成代码
Plugin 'w0rp/ale'                                "p212 代码lint工具
Plugin 'tyru/open-browser.vim'                   "p213 浏览器操作
Plugin 'SirVer/ultisnips'                        "p214 utilsnips engine
Plugin 'honza/vim-snippets'                      "p214 utilsnips Snippets
Plugin 'ycm-core/YouCompleteMe'                  "p216 自动补全
Plugin 'prettier/vim-prettier'                   "p217 代码美化
Plugin 'Chiel92/vim-autoformat'                  "p218 格式化
Plugin 'RRethy/vim-illuminate'                   "p219 高亮显示光标所在的词

" 编程语法
Plugin 'iamcco/markdown-preview.vim'             "p300 markdown浏览器实时预览
Plugin 'tpope/vim-markdown'                      "p301 markdown
Plugin 'moll/vim-node'                           "p310 node
Plugin 'heavenshell/vim-jsdoc'                   "p311 jsdoc
Plugin 'cakebaker/scss-syntax.vim'               "p312 sass
Plugin 'groenewege/vim-less'                     "p313 less
Plugin 'mxw/vim-jsx'                             "p314 reactjs
Plugin 'alvan/vim-closetag'                      "p315 当输入>时自动关闭html标签
Plugin 'flowtype/vim-flow'                       "p316 Flow代码检查
Plugin 'pangloss/vim-javascript'                 "P317 vim js缩进及语法支持
Plugin 'epilande/vim-react-snippets'             "p318 react snippets
Plugin 'leafgarland/typescript-vim'              "p319 typescript
Plugin 'ap/vim-css-color'                        "p320 css颜色显示色块
Plugin 'turbio/bracey.vim'                       "p321 实时编辑js/css/html

call vundle#end()
filetype plugin indent on " 根据侦测到的不同类型加载对应的插件

" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 插件配置.5
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> P108
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_toggle = '<F8>'
let g:floaterm_keymap_prev   = '<F9>'
let g:floaterm_keymap_next   = '<F10>'

highlight Floaterm guibg=black
highlight FloatermBorder guibg=orange guifg=cyan
highlight FloatermNC guibg=gray

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p214 SirVer/ultisnips
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p216 ycm-core/YouCompleteMe
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_add_preview_to_completeopt = 1

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p213 tyru/open-browser.vim

let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p200 junegunn/fzf.vim
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
map <leader>o :GFiles<cr>

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p106 vim-easymotion
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-bd-f)

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p104 vim-airline/vim-airline
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'jsformatter'
let airline#extensions#tabline#show_buffers = 0

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p34 flowtype/vim-flow
let g:flow#autoclose=1

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p217 prettier/vim-prettier
nmap <Leader>b <Plug>(Prettier)
let g:prettier#config#config_precedence = 'file-override'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#tab_width = 2
let g:prettier#config#print_width = 80
let g:prettier#config#bracket_spacing = 'true'
" none|es5|all
" Prettier default: none
let g:prettier#config#trailing_comma = 'none'
" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" Prettier default: babylon
" let g:prettier#config#parser = 'flow'
let g:prettier#config#parser = 'flow'

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p218 Chiel92/vim-autoformat
noremap <F5> :Autoformat<CR>

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p002 vim-colors-solarized
set background=light
colorscheme solarized

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p311 heavenshell/vim-jsdoc
nmap <silent> <Leader><Leader>d <Plug>(jsdoc)

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p101 Xuyuanp/nerdtree-git-plugin
"当打开vim且没有文件时自动打开NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif


let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeGitStatusShowIgnored = 1

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p109 mhinz/vim-startify
"当打开vim且没有文件时自动打开Startify
autocmd vimenter * if !argc() | Startify | endif

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p206 godlygeek/tabular
" :Tabularize /:\zs
" :Tabularize /:
" if exists(":Tabularize")
    " nmap <Leader>g= :Tabularize /=<CR>
    " vmap <Leader>g= :Tabularize /=<CR>
    " nmap <Leader>g: :Tabularize /:<CR>
    " vmap <Leader>g: :Tabularize /:<CR>
" endif

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p100 scrooloose/nerdtree
"let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize = 24
map <Leader>n :NERDTreeToggle<CR>
nmap <Leader>m :NERDTreeFind<CR>
" 切到nerdtree目录
noremap <leader>t 1gt<bar> :NERDTreeFocus <CR>
 "在Visual和Normal模式下有效
set mouse=nv

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p210 scrooloose/nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters={
  \ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p211 mattn/emmet-vim
" 注意末尾需要加上leader键，如下面配置为CTRL + y + ,
let g:user_emmet_leader_key='<C-y>'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript.jsx EmmetInstall

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> autocompletion
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p201 mileszs/ack.vim
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p310 moll/vim-node
set runtimepath^=~/.vim/bundle/node
autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p317 pangloss/vim-javascript
let b:javascript_fold=1
let javascript_enable_domhtmlcss=1
let g:javascript_plugin_jsdoc = 1

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p208 jeffkreeftmeijer/vim-numbertoggle
let g:NumberToggleTrigger="<F2>"

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> p212 w0rp/ale
" \   'go': ['gopls'],
let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'scss': ['prettier'],
  \   'html': ['prettier'],
\}
let g:ale_javascript_eslint_executable = 'eslint'
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_open_list = 0 " auto close when no warning or error

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_keep_list_window_open = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'nerver'
let g:ale_cache_executable_check_failures = 1
let g:ale_list_vertical = 0
