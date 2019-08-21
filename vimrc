" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 安装配置.1
" 1.安装vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" 2.下载配置文件
" git clone https://github.com/wungqiang/vimer.git
" mv ./vimer/vimrc ~/.vimrc && rm -rf ./vimer

" 3.安装插件
" 进入vim
" 运行命令:PluginInstall

" cd ~/.vim/bundle/tern_for_vim && npm i
" cd ~/.vim/bundle/YouCompleteMe/ && python ./install.py

" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 设置快捷键.2
let mapleader=","

" 取消escape，使用输入模式下的jk代替
" inoremap <esc> <nop>
inoremap jk <esc>

nnoremap <leader>g :silent execute "grep! -R " .  shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" html文件不使用换行
augroup filetype_html
    autocmd!
    autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap ip( :<c-u>normal! F)vi(<cr>

" 编辑.vimrc
nnoremap <leader>ev :vsplit $HOME/.vimrc<cr>

" 重新读取.vimrc
nnoremap <leader>sv :source $HOME/.vimrc<cr>

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

" 转到第几个buffer
nmap <leader><leader>1 :bfirst<CR>
nmap <leader><leader>2 :bfirst<CR>:bn<CR>
nmap <leader><leader>3 :bfirst<CR>:2bn<CR>
nmap <leader><leader>4 :bfirst<CR>:3bn<CR>
nmap <leader><leader>5 :bfirst<CR>:4bn<CR>
nmap <leader><leader>6 :bfirst<CR>:5bn<CR>

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

" 切到nerdtree目录
noremap <leader>t 1gt<bar> :NERDTreeFocus <CR>

" 切换到当前操作文件目录
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" 保存并退出所有窗口
nnoremap <Leader><Leader>q :wqa<CR>

" 取消高亮
nnoremap <Leader><Enter> :noh<CR>

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
" set noswapfile                              " 不使用swap临时文件，全部放到内存中，如果文件太大最好使用wap文件
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" 设置新建html模版
autocmd BufNewFile  *.html   0r ~/.vim/templates/skeleton.html

" 如果行尾有空格，设置为可见，表示为·符号
set list
set listchars=tab:>\ ,trail:$

" 超过80个字符背景变为红色
highlight OverLength ctermbg=red ctermfg=white guibg=#500000
match OverLength /\%81v.\+/

set encoding=utf-8                          " 终端显示文件编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 " 文件写入编码

"当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif

" 搜索设置，高亮，忽略大小写
set hlsearch
set ignorecase
" 在非#,*搜索模式时，smartcase与ignorecase同时设置
" 关键字包含大写时完全匹配，关键字包含小写时忽略大小写
set smartcase

set gdefault " 文本替换时默认开启g，如果替换时再加g会取消g效果
set autoread " 如果文件在其它地方修改，实时更新文件

set incsearch " 开始输入时即搜索，而不是在按回车时
"set showmatch

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

" 推荐
Plugin 'VundleVim/Vundle.vim'                    " 使用vundle管理vundle插件(必需)
Plugin 'L9'                                      " 一些实用工具
Plugin 'pangloss/vim-javascript'                 " vim js缩进及语法支持
Plugin 'maksimr/vim-jsbeautify'                  " 格式化js文件
Plugin 'isruslan/vim-es6'                        " es6代码语法高亮
Plugin 'vim-airline/vim-airline'                 " 状态栏
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'               " 快速定位
Plugin 'airblade/vim-gitgutter'                  " 在行前显示删减行标识
Plugin 'scrooloose/nerdtree'                     " vim目录导航
Plugin 'Xuyuanp/nerdtree-git-plugin'             " nerdtree显示文件git状态
" Plugin 'tpope/vim-fugitive'                      " vim git管理
Plugin 'scrooloose/nerdcommenter'                " 快速注释
Plugin 'git://github.com/tpope/vim-surround.git' " 加/减[({等
Plugin 'Yggdroot/indentLine'                     " 显示缩进符号
Plugin 'ervandew/supertab'                       " tab自动补全
Plugin 'mattn/emmet-vim'                         " 快速生成代码
Plugin 'ctrlpvim/ctrlp.vim'                      " 查找文件
" Plugin 'scrooloose/syntastic'                    " 语法提示
" Plugin 'vim-syntastic/syntastic'                 " 语法提示
Plugin 'w0rp/ale'
Plugin 'altercation/vim-colors-solarized'        " 主题配色
Plugin 'tpope/vim-abolish'                       " 格式转换snake_case/Mixed_case/camelCase
Plugin 'DrawIt'                                  " ascii线条图
" Plugin 'garbas/vim-snipmate'                     " 代码片段补全(和下面两个一起)
" Plugin 'MarcWeber/vim-addon-mw-utils'            " vim-snipmate依赖
" Plugin 'tomtom/tlib_vim'                         " vim-snipmate依赖
"
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

Plugin 'godlygeek/tabular'                       " 自动对齐
Plugin 'iamcco/markdown-preview.vim'             " markdown浏览器实时预览
Plugin 'tpope/vim-markdown'                      " markdown高亮
Plugin 'moll/vim-node'                           " node
Plugin 'heavenshell/vim-jsdoc'                   " jsdoc
Plugin 'cakebaker/scss-syntax.vim'               " sass语法高亮
Plugin 'groenewege/vim-less'                     " less语法高亮
" Plugin 'burnettk/vim-angular'                    " angular语法高亮
Plugin 'mxw/vim-jsx'                             " reactjs
" Plugin 'othree/javascript-libraries-syntax.vim'  " js库语法高亮
Plugin 'jeffkreeftmeijer/vim-numbertoggle'       " 切换显示相对行号还是绝对行号
" Plugin 'ashisha/image.vim'                       " 图片显示为ascii图片
Plugin 'alvan/vim-closetag'                      " 当输入>时自动关闭html标签
Plugin 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }                  " 自动补全
Plugin 'majutsushi/tagbar'                       " tag查看
Plugin 'ternjs/tern_for_vim',{ 'do' : 'npm install' }                     " vim js代码分析引擎(配合jsctags)
Plugin 'ramitos/jsctags'                         " 配合tagbar生成代码tag(配合tabar)
Plugin 'flowtype/vim-flow'                       " Flow check
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mileszs/ack.vim'
Plugin 'mkitt/tabline.vim'
Plugin 'prettier/vim-prettier'                   " need 'npm i -g prettier'
Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }


