# vimer(一份个人vim配置文件)

## 安装

- 安装vundle
  - git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

- 配置文件
  - git clone https://github.com/wungqiang/vimer.git
  - mv ./vimer/vimrc ~/.vimrc && rm -rf ./vimer

- 安装插件
  - 进入vim
  - 运行命令:PluginInstall


## ISSUES:

1.Taglist: Exuberant ctags (http://ctags.sf.net) not found in PATH. Plugin is not
loaded

answer:

Ubuntu and derivatives: ```sudo apt-get install exuberant-ctags```

With yum: ```sudo yum install ctags-etags```

## 主要包含:

- 快捷键设置

- 基本设置

- 插件管理(使用Vundle)
  * nerdtree
  * nerdcommenter
  * tagbar
  * ctrlp
  * syntastic
  * dash.vime
  * emmet-vim
  * vim-surround
  * supertab
  * vim-airline
  * vim-abolish
  * tabular
  * youcompleteme
  * vim-gitgutter
  * vim-less
  * scss-syntax.vime
  * vim-instant-markdown
  * 等

- 常用插件设置
