"=============================================================================
"     FileName: .vimrc
"         Desc: 一个vimer的配置
"       Author: chemf
"        Email: eoyohe@gmail.com
"     HomePage: eoyohe.cn
"      Version: 0.0.1
"   LastChange: 2019-08-15 19:47:05
"      History:
"=============================================================================
runtime! debian.vim

if has("syntax")
  syntax on "语法高亮
endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
" Highlight current line
" au WinLeave * set nocursorline nocursorcolumn
" au WinEnter * set cursorline cursorcolumn
" set cursorline cursorcolumn
" vim profiles

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'ervandew/supertab'
Plugin 'VundleVim/Vundle.vim'
Plugin 'gmarik/vundle'
Plugin 'Shougo/neocomplete.vim'
"树形结构目录插件
Plugin 'scrooloose/nerdtree'
"强大的自动补全插件
"Plugin 'Valloric/YouCompleteMe'
"据说很强的机器学习训练的补全插件，然并卵
"Plugin 'zxqfl/tabnine-vim'
"代码注释插件
Plugin 'scrooloose/nerdcommenter'
"代码块生成插件， 貌似没用到
"Plugin 'SirVer/ultisnips'
"markdown语法高亮插件
Plugin 'plasticboy/vim-markdown'
"markdown实时预览插件，需要nodejs插件instant-markdown-d支持, 鸡肋，markdown还是用typora舒服
"Plugin 'suan/vim-instant-markdown'
"json格式化文件 --下载太慢,需要翻墙
"Plugin 'axiaoxin/vim-json-line-format'
"状态栏插件
Plugin 'vim-airline/vim-airline'
"全局搜索窗口
Plugin 'vim-scripts/ctrlp.vim'
"撤销记录
Plugin 'mbbill/undotree'
"代码模板插件
"Plugin 'aperezdc/vim-template'
"代码搜索工具
Plugin 'mileszs/ack.vim'
let g:ackprg = 'rg --nogroup --nocolor --column'
"Plugin 'cSyntaxAfter'
"Python 补全提示插件
Plugin 'davidhalter/jedi-vim'
" 作者信息插件 安装好了后需要去将插件的目录名ftplugin 改为 plugin
Plugin 'feng409/AuthorInfo'
" 自动配对符号
Plugin 'auto-pairs'
Plugin 'taglist-plus'
" Python语法高亮
Plugin 'hdima/python-syntax'
" 多重括号高亮
Plugin 'luochen1990/rainbow'
" 函数栏
Plugin 'majutsushi/tagbar'
" csv 文件支持
Plugin 'chrisbra/csv.vim'
" airline 的 vcs支持
Plugin 'tpope/vim-fugitive'
" 环境替换插件，比如“替换为<
Plugin 'tpope/vim-surround'
" 缩进线, 花里花俏的，没配置到
Plugin 'Yggdroot/indentLine'
" 异步实时执行代码
Plugin 'metakirby5/codi.vim'
" 异步命令行执行代码，quickfix 显示
Plugin 'skywind3000/asyncrun.vim'
Plugin 'tell-k/vim-autopep8'
"Plugin 'vim-syntastic/syntastic'
"python 缩进
Plugin 'dantezhu/indent-python.vim'
"vim 中文文档
Plugin 'yianwillis/vimcdoc'
"dash 中文插件,Mac OS only
Plugin 'keith/investigate.vim'
" git 代码行状态插件
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
let g:investigate_use_dash=1
Plugin 'neoclide/coc.nvim'


"powerline{ 插件对应的配置信息
"set guifont=PowerlineSymbols for Powerline
"set guifont='Monospace\ Regular'
"}

" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.
"
" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'
" Plugin 'tpope/vim-fugitive'
"
" 来自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
" Plugin 'L9'
"
" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
" Plugin 'git://git.wincent.com/command-t.git'
" 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
" Plugin 'file:///home/gmarik/path/to/plugin'
"
" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" 安" 装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
" Plugi" n 'ascenator/L9', {'name': 'newL9'}
" 
""  你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
" "
" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后

"=====================jedi 配置 ==================
autocmd FileType python setlocal completeopt-=preview
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Q>"
let g:jedi#rename_command = "<leader>r"
"=================================================

"================== rainbow 配置 =================
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}
let g:rainbow_active = 1
"=================================================

" supertab 插件配置 tab键等同于<c-n> 因为默认为<c-p>
let g:SuperTabDefaultCompletionType = "<c-n>"

" ======== 设置自动生成的文本信息 ============
let g:vimrc_author='chemf' 
let g:vimrc_email='eoyohe@gmail.com' 
let g:vimrc_homepage='eoyohe.cn'
nmap <F4> :AuthorInfoDetect<cr>

