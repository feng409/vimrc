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

" 设置包括vundle和初始化相关的runtime path
call plug#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plug 'ervandew/supertab'
Plug 'VundleVim/Vundle.vim'
Plug 'gmarik/vundle'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

"Plug 'Shougo/neocomplete.vim'
"树形结构目录插件
Plug 'scrooloose/nerdtree'
"代码注释插件
Plug 'scrooloose/nerdcommenter'
"代码块生成插件， 貌似没用到
"Plug 'SirVer/ultisnips'
"markdown语法高亮插件
Plug 'plasticboy/vim-markdown'
"状态栏插件
Plug 'vim-airline/vim-airline'
" airline 的 vcs支持
Plug 'tpope/vim-fugitive'
" git 代码行状态插件
Plug 'airblade/vim-gitgutter'
"全局搜索窗口
Plug 'vim-scripts/ctrlp.vim'
"撤销记录
Plug 'mbbill/undotree'
"代码模板插件
"Plug 'aperezdc/vim-template'
"代码搜索工具
Plug 'mileszs/ack.vim'
let g:ackprg = 'rg --nogroup --nocolor --column'
" 作者信息插件 安装好了后需要去将插件的目录名ftplugin 改为 plugin
Plug 'feng409/AuthorInfo'
" 多重括号高亮
Plug 'luochen1990/rainbow'
Plug 'yegappan/taglist'
" 函数栏
Plug 'majutsushi/tagbar'
" csv 文件支持
Plug 'chrisbra/csv.vim'
" 环境替换插件，比如“替换为<
Plug 'tpope/vim-surround'
" 异步实时执行代码
Plug 'metakirby5/codi.vim'
" 异步命令行执行代码，quickfix 显示
Plug 'skywind3000/asyncrun.vim'
"Plug 'tell-k/vim-autopep8'
"python 缩进
"Plug 'dantezhu/indent-python.vim'
"vim 中文文档
" Plug 'yianwillis/vimcdoc'
" 自动配对符号
" Plug 'auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim'

call plug#end()            " vundle 插件管理结束
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本

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

" " Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
"autocmd Syntax javascript set syntax=jquery

"ctrlp的配置
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
" filetype off                  " 必须

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
                exec "AsyncRun python3 $(VIM_FILEPATH)"
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

" 相对行号
"set relativenumber

"==================== nerdcommenter 设置 ==================
if has('win32')
  nmap <C-/> <leader>c<Space>
  vmap <C-/> <leader>c<Space>
else
  nmap <C-_> <leader>c<Space>
  vmap <C-_> <leader>c<Space>
endif
"==================== nerdcommenter 设置 ==================

"==================== coc 设置 ==================
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nmap <space>s :<leader><leader>s
nmap <space>w :<leader><leader>w
nmap <space>b :<leader><leader>b
nmap <space>e :<leader><leader>e
nmap <space>j :<leader><leader>j
nmap <space>k :<leader><leader>k