Plugin 'Yggdroot/LeaderF', { 'do': './install.sh' }

" install fzf already
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'

Plugin 'plytophogy/vim-virtualenv'

Plugin 'dart-lang/dart-vim-plugin'
Plugin 'thosakwe/vim-flutter'
Plugin 'natebosch/vim-lsc'
Plugin 'natebosch/vim-lsc-dart'



call vundle#end()
filetype plugin indent on " 根据侦测到的不同类型加载对应的插件

" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 插件配置.5

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>natebosch/vim-flutter

" Some of these key choices were arbitrary;
" it's just an example.
"nnoremap <leader>fa :FlutterRun<cr>
"nnoremap <leader>fq :FlutterQuit<cr>
"nnoremap <leader>fr :FlutterHotReload<cr>
"nnoremap <leader>fR :FlutterHotRestart<cr>
"nnoremap <leader>fD :FlutterVisualDebug<cr>

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>natebosch/vim-lsc

let g:lsc_server_commands = {'dart': 'dart_language_server'}
" Use all the defaults (recommended):
let g:lsc_auto_map = v:true
let g:lsc_enable_autocomplete = v:false

" Apply the defaults with a few overrides:
let g:lsc_auto_map = {'defaults': v:true, 'FindReferences': '<leader>r'}

" Setting a value to a blank string leaves that command unmapped:
let g:lsc_auto_map = {'defaults': v:true, 'FindImplementations': ''}

