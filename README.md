# fevim(一份前端开发的vim配置文件)

## 安装

- 安装vundle
  - git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

- 配置文件
  - git clone https://github.com/wangqiangplus/vimer.git
  - mv ./vimer/vimrc ~/.vimrc && rm -rf ./vimer

- 安装插件
  - 进入vim
  - 运行命令:PluginInstall

## 主要包含:

- 快捷键设置

- 基本设置

- 插件管理(使用Vundle)

```
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
```
