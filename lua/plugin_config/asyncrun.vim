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

augroup vimrc
    autocmd QuickFixCmdPost * botright copen 8
augroup END
augroup vimrc
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup END