" ... or set only the commands you want mapped without defaults.
" Complete default mappings are:
let g:lsc_auto_map = {
    \ 'GoToDefinition': '<C-]>',
    \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
    \ 'FindReferences': 'gr',
    \ 'NextReference': '<C-n>',
    \ 'PreviousReference': '<C-p>',
    \ 'FindImplementations': 'gI',
    \ 'FindCodeActions': 'ga',
    \ 'Rename': 'gR',
    \ 'ShowHover': v:true,
    \ 'DocumentSymbol': 'go',
    \ 'WorkspaceSymbol': 'gS',
    \ 'SignatureHelp': 'gm',
    \ 'Completion': 'completefunc',
    \}

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Yggdroot/LeaderF
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
map <leader>o :Files<cr>

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Yggdroot/LeaderF
" let g:Lf_ShortcutF = '<Leader>o'

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> vim-easymotion
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-bd-f)

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> vim-airline/vim-airline
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'jsformatter'
let airline#extensions#tabline#show_buffers = 0

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> flowtype/vim-flow
let g:flow#autoclose=1

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> prettier/vim-prettier
nmap <Leader>b <Plug>(Prettier)
let g:prettier#config#single_quote = 'true'
let g:prettier#config#tab_width = 2
let g:prettier#config#print_width = 80

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> vim-colors-solarized
set background=dark
colorscheme solarized

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> tern_for_vim
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1


" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> JSDoc
nmap <silent> <Leader><Leader>d <Plug>(jsdoc)

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
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

let g:NERDTreeShowIgnoredStatus = 1

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> tabular
" :Tabularize /:\zs
" :Tabularize /:
" if exists(":Tabularize")
    " nmap <Leader>g= :Tabularize /=<CR>
    " vmap <Leader>g= :Tabularize /=<CR>
    " nmap <Leader>g: :Tabularize /:<CR>
    " vmap <Leader>g: :Tabularize /:<CR>
" endif

" inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
" function! s:align()
  " let p = '^\s*|\s.*\s|\s*$'
  " if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    " let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    " let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    " Tabularize/|/l1
    " normal! 0
    " call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  " endif
" endfunction

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> tagbar
" let tagbar_left=1
"let tagbar_width=40
"let g:tagbar_compact=1
"nmap <Leader><Leader>t :TagbarToggle<CR>
"let g:tagbar_type_css = {
    "\ 'ctagstype' : 'Css',
    "\ 'kinds'     : [
    "\ 'c:classes',
    "\ 's:selectors',
    "\ 'i:identities'
    "\ ]
"\ }

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> javascript-libraries-syntax
let g:used_javascript_libs = 'jquery,requirejs,vue,d3,react'

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> NERDTree
"let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize = 40
map <Leader><Leader>n :NERDTreeToggle<CR>
 "在Visual和Normal模式下有效
set mouse=nv

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>nerdcommenter
let g:NERDSpaceDelims = 1

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> emmet
" let g:user_emmet_leader_key='<C-y>'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}
autocmd FileType html,css,javascript.jsx EmmetInstall

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> jsbeautify
map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>


" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> autocompletion
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ack.vim
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ctrlp
let g:ctrlp_map='<Leader><Leader>p'
set runtimepath^=~/.vim/bundle/ctrlp.vim
" let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$',
    \ 'file': '\.exe$\|\.so$\|\.dat$'
    \ }

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> vim-node
set runtimepath^=~/.vim/bundle/node
autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> vim-javascript
let b:javascript_fold=1
let javascript_enable_domhtmlcss=1
let g:javascript_plugin_jsdoc = 1

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> numbertoggle
let g:NumberToggleTrigger="<F2>"

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> w0rp/ale
 let g:ale_linters = {
 \   'javascript': ['eslint'],
 \   'dart': ['language_server'],
 \}
let g:ale_javascript_eslint_executable = 'eslint'
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_open_list = 0 " auto close when no warning or error

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" nnoremap <Leader>f :ALEFix<CR>
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_keep_list_window_open = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'nerver'
let g:ale_cache_executable_check_failures = 1
let g:ale_list_vertical = 0

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_loc_list_height = 5
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" " ignore html file syntastic checking
" let g:syntastic_mode_map = { 'passive_filetypes': ['html'] }
" let g:syntastic_error_symbol = '❌'
" let g:syntastic_style_error_symbol = '⁉️'
" let g:syntastic_warning_symbol = '⚠️'
" let g:syntastic_style_warning_symbol = '💩'
" highlight link SyntasticErrorSign SignColumn
" highlight link SyntasticWarningSign SignColumn
" highlight link SyntasticStyleErrorSign SignColumn
" highlight link SyntasticStyleWarningSign SignColumn

"nnoremap <C-j> /<+.\{-1,}+><CR>c/+>/e<CR>
"inoremap <C-j> <ESC>/<+.\{-1,}+><CR>c/+>/e<CR>
