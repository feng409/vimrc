function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:vista_default_executive = 'coc'
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

nmap <C-Y> :Vista!!<CR>