"====== tabbar 配置 =========
nmap <C-Y> :TagbarToggle<CR>

"autocmd VimEnter * UndotreeToggle
nmap <C-U>  :UndotreeToggle<cr> "设置在通用模式下用Ctrl+t打开文件目录树

" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
" 当vim启动时自动切换当前目录到vim打开文件的目录
autocmd VimEnter * cd %:p:h
"autocmd VimEnter * NERDTreeToggle
autocmd VimEnter * wincmd p
nmap <C-T>  :NERDTreeToggle<cr> "设置在通用模式下用Ctrl+t打开文件目录树
"autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif


"让ycm支持Python的语义
let g:ycm_python_binary_path = 'python'

"switch syntax highlighting on, when the terminal has colors
"if (t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  "syntax on
"endif

" Javascript syntax hightlight
syntax enable

" " Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
"autocmd Syntax javascript set syntax=jquery

"ctrl的配置
let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
        \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
            \ }
            let g:ctrlp_working_path_mode=0
            let g:ctrlp_match_window_bottom=1
            let g:ctrlp_max_height=15
            let g:ctrlp_match_window_reversed=0
            let g:ctrlp_mruf_max=500
            let g:ctrlp_follow_symlinks=1

""""""""""""""""""""""""""""""""""""""""""""

"au BufReadPost,BufNewFile *.java colorscheme monokai
colorscheme desert
set nu! "显示行号
set smartindent
set autoindent

"Highlight current line 高亮当前行
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
set mouse=a		" Enable mouse usage (all modes)

set nocompatible              " 去除VI一致性,必须
set backspace=indent,eol,start " 设置退格键
filetype off                  " 必须

set t_Co=256
let g:Powerline_symbols = "fancy"
"
"设置黑色背景和solarized主题
set background=dark
"colorscheme solarized
"设置文件编码
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936
"tab键为四个空格
"设置编辑时一个TAB字符占多少个空格的位置。
set ts=4
" 使用每层缩进的空格数。
set sw=4
" 设置tab键为空格,制表符为noexpandtab
"set expandtab
"使用语法高亮定义代码折叠
set foldmethod=syntax
""打开文件是默认不折叠代码
set foldlevelstart=99
" 设置系统剪切板和vim默认剪切板同一个， 需要x11支持
"set clipboard^=unnamed,unnamedplus
"=============================================================
"=                   按键映射                                =
"=============================================================
nmap za :xa<cr>
nmap zq :qa!<cr>
nmap zp <C-W><C-W>
nmap <F2> :set paste<cr>
map <F3> :%!python -m json.tool<cr>
"ack.vim的配置
map <leader>a :Ack<space>
nmap <leader>[ :bp<cr>
nmap <leader>] :bn<cr>
" ==========================================================
"
" 自动运行配置
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'php'
				exec "!clear"
				exec "!time php -f %"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                exec "!time bash %"
        elseif &filetype == 'python'
                exec "!clear"
                exec "!time python3 %"
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
                exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
        elseif &filetype == 'awk'
				exec "!clear"
				exec "!time awk -f %"
        endif
endfunc

"====================airline配置=====================
let g:airline#extensions#tabline#enabled = 1
"文件分隔符
"let g:airline#extensions#tabline#left_alt_sep = '>'
"====================airline配置=====================

"====================indentLine配置=====================
let g:indentLine_enabled = 0
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_char='┆'
let g:indentLine_leadingSpaceChar = '.'
"====================indentLine配置=====================

augroup vimrc
    autocmd QuickFixCmdPost * botright copen 8
augroup END
augroup vimrc
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup END


nmap <C-H>  :w<cr> :bp<cr>
nmap <C-L>  :w<cr> :bn<cr> 
nmap <M-L>  :tabmove +<cr>
nmap <M-H>  :tabmove -<cr>
nmap <C-M>  :only<cr>

"====================vim-syntastic/syntastic 配置 ========
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"====================vim-syntastic/syntastic 配置 ========

" 相对行号
"set relativenumber

"==================== investigate 设置 ==================
nnoremap K :call investigate#Investigate('n')<CR>
vnoremap K :call investigate#Investigate('v')<CR>
"==================== investigate 设置 ==================

"==================== nerdcommenter 设置 ==================
if has('win32')
  nmap <C-/> <leader>c<Space>
  vmap <C-/> <leader>c<Space>
else
  nmap <C-_> <leader>c<Space>
  vmap <C-_> <leader>c<Space>
endif
"==================== nerdcommenter 设置 ==================